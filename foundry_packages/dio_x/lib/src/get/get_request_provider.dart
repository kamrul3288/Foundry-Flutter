import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final _dioProvider = Provider((ref) => Dio());

final getRequestProvider = FutureProvider.autoDispose((ref) async {
  final dio = ref.watch(_dioProvider);
  final response = await dio.get('http://jsonplaceholder.typicode.com/posts/1');
  return response.data;
});

///================ Alter Native State Management================
final getRequestStateProvider =
    NotifierProvider.autoDispose<GetRequestStateNotifier, GetRequestState>(
      GetRequestStateNotifier.new,
    );

class GetRequestStateNotifier extends Notifier<GetRequestState> {
  @override
  GetRequestState build() {
    return GetRequestState();
  }

  void getRequest() async {
    final dio = ref.read(_dioProvider);
    state = GetRequestState(isLoading: true);
    try {
      final response = await dio.get(
        'http://jsonplaceholder.typicode.com/posts/1',
      );
      state = GetRequestState(data: response.data);
    } catch (e) {
      state = GetRequestState(error: e.toString());
    }
  }
}

class GetRequestState {
  final bool isLoading;
  final dynamic data;
  final String? error;

  GetRequestState({this.isLoading = true, this.data, this.error});
}
