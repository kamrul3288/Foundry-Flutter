import 'dart:async';

final class AsyncAuth {
  final _userStreamController = StreamController<String?>.broadcast();
  Stream<String?> get onCurrentUserChanged => _userStreamController.stream;

  final int resetTimerInSeconds;
  Timer? _timer;
  String? _currentUser;

  AsyncAuth({this.resetTimerInSeconds = 20}) {
    _userStreamController.stream.listen((user) => _currentUser = user);
  }

  Timer _createResetTimer() {
    return Timer(Duration(seconds: resetTimerInSeconds), () {
      _userStreamController.add(null);
    });
  }

  Future<bool> isLoggedIn() async {
    await Future.delayed(const Duration(seconds: 1));
    return _currentUser != null;
  }

  Future<void> login(String userId) async {
    await Future.delayed(const Duration(seconds: 3));
    _timer?.cancel();
    _timer = _createResetTimer();
    _userStreamController.add(userId);
  }

  void logout() {
    _timer?.cancel();
    _timer = null;
    _userStreamController.add(null);
  }

  void dispose() {
    _timer?.cancel();
    _timer = null;
    _userStreamController.close();
  }
}
