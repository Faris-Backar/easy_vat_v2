import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:easy_vat_v2/app/core/resources/url_resources.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioService {
  late final Dio _dio;

  DioService() {
    _dio = Dio(
      BaseOptions(
          baseUrl: UrlResources.baseUrl,
          connectTimeout: const Duration(seconds: 30),
          receiveTimeout: const Duration(seconds: 30),
          headers: {
            "Authorization":
                "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFkbWluIiwidXNlcmlkIjoiZTY2NTgwZmQtMjNlNC1lYzExLTk4MjUtMDA2OGViY2EwMjQ4IiwibmJmIjoxNzQwNTg4OTQyLCJleHAiOjE3NDMxODA5NDIsImlhdCI6MTc0MDU4ODk0Mn0.Js8fjXHygPJv91xroVsMASJGmd-oKXipSICKn3kxTIQ"
          }),
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
    if (kDebugMode) {
      _dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        compact: false,
      ));
    }
  }

  Dio get dio => _dio;
}

final dioProvider = Provider<Dio>((ref) {
  return DioService().dio;
});
