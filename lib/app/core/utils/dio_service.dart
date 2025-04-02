import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:easy_vat_v2/app/core/resources/pref_resources.dart';
import 'package:easy_vat_v2/app/core/resources/url_resources.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DioService {
  late final Dio _dio;

  DioService() {
    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
      ),
    );

    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        String? accessToken = await _getAccessToken();
        if (accessToken != null) {
          options.headers["Authorization"] = "Bearer $accessToken";
        }
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
  }

  Dio get dio => _dio;

  Future<String?> _getAccessToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(PrefResources.token);
  }
}

final dioProvider = Provider<Dio>((ref) {
  return DioService().dio;
});
