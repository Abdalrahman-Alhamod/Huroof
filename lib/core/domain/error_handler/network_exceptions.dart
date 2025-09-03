import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../entities/error_entity.dart';
part 'network_exceptions.freezed.dart';

@freezed
abstract class NetworkExceptions with _$NetworkExceptions implements Exception {
  const factory NetworkExceptions.requestCancelled() = RequestCancelled;

  const factory NetworkExceptions.firebaseAuthException(String message) =
      FireBaseAuthException;

  const factory NetworkExceptions.firebaseException(String message) =
      FireBaseException;

  const factory NetworkExceptions.unauthorizedRequest(String reason) =
      UnauthorizedRequest;
  const factory NetworkExceptions.loggingInRequired() = LoggingInRequired;

  const factory NetworkExceptions.badRequest() = BadRequest;

  const factory NetworkExceptions.notFound(String reason) = NotFound;

  const factory NetworkExceptions.methodNotAllowed() = MethodNotAllowed;

  const factory NetworkExceptions.notAcceptable() = NotAcceptable;

  const factory NetworkExceptions.requestTimeout() = RequestTimeout;

  const factory NetworkExceptions.sendTimeout() = SendTimeout;

  const factory NetworkExceptions.unprocessableEntity(String reason) =
      UnprocessableEntity;

  const factory NetworkExceptions.conflict() = Conflict;

  const factory NetworkExceptions.internalServerError() = InternalServerError;

  const factory NetworkExceptions.notImplemented() = NotImplemented;

  const factory NetworkExceptions.serviceUnavailable() = ServiceUnavailable;

  const factory NetworkExceptions.noInternetConnection() = NoInternetConnection;

  const factory NetworkExceptions.formatException() = FormatException;

  const factory NetworkExceptions.unableToProcess() = UnableToProcess;

  const factory NetworkExceptions.defaultError(String error) = DefaultError;

  const factory NetworkExceptions.unexpectedError() = UnexpectedError;

  static List<NetworkExceptions> getAllNetworkExceptions() {
    return [
      const NetworkExceptions.badRequest(),
      const NetworkExceptions.unauthorizedRequest(''),
      const NetworkExceptions.conflict(),
      const NetworkExceptions.defaultError(''),
      const NetworkExceptions.formatException(),
      const NetworkExceptions.internalServerError(),
      const NetworkExceptions.loggingInRequired(),
      const NetworkExceptions.methodNotAllowed(),
      const NetworkExceptions.noInternetConnection(),
      const NetworkExceptions.notFound(''),
      const NetworkExceptions.notAcceptable(),
      const NetworkExceptions.notImplemented(),
      const NetworkExceptions.requestCancelled(),
      const NetworkExceptions.unprocessableEntity(''),
      const NetworkExceptions.unexpectedError(),
      const NetworkExceptions.unableToProcess(),
      const NetworkExceptions.serviceUnavailable(),
      const NetworkExceptions.sendTimeout(),
    ];
  }

  static NetworkExceptions handleResponse(Response<dynamic>? response) {
    ErrorEntity errorModel = ErrorEntity.fromJson(jsonDecode(response?.data));

    int statusCode = response?.statusCode ?? 0;

    switch (statusCode) {
      case 400:
      case 401:
        return NetworkExceptions.unauthorizedRequest("${errorModel.message}");
      case 403:
        return const NetworkExceptions.loggingInRequired();
      case 404:
        return NetworkExceptions.notFound("${errorModel.message}");
      case 405:
        return const NetworkExceptions.methodNotAllowed();
      case 409:
        return const NetworkExceptions.conflict();
      case 408:
        return const NetworkExceptions.requestTimeout();
      case 422:
        return NetworkExceptions.unprocessableEntity("${errorModel.message}");
      case 500:
        return const NetworkExceptions.internalServerError();
      case 503:
        return const NetworkExceptions.serviceUnavailable();
      default:
        var responseCode = statusCode;
        return NetworkExceptions.defaultError(
          "Received invalid status code: $responseCode",
        );
    }
  }

  static NetworkExceptions getException(error) {
    // logger.e(error);
    if (error is Exception) {
      try {
        NetworkExceptions networkExceptions;
        if (error is DioException) {
          // logger.e(error.type);
          // logger.e(error.message);
          // logger.e(error.response);
          switch (error.type) {
            case DioExceptionType.cancel:
              networkExceptions = const NetworkExceptions.requestCancelled();
              break;
            case DioExceptionType.connectionTimeout:
              networkExceptions = const NetworkExceptions.requestTimeout();
              break;
            case DioExceptionType.unknown:
              networkExceptions =
                  const NetworkExceptions.noInternetConnection();
              break;
            case DioExceptionType.receiveTimeout:
              networkExceptions = const NetworkExceptions.sendTimeout();
              break;
            case DioExceptionType.badResponse:
              networkExceptions = NetworkExceptions.handleResponse(
                error.response,
              );
              break;

            case DioExceptionType.sendTimeout:
              networkExceptions = const NetworkExceptions.sendTimeout();
              break;
            case DioExceptionType.connectionError:
              networkExceptions =
                  const NetworkExceptions.noInternetConnection();
              break;
            case DioExceptionType.badCertificate:
              networkExceptions = const NetworkExceptions.methodNotAllowed();
              break;
          }
        } else if (error is SocketException) {
          networkExceptions = const NetworkExceptions.noInternetConnection();
        }
        // else if (error is FirebaseAuthException) {
        //   networkExceptions =
        //       NetworkExceptions.firebaseAuthException(error.message!);
        // } else if (error is FirebaseException) {
        //   networkExceptions =
        //       NetworkExceptions.firebaseException(error.message!);
        // }
        else {
          networkExceptions = const NetworkExceptions.unexpectedError();
        }
        return networkExceptions;
      } on FormatException {
        return const NetworkExceptions.formatException();
      } catch (_) {
        return const NetworkExceptions.unexpectedError();
      }
    } else {
      if (error.toString().contains("is not a subtype of")) {
        return const NetworkExceptions.unableToProcess();
      } else {
        return const NetworkExceptions.unexpectedError();
      }
    }
  }

  static String getErrorMessage(NetworkExceptions? networkExceptions) {
    //  return getErrorMessageTr(networkExceptions);
    var errorMessage = "";
    networkExceptions?.whenOrNull(
          notImplemented: () {
            errorMessage = "لم يتم التنفيذ";
          },
          requestCancelled: () {
            errorMessage = "تم إلغاء الطلب";
          },
          loggingInRequired: () {
            errorMessage = "يرجى تسجيل الدخول أولاً";
          },
          internalServerError: () {
            errorMessage = "خطأ في الخادم";
          },
          notFound: (String reason) {
            errorMessage = reason;
          },
          serviceUnavailable: () {
            errorMessage = "الخدمة غير متوفرة";
          },
          methodNotAllowed: () {
            errorMessage = "الطريقة غير مسموحة";
          },
          badRequest: () {
            errorMessage = "طلب غير صالح";
          },
          unauthorizedRequest: (String error) {
            errorMessage = error;
          },
          unprocessableEntity: (String error) {
            errorMessage = error;
          },
          unexpectedError: () {
            errorMessage = "حدث خطأ غير متوقع";
          },
          requestTimeout: () {
            errorMessage = "انتهت مهلة الاتصال";
          },
          noInternetConnection: () {
            errorMessage = "لا يوجد اتصال بالإنترنت";
          },
          conflict: () {
            errorMessage = "حدث تعارض في البيانات";
          },
          sendTimeout: () {
            errorMessage = "انتهت مهلة إرسال الطلب إلى الخادم";
          },
          unableToProcess: () {
            errorMessage = "تعذر معالجة البيانات";
          },
          defaultError: (String error) {
            errorMessage = error;
          },
          formatException: () {
            errorMessage = "حدث خطأ غير متوقع";
          },
          notAcceptable: () {
            errorMessage = "غير مقبول";
          },
          firebaseAuthException: (String message) {
            errorMessage = message;
          },
          firebaseException: (String message) {
            errorMessage = message;
          },
        ) ??
        '';

    return errorMessage;
  }
}
