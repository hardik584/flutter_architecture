


import 'package:demo/features/gallery_view/data/model/album_model.dart';
import 'package:demo/features/gallery_view/domain/repository/gallery_view_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';

class GetAlbums extends AlbumUseCase<List<AlbumModel>, void> {
  final GalleryRepository galleryRepository;

  GetAlbums({required this.galleryRepository});

  @override
  Future<Either<Failure, List<AlbumModel>>> call() async {
    return await galleryRepository.getAlbums();
  }

}