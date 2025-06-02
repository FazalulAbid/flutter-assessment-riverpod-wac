import 'package:dio/dio.dart';
import 'package:flutter_assessment/core/domain/models/either.dart';
import 'package:flutter_assessment/core/exceptions/http_exception.dart';
import 'package:flutter_assessment/main/app_env.dart';

class DioClient {
  late final Dio _dio;

  DioClient({String? baseUrl}) {
    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl ?? EnvInfo.connectionString,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    _dio.interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
        logPrint: (object) => print(object),
      ),
    );

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          // options.headers['Authorization'] = 'Bearer $token';
          handler.next(options);
        },
        onError: (error, handler) {
          print('Dio Error: ${error.message}');
          handler.next(error);
        },
      ),
    );
  }

  Future<Either<AppException, T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    required T Function(Map<String, dynamic>) fromJson,
  }) async {
    try {
      final response = await _dio.get(path, queryParameters: queryParameters);
      return Right(fromJson(response.data));
    } on DioException catch (e) {
      return Left(_handleDioException(e));
    } catch (e) {
      return Left(
        AppException(
          message: e.toString(),
          statusCode: 0,
          identifier: 'Unknown error',
        ),
      );
    }
  }

  AppException _handleDioException(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return AppException(
          message: 'Connection timeout',
          statusCode: 408,
          identifier: 'CONNECTION_TIMEOUT',
        );
      case DioExceptionType.sendTimeout:
        return AppException(
          message: 'Send timeout',
          statusCode: 408,
          identifier: 'SEND_TIMEOUT',
        );
      case DioExceptionType.receiveTimeout:
        return AppException(
          message: 'Receive timeout',
          statusCode: 408,
          identifier: 'RECEIVE_TIMEOUT',
        );
      case DioExceptionType.badResponse:
        return AppException(
          message: e.response?.data?['message'] ?? 'Bad response',
          statusCode: e.response?.statusCode ?? 400,
          identifier: 'BAD_RESPONSE',
        );
      case DioExceptionType.cancel:
        return AppException(
          message: 'Request cancelled',
          statusCode: 0,
          identifier: 'REQUEST_CANCELLED',
        );
      case DioExceptionType.connectionError:
        return AppException(
          message: 'Connection error',
          statusCode: 0,
          identifier: 'CONNECTION_ERROR',
        );
      default:
        return AppException(
          message: e.message ?? 'Unknown error',
          statusCode: 0,
          identifier: 'UNKNOWN_ERROR',
        );
    }
  }
}
