import 'package:demo/features/gallery_view/data/datasource/gallery_view_datasource.dart';
import 'package:demo/features/gallery_view/data/model/album_model.dart';
import 'package:demo/core/error/failures.dart';
import 'package:demo/features/gallery_view/data/model/photos_model.dart';
import 'package:demo/features/gallery_view/domain/repository/gallery_view_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/base/response_wrapper.dart';

class GalleryRepositoryImpl extends GalleryRepository {
  GalleryRepositoryImpl({required this.galleryViewDataSource});

  final GalleryViewDataSource galleryViewDataSource;

  @override
  Future<Either<Failure, List<AlbumModel>>> getAlbums() async {
    try {
      ResponseWrapper<List<AlbumModel>> baseResponse =
          await galleryViewDataSource.getAlbums();

      if (baseResponse.hasException) {
        return Left(
            ServerFailure(await baseResponse.getException.errorMessage));
      } else {
        return Right(baseResponse.getData);
      }
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<PhotoModel>>> getPhotos(int id) async {
    try {
      ResponseWrapper<List<PhotoModel>> baseResponse =
          await galleryViewDataSource.getPhotos(id: id);

      if (baseResponse.hasException) {
        return Left(
            ServerFailure(await baseResponse.getException.errorMessage));
      } else {
        return Right(baseResponse.getData);
      }
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
