import 'package:demo/features/gallery_view/data/model/photos_model.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
import '../../features/gallery_view/data/model/album_model.dart';
import 'api_base.dart';
import 'apis.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: apiBaseURL)
abstract class ApiClient {
  factory ApiClient(Dio dio) {
    return _ApiClient(dio);
  }

  @GET(Apis.albums)
  Future<List<AlbumModel>> getAlbums();

  @GET(Apis.photos)
  Future<List<PhotoModel>> getPhotos(
      {@Query('albumId') required int id});
}
