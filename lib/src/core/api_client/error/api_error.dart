import 'package:dio/dio.dart';

class ApiError {
  String? errorCode;
  String? errorMessage;

  ApiError({this.errorCode, this.errorMessage});

  static ApiError unknownError() {
    return ApiError(
      errorCode: 'Unknown',
      errorMessage: 'Something went wrong with the current service',
    );
  }

  static ApiError fromDioError(DioException e) {
    return ApiError(
      errorCode: e.response?.statusCode?.toString(),
      errorMessage: e.response?.statusMessage,
    );
  }
}
