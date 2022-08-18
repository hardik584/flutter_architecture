


import 'package:demo/features/gallery_view/data/model/album_model.dart';
import 'package:demo/features/gallery_view/domain/repository/gallery_view_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../data/model/photos_model.dart';

class GetPhotos extends PhotosUseCase<List<AlbumModel>, void> {
  final GalleryRepository galleryRepository;

  GetPhotos({required this.galleryRepository});

  @override
  Future<Either<Failure, List<PhotoModel>>> call({required int id}) async {
    return await galleryRepository.getPhotos(id);
  }

}