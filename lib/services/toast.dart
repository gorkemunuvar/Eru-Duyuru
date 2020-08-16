import 'package:flutter/material.dart';

class Toast {
  static void show(BuildContext context, String message) {
    final scaffold = Scaffold.of(context);
    scaffold.showSnackBar(
      SnackBar(
        duration: Duration(milliseconds: 1500),
        content: Text(
          message,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
