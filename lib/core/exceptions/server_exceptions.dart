import 'package:dio/dio.dart';

class ServerException implements Exception {
  final String message;
  final int? statusCode;

  const ServerException(this.message, {this.statusCode});

  factory ServerException.fromDio(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.sendTimeout:
        return const ServerException('Превышено время ожидания соединения');

      case DioExceptionType.badResponse:
      // Здесь можно распарсить e.response?.data, если API присылает свои ошибки
        final status = e.response?.statusCode;
        if (status == 404) return const ServerException('Ресурс не найден', statusCode: 404);
        if (status == 500) return const ServerException('Ошибка на стороне сервера', statusCode: 500);
        return ServerException('$status', statusCode: status);

      case DioExceptionType.connectionError:
        return const ServerException('Нет подключения к интернету');

      case DioExceptionType.cancel:
        return const ServerException('Запрос был отменен');

      default:
        return const ServerException('Произошла непредвиденная ошибка сети');
    }
  }

  factory ServerException.unknown() => const ServerException('Что-то пошло не так');
}