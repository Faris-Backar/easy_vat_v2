import 'package:dio/dio.dart';
import 'package:easy_vat_v2/app/core/utils/dio_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dioProviders = Provider<Dio>(
  (ref) => DioService().dio,
);
