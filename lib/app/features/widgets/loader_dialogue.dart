import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class LoaderDialog {
  static void show(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const AlertDialog(
          contentPadding: EdgeInsets.all(16.0),
          content: SizedBox(
            height: 60,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        );
      },
    );
  }

  static void hide(BuildContext context) {
    context.router.popForced();
  }
}
