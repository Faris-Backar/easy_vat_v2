import 'dart:async';

import 'package:flutter/material.dart';

class SearchDebouncer {
  Timer? _timer;

  void run(VoidCallback action,
      {Duration delay = const Duration(milliseconds: 500)}) {
    _timer?.cancel();
    _timer = Timer(delay, action);
  }

  void dispose() {
    _timer?.cancel();
  }
}
