class GalleryViewState {}

class GalleryViewLoadingState extends GalleryViewState {}

class GalleryViewPhotoLoadingState extends GalleryViewState {
  GalleryViewPhotoLoadingState(this.id);
  final int id;
}

class GalleryViewPhotoSuccessState extends GalleryViewState {
  GalleryViewPhotoSuccessState(this.id);
  final int id;
}

class GalleryViewSuccessState extends GalleryViewState {}

class GalleryViewSuccessFromCacheState extends GalleryViewState {}

class GalleryViewFailureState extends GalleryViewState {
  GalleryViewFailureState(this.message);

  final String message;
}
