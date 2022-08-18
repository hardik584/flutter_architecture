import 'package:dio/dio.dart';
import 'apis.dart';

class DioClient {
  static final Dio _dio = Dio();
  static List<String> noAuthUrl = [
    Apis.albums,
    Apis.photos
    ];
  static Dio getInstance() {
    // (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
    //     (HttpClient client) {
    //   client.badCertificateCallback =
    //       (X509Certificate cert, String host, int port) => true;
    //   return client;
    // };
    _initializeInterceptors();
    return _dio;
  }

  static _initializeInterceptors() {
    _dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      if (!noAuthUrl.contains(options.path)) {
        final header = {
          'content-type': 'application/json',
          // 'Authorization': 'Bearer ' + (SharedPrefUtils.getUserToken() ?? '')
        };
        options.headers = header;
      }
      options.connectTimeout = 200000;
      return handler.next(options);
    }, onResponse: (response, handler) {
      return handler.next(response);
    }, onError: (DioError e, handler) {
      return handler.next(e);
    }));

    _dio.interceptors
        .add(LogInterceptor(responseBody: true, requestBody: true));
  }
}
