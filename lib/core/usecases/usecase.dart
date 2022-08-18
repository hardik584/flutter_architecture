import 'package:demo/features/gallery_view/data/model/album_model.dart';
import 'package:dartz/dartz.dart';
import '../../features/gallery_view/data/model/photos_model.dart';
import '../error/failures.dart';

abstract class AlbumUseCase<Type, Params> {
  Future<Either<Failure, List<AlbumModel>>> call();
}

abstract class PhotosUseCase<Type, Params> {
  Future<Either<Failure, List<PhotoModel>>> call({required int id});
}

