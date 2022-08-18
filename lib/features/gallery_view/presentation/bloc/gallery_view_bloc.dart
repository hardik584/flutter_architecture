import 'dart:convert';
import 'package:demo/core/constant/strings.dart';
import 'package:demo/features/gallery_view/data/model/album_model.dart';
import 'package:demo/features/gallery_view/data/model/photos_model.dart';
import 'package:demo/features/gallery_view/domain/usecase/album_usecase.dart';
import 'package:demo/features/gallery_view/presentation/bloc/gallery_view_event.dart';
import 'package:demo/features/gallery_view/presentation/bloc/gallery_view_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/database/database_helper.dart';
import '../../../../core/error/failures.dart';
import '../../data/model/gallery_model.dart';
import '../../domain/usecase/photos_usecase.dart';

class GalleryViewBloc extends Bloc<GalleryViewEvent, GalleryViewState> {
  final GetAlbums getAlbumsUseCase;
  final GetPhotos getPhotosUseCase;
  List<GalleryModel> galleryList = [];
  final dbHelper = DatabaseHelper.instance;

  GalleryViewBloc(this.getAlbumsUseCase, this.getPhotosUseCase)
      : super(GalleryViewState()) {
    on<FetchAlbums>((event, emit) => fetchAlbums());

    on<FetchCacheData>((event, emit) => fetchCacheData());

    on<FetchPhotos>((event, emit) => fetchPhotos(event.id));

    on<GalleryViewLoadingEvent>(
        (event, emit) => emit(GalleryViewLoadingState()));
    
    on<GalleryViewSuccessFromCacheEvent>(
        (event, emit) => emit(GalleryViewSuccessFromCacheState()));

    on<GalleryViewPhotoLoadingEvent>(
        (event, emit) => emit(GalleryViewPhotoLoadingState(event.id)));

    on<GalleryViewPhotoSuccessEvent>(
        (event, emit) => emit(GalleryViewPhotoSuccessState(event.id)));

    on<GalleryViewFailureEvent>(
        (event, emit) => emit(GalleryViewFailureState(event.message)));

    on<GalleryViewSuccessEvent>(
        (event, emit) => emit(GalleryViewSuccessState()));
  }

  fetchAlbums() {
    try {
      add(GalleryViewLoadingEvent());
      getAlbumsUseCase().then((value) {
        value.fold((Failure left) {
          add(GalleryViewFailureEvent(getMessage(left)));
        }, (List<AlbumModel> right) async {
          for (int i = 0; i < right.length; i++) {
            galleryList.add(GalleryModel(right[i].id ?? 0, right[i], []));
            Map<String, dynamic> row = {
              DatabaseHelper.columnAlbumId: right[i].id ?? 0,
              DatabaseHelper.columnAlbum: json.encode(right[i].toJson()),
              DatabaseHelper.columnPhotos: json.encode([])
            };
            await dbHelper.insert(row);
          }
          add(GalleryViewSuccessEvent());
        });
      });
    } catch (e) {
      add(GalleryViewFailureEvent(e.toString()));
    }
  }

  fetchPhotos(int id) {
    try {
      add(GalleryViewPhotoLoadingEvent(id));
      getPhotosUseCase(id: id).then((value) {
        value.fold((Failure left) {
          add(GalleryViewPhotoFailureEvent(id));
        }, (List<PhotoModel> right) async {
          galleryList[id - 1].photoList = right;
          Map<String, dynamic> row = {
            DatabaseHelper.columnId: id,
            DatabaseHelper.columnPhotos:
                jsonEncode(right.map((e) => e.toJson()).toList())
          };
          await dbHelper.update(row);
          add(GalleryViewPhotoSuccessEvent(id));
        });
      });
    } catch (e) {
      add(GalleryViewPhotoFailureEvent(id));
    }
  }

  fetchCacheData() async {
    try {
      add(GalleryViewLoadingEvent());
      final allRows = await dbHelper.queryAllRows();
      if (allRows.isNotEmpty) {
        for (int i = 0; i < allRows.length; i++) {
          galleryList.add(GalleryModel(
              allRows[i][id] ?? 0,
              AlbumModel.fromJson(jsonDecode(allRows[i][album])),
              List<PhotoModel>.from(jsonDecode(allRows[i][photoList])
                  .map((p) => PhotoModel.fromJson(p)))));
        }
        add(GalleryViewSuccessFromCacheEvent());
      }else{
        add(FetchAlbums());
      }
    } catch (e) {
      add(GalleryViewFailureEvent(e.toString()));
    }
  }
}
