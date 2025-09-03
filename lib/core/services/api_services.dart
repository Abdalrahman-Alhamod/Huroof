import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

abstract class ApiServices {
  Future<dynamic> get(String path, {Map<String, String>? queryParams});

  Future<dynamic> post(
    String path, {
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? body,
    FormData? formData,
  });

  Future<dynamic> postFiles(
    String path, {
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? body,
    FormData? formData,
    String? key,
    void Function(int sent, int total)? onSendProgress,
  });

  Future<dynamic> postList(
    String path, {
    Map<String, String>? queryParams,
    List<dynamic>? body,
    FormData? formData,
  });

  Future<dynamic> put(
    String path, {
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? body,
    FormData? formData,
  });

  Future<dynamic> patch(
    String path, {
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? body,
    FormData? formData,
  });

  Future<dynamic> delete(
    String path, {
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? body,
  });

  Future<dynamic> reqHttp(
    String path, {
    Map<String, dynamic>? queryParams,
    Map<String, String> body = const {},
    String typeRequest = "POST",
    String? key,
    List<http.MultipartFile> multipartFile = const [],
  });
}
