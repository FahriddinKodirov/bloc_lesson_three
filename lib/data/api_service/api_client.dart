import 'package:bloc_lesson_three/data/api_service/custom_exceptions.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

const String baseUrl = 'https://easyenglishuzb.free.mockoapp.net';

class ApiClient {
  ApiClient() {
    _init();
  }

  late Dio dio;

  _init() {
    dio = Dio(BaseOptions(
      connectTimeout: 25000,
      receiveTimeout: 20000,
      baseUrl: baseUrl,
    ));

    dio.interceptors.add(InterceptorsWrapper(
      onError: (DioError error, ErrorInterceptorHandler handler) {
        print("ON ERRORGA KIRDI:${error.toString()}");
        switch (error.type) {
          case DioErrorType.connectTimeout:
          case DioErrorType.sendTimeout:
            throw DeadlineExceededException(error.requestOptions);
          case DioErrorType.receiveTimeout:
            throw ReceiveTimeOutException(error.requestOptions);
          case DioErrorType.response:
            switch (error.response?.statusCode) {
              case 400:
                throw BadRequestException(error.response?.data['message']);
              case 401:
                throw UnauthorizedException(error.requestOptions);
              case 404:
                throw NotFoundException(error.requestOptions);
              case 409:
                throw ConflictException(error.requestOptions);
              case 500:
              case 501:
              case 503:
                throw InternalServerErrorException(error.requestOptions);
            }
            break;
          case DioErrorType.cancel:
            break;
          case DioErrorType.other:
            throw NoInternetConnectionException(error.requestOptions);
        }
        debugPrint('Error Status Code:${error.response?.statusCode}');
        return handler.next(error);
      },
      onRequest: (options, handler) {
        print('sorov yuborildi');
        String currentLocale = "uz";
        options.headers["Accept"] = "application/json";
        options.headers["Accept-Language"] =
            currentLocale.isEmpty ? "ru" : currentLocale;
        return handler.next(options);
      },
      onResponse: (e, handler) {
        print('response keldi');
        return handler.next(e);
      },
    ));
  }
}
