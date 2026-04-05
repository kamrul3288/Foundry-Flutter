import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final _dioProvider = Provider((ref) => Dio());

final postRequestProvider = FutureProvider.autoDispose((ref) async {
  final dio = ref.watch(_dioProvider);
  final response = await dio.post(
    'http://jsonplaceholder.typicode.com/posts',
    data: {'title': 'foo', 'body': 'bar', 'userId': 1},
  );
  return response.data;
});

///=========== Alternative way to implement this===========
///See the get_request_provider.dart
