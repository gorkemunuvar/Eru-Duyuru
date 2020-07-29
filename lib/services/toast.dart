import 'package:flutter/material.dart';

class Toast {
  static void show(BuildContext context) {
    final scaffold = Scaffold.of(context);
    scaffold.showSnackBar(
      SnackBar(
        duration: Duration(milliseconds: 700),
        content: const Text(
          'Email panoya kopyalandı.',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
