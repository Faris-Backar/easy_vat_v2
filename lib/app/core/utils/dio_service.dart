import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:easy_vat_v2/app/core/resources/pref_resources.dart';
import 'package:flutter/foundation.dart';
// import 'package:easy_vat_v2/app/core/resources/url_resources.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DioService {
  late final Dio _dio;

  DioService() {
    _dio = Dio(
      BaseOptions(
        // baseUrl: baseUrl,
        baseUrl: "https://easyvatapi.microzys.in/",
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
      ),
    );

    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        String? accessToken = await _getAccessToken();
        if (accessToken != null) {
          if (kDebugMode) {
            log("accessToken => $accessToken");
          }
          options.headers["Authorization"] = "Bearer $accessToken";
        }
        if (kDebugMode) {
          log("Connection url => ${options.baseUrl}${options.path}");
          log("Body => ${json.encode(options.data)}");
        }
        return handler.next(options);
      },
      onResponse: (response, handler) {
        if (kDebugMode) {
          log("API Response => ${json.encode(response.data)}");
        }
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
