import 'dart:developer';
import 'dart:io';
import 'package:demo/core/base/response_wrapper.dart';
import 'package:dio/dio.dart' hide Headers;

class ServerError implements Exception {
  int? _errorCode;
  String _errorMessage = 'Something went wrong';

  ServerError.withError({DioError? error}) {
    _handleError(error!);
  }

  int get errorCode {
    return _errorCode ?? 0;
  }

  Future<String> get errorMessage async {
    var isConnected = await checkConnection();
    if (!isConnected) {
      _errorMessage = 'Please check your internet connection!';
    }
    return _errorMessage;
  }

  static Future<bool> checkConnection() async {
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
      return false;
    } on SocketException catch (_) {
      return false;
    }
  }

  Future<void> _handleError(DioError error) async {
    log('#### error : $error');
    // ignore: unnecessary_null_comparison
    if (error == null) {
      _errorMessage = 'Something went wrong';
      return;
    }

    log('### API : ${error.requestOptions.uri}');
    log('### Method : ${error.requestOptions.method}');
    log('### Parameters : ${error.requestOptions.data}');
    log('### queryParameters : ${error.requestOptions.queryParameters}');
    log('### statusCode : ${error.response?.statusCode} ');
    log('### headers : ${error.requestOptions.headers} ');
    log('### statusMessage : ${error.response?.statusMessage} ');
    log('### response : ${error.response} ');
    log('### response.data : ${error.response?.data} ');
    log('### _handleError : ${error.toString()} ');
    switch (error.type) {
      case DioErrorType.cancel:
        _errorMessage = 'Request was cancelled';
        break;
      case DioErrorType.connectTimeout:
        _errorMessage = 'Connection timeout';
        break;
      case DioErrorType.other:
        if (error.response != null) {
          _errorMessage = error.response!.statusMessage!;
        }
        //_errorMessage = "Connection failed due to internet connection";
        break;
      case DioErrorType.receiveTimeout:
        _errorMessage = 'Receive timeout in connection';
        break;
      case DioErrorType.response:
        if (error.response != null) {
          var msg = _handleServerError(error.response);
          log('msg ---- > $msg');
          if (msg.isEmpty) {
            msg = error.toString();
          }
          _errorMessage = msg;
        }
        break;
      case DioErrorType.sendTimeout:
        _errorMessage = 'Receive timeout in send request';
        break;
    }
    if (_errorMessage.isEmpty) {
      _errorMessage = 'Something went wrong';
    }
  }

  static String _handleServerError(response) {
    if (response == null) {
      return 'Something went wrong';
    }
    if (response.statusCode == 404) {
      return 'Something went wrong';
    }
    if (response.statusCode == 402) {
      return 'Something went wrong';
    }
    if (response.statusCode == 502) {
      return 'Something went wrong';
    }
    if (response.statusCode == 400) {
      return response.data['message'];
    }
    if (response.statusCode == 401) {
      return response.data['message'];
    }
    if (response.statusCode == 503) {
      return 'Something went wrong';
    }
    if (response.statusCode == 500) {
      return response.data['message'];
    }
    if (response.statusCode == 409) {
      return response.data['message'];
    }
    if (response.statusCode == 403) {
      // Get.offAllNamed(Routes.welcome);
    }
    if (response.statusCode == 401) {
      // SharedPrefUtils.clearSharedPref();
      // Get.offAllNamed(Routes.welcome);
      return response.statusMessage;
    }
    if (response != null && response.runtimeType == String) {
      return response.toString();
    }
    if (response.data != null && response.data.runtimeType == String) {
      return response.data;
    }
    if (response.data != null) {
      return response.data.toString();
    }
    return '';
  }

  static ResponseWrapper<T> apiExceptionHandle<T>(dynamic error) {
    var responseWrapper = ResponseWrapper<T>();
    if (error is DioError) {
      responseWrapper.setException(ServerError.withError(error: error));
    } else {
      responseWrapper.setException(ServerError.withError(error: null));
    }
    return responseWrapper;
  }
}
