import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router_x/src/async_redirection/async_auth.dart';

final class AsyncAuthNotifier extends ChangeNotifier {
  final AsyncAuth _auth;
  late final StreamSubscription<dynamic> _subscription;

  AsyncAuthNotifier(this._auth) {
    _subscription = _auth.onCurrentUserChanged.listen((_) => notifyListeners());
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
