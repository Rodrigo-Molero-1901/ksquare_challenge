import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';

import '../error/api_error.dart';

abstract final class ApiUtils {
  static Future<Either<ApiError, T>> handleApiCall<T>(
    Future<Response<T>> Function() apiCall,
  ) async {
    try {
      final response = await apiCall();
      return response.data != null
          ? Right(response.data as T)
          : Left(ApiError.unknownError());
    } on DioException catch (e) {
      return Left(ApiError.fromDioError(e));
    }
  }
}
