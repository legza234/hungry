import 'package:dio/dio.dart';
import 'package:hungry/core/network/api_error.dart';

class ApiException {
  final String message;

  ApiException({required this.message});

  static ApiError handleError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return ApiError(message: "Connection timeout with API server");
      case DioExceptionType.sendTimeout:
        return ApiError(message: "Send timeout in connection with API server");
      case DioExceptionType.receiveTimeout:
        return ApiError(message: "Receive timeout in connection with API server");
      case DioExceptionType.badResponse:
        return ApiError(
          message: error.response?.statusMessage ?? "Something went wrong",
          statuescodes: error.response?.statusCode,
        );
      case DioExceptionType.cancel:
        return ApiError(message: "Request to API server was cancelled");
      case DioExceptionType.unknown:
        if (error.message?.contains('SocketException') ?? false) {
          return ApiError(message: 'No Internet Connection');
        }
        return ApiError(message: 'Unexpected error occurred');
      default:
        return ApiError(message: "Something went wrong");
    }
  }
}
