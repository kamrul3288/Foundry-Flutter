import 'package:dio/dio.dart';

class RequestQueueItem {
  final RequestOptions options;
  final ErrorInterceptorHandler handler;

  RequestQueueItem(this.options, this.handler);
}
