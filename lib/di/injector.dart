import 'package:demo/features/gallery_view/data/datasource/gallery_view_datasource.dart';
import 'package:demo/features/gallery_view/data/repository/gallery_view_repository_impl.dart';
import 'package:demo/features/gallery_view/domain/repository/gallery_view_repository.dart';
import 'package:demo/features/gallery_view/presentation/bloc/gallery_view_bloc.dart';
import 'package:get_it/get_it.dart';

import '../core/retrofit/api_client.dart';
import '../core/retrofit/dio_client.dart';
import '../features/gallery_view/domain/usecase/album_usecase.dart';
import '../features/gallery_view/domain/usecase/photos_usecase.dart';

GetIt sl = GetIt.instance;

Future setup() async {
  sl.registerSingleton(DioClient.getInstance());

  sl.registerSingleton(ApiClient(sl()));

  //Bloc
  sl.registerLazySingleton(() => GalleryViewBloc(sl(), sl()));

  //Usecase
  sl.registerLazySingleton(() => GetAlbums(galleryRepository: sl()));
  sl.registerLazySingleton(() => GetPhotos(galleryRepository: sl()));

  //Repository
  sl.registerLazySingleton<GalleryRepository>(
      () => GalleryRepositoryImpl(galleryViewDataSource: sl()));
  
  //DataSource
  sl.registerLazySingleton<GalleryViewDataSource>(() => GalleryViewDataSourceImpl());


}
