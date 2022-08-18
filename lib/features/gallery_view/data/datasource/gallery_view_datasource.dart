import 'package:demo/features/gallery_view/data/model/album_model.dart';
import 'package:demo/features/gallery_view/data/model/photos_model.dart';

import '../../../../core/base/response_wrapper.dart';
import '../../../../core/base/server_error.dart';
import '../../../../core/retrofit/api_client.dart';
import '../../../../di/injector.dart';

abstract class GalleryViewDataSource {
  Future<ResponseWrapper<List<AlbumModel>>> getAlbums();
  Future<ResponseWrapper<List<PhotoModel>>> getPhotos({required int id});
}

class GalleryViewDataSourceImpl extends GalleryViewDataSource {
  ApiClient apiClient = sl();

  @override
  Future<ResponseWrapper<List<AlbumModel>>> getAlbums() async {
    try {
      var responseWrapper = ResponseWrapper<List<AlbumModel>>();

      List<AlbumModel> baseResponse = await apiClient.getAlbums();

      responseWrapper.setData(baseResponse);
      return responseWrapper;
    } catch (e) {
      return ServerError.apiExceptionHandle<List<AlbumModel>>(e);
    }
  }
  
  @override
  Future<ResponseWrapper<List<PhotoModel>>> getPhotos({required int id}) async {
    try {
      var responseWrapper = ResponseWrapper<List<PhotoModel>>();

      List<PhotoModel> baseResponse = await apiClient.getPhotos(id: id);

      responseWrapper.setData(baseResponse);
      return responseWrapper;
    } catch (e) {
      return ServerError.apiExceptionHandle<List<PhotoModel>>(e);
    }
  }
}
