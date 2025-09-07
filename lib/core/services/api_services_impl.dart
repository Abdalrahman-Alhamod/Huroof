import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:get/instance_manager.dart';
import 'package:http/http.dart' as http;

import '../../../../core/data/sources/remote/app_url.dart';
import '../functions/fake_delay.dart';
import 'api_services.dart';
import 'storage_service.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

late Map<String, dynamic> _headers;

Future<void> setHeaders() async {
  _headers = {
    "Accept": Headers.jsonContentType,
    "Accept-Timezone": DateTime.now().timeZoneName,
    "Accept-Language": Get.locale?.languageCode,
    "Authorization": "Bearer ${Get.find<StorageService>().apiToken}",
  };
}

dynamic _parseJsonResponse(Response<dynamic> response) {
  final responseAsJson = jsonDecode(response.data ?? "{}");
  return responseAsJson;
}

class ApiServicesImpl extends GetxService implements ApiServices {
  final Dio _dio = Get.find<Dio>();

  ApiServicesImpl() {
    _dio.options
      ..baseUrl = AppUrl.baseServ
      ..responseType = ResponseType.plain
      ..sendTimeout = const Duration(minutes: 1)
      ..receiveTimeout = const Duration(minutes: 1)
      ..connectTimeout = const Duration(minutes: 1)
      ..followRedirects = true;

    if (kDebugMode) {
      _dio.interceptors.add(
        PrettyDioLogger(
          requestBody: true,
          requestHeader: true,
          responseHeader: true,
          request: true,
          responseBody: true,
        ),
      );
    }
  }

  @override
  Future<dynamic> delete(
    String path, {
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? body,
  }) async {
    try {
      await setHeaders();
      final response = await _dio.delete(
        path,
        queryParameters: queryParams,
        data: body,
        options: Options(headers: _headers),
      );
      return _parseJsonResponse(response);
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<dynamic> get(
    String path, {
    Map<String, String>? queryParams,
    bool? hasToken,
  }) async {
    try {
      await setHeaders();
      final response = await _dio.get(
        path,
        queryParameters: queryParams,
        options: Options(headers: _headers),
      );
      await fakeDelay();
      return _parseJsonResponse(response);
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<dynamic> post(
    String path, {
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? body,
    FormData? formData,
    bool? hasToken,
  }) async {
    try {
      await setHeaders();

      final response = await _dio.post(
        path,
        queryParameters: queryParams,
        data: formData ?? body,
        options: Options(
          headers: _headers,
          contentType: Headers.jsonContentType,
        ),
      );
      await fakeDelay();
      return _parseJsonResponse(response);
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<dynamic> reqHttp(
    String path, {
    Map<String, dynamic>? queryParams,
    Map<String, String> body = const {},
    String typeRequest = "POST",
    String? key,
    List<http.MultipartFile> multipartFile = const [],
    bool? hasToken,
  }) async {
    try {
      await setHeaders();
      var headers = {"Accept": "application/json"};
      if (hasToken ?? true) {
        String token = "Bearer ${Get.find<StorageService>().apiToken}";
        headers['Authorization'] = token;
      }
      final mRequest =
          http.MultipartRequest(typeRequest, Uri.parse(path))
            ..files.addAll(multipartFile)
            ..fields.addAll(body)
            ..headers.addAll(headers);

      final response = await mRequest.send().timeout(
        const Duration(minutes: 1),
      );
      return jsonDecode(await response.stream.transform(utf8.decoder).first);
    } catch (error) {
      //BlocProvider.of<UploadManagerCubit>(context).failureUploadFile(key:key);
      rethrow;
    }
  }

  @override
  Future<dynamic> postFiles(
    String path, {
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? body,
    String? key,
    FormData? formData,
    bool? hasToken,
    void Function(int sent, int total)? onSendProgress,
  }) async {
    try {
      await setHeaders();

      final response = await _dio.post(
        path,
        queryParameters: queryParams,
        data: formData ?? body,
        options: Options(
          headers: _headers,
          contentType:
              formData != null
                  ? Headers.multipartFormDataContentType
                  : Headers.jsonContentType,
        ),
        onSendProgress: onSendProgress,
        onReceiveProgress: (sent, total) {
          // if (total != -1) {
          //   var progress = (sent / total * 100).toStringAsFixed(0);
          //   print('Download progress: $progress%');
          // }
        },
      );
      // BlocProvider.of<UploadManagerCubit>(context).completeUploadFile(key: key);
      return _parseJsonResponse(response);
    } catch (error) {
      // BlocProvider.of<UploadManagerCubit>(context).failureUploadFile(key: key);
      rethrow;
    }
  }

  @override
  Future<dynamic> postList(
    String path, {
    Map<String, String>? queryParams,
    List<dynamic>? body,
    FormData? formData,
    bool? hasToken,
  }) async {
    try {
      await setHeaders();
      final response = await _dio.post(
        path,
        queryParameters: queryParams,
        data: formData ?? body,
        options: Options(
          headers: _headers,
          contentType: Headers.jsonContentType,
        ),
      );
      return _parseJsonResponse(response);
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<dynamic> put(
    String path, {
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? body,
    FormData? formData,
    bool? hasToken,
  }) async {
    try {
      await setHeaders();

      final response = await _dio.put(
        path,
        queryParameters: queryParams,
        data: formData ?? body,
        options: Options(
          headers: _headers,
          contentType: Headers.jsonContentType,
        ),
      );
      return _parseJsonResponse(response);
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<dynamic> patch(
    String path, {
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? body,
    FormData? formData,
    bool? hasToken,
  }) async {
    try {
      await setHeaders();
      final response = await _dio.patch(
        path,
        queryParameters: queryParams,
        data: formData ?? body,
        options: Options(
          headers: _headers,
          contentType: Headers.jsonContentType,
        ),
      );
      return _parseJsonResponse(response);
    } catch (error) {
      rethrow;
    }
  }
}
