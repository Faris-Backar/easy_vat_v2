import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:easy_vat_v2/app/core/resources/url_resources.dart';

class DioService {
  late final Dio _dio;

  DioService() {
    _dio = Dio(
      BaseOptions(
        baseUrl: UrlResources.baseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
      ),
    );

    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        return handler.next(options);
      },
      onResponse: (response, handler) {
        return handler.next(response);
      },
      onError: (DioException error, handler) {
        log('Dio Error: ${error.response?.data}');
        return handler.next(error);
      },
    ));
    // _dio.interceptors.add(PrettyDioLogger(
    //   requestHeader: true,
    //   requestBody: true,
    //   responseBody: true,
    //   responseHeader: false,
    //   compact: false,
    // ));
  }

  Dio get dio => _dio;
}
