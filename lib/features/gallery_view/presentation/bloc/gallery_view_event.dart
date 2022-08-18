class GalleryViewEvent{}

class FetchCacheData extends GalleryViewEvent{}

class FetchAlbums extends GalleryViewEvent{}

class FetchPhotos extends GalleryViewEvent{
  FetchPhotos(this.id);
  final int id;
}

class GalleryViewLoadingEvent extends GalleryViewEvent{}

class GalleryViewPhotoLoadingEvent extends GalleryViewEvent{
  GalleryViewPhotoLoadingEvent(this.id);
  final int id;
}

class GalleryViewPhotoSuccessEvent extends GalleryViewEvent{
  GalleryViewPhotoSuccessEvent(this.id);
  final int id;
}

class GalleryViewPhotoFailureEvent extends GalleryViewEvent{
  GalleryViewPhotoFailureEvent(this.id);
  final int id;
}

class GalleryViewSuccessEvent extends GalleryViewEvent{}

class GalleryViewSuccessFromCacheEvent extends GalleryViewEvent{}

class GalleryViewFailureEvent extends GalleryViewEvent{
  GalleryViewFailureEvent(this.message);
  final String message;
}