import '../../../domain/error_handler/network_exceptions.dart';
import '../../../utils/logger.dart';

typedef OnLoading = void Function();
typedef OnSuccess<T> = void Function(T data);
typedef OnFailure = void Function(String errorMessage);

/// Utility class to handle API requests
class ApiRequest {
  /// Handles an API call and wraps it in ApiResponse with success/failure callbacks
  static Future<void> handle<T>({
    required Future<T> Function() request,
    required OnLoading onLoading,
    required OnSuccess<T> onSuccess,
    required OnFailure onFailure,
  }) async {
    try {
      onLoading();

      // Make the API call
      final T response = await request();

      logger.print(
        response,
        color: PrintColor.cyan,
        title: "API Request Reponse",
      );

      onSuccess(response);
    } catch (error) {
      // Handle exceptions and return failure
      final networkExceptionMessage = NetworkExceptions.getErrorMessage(
        NetworkExceptions.getException(error),
      );
      logger.print(
        networkExceptionMessage,
        color: PrintColor.red,
        title: "API Request Error",
      );
      onFailure(networkExceptionMessage);
    }
  }
}
