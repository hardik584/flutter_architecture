import 'package:demo/features/gallery_view/data/model/album_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../data/model/photos_model.dart';

abstract class GalleryRepository{
  Future<Either<Failure, List<AlbumModel>>> getAlbums();
  Future<Either<Failure, List<PhotoModel>>> getPhotos(int id);
}