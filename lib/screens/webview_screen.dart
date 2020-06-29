import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatelessWidget {
  final String initialUrl;

  WebViewScreen({@required this.initialUrl});

  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: "https://bm.erciyes.edu.tr/index.asp?DuyuruID=291",
      javascriptMode: JavascriptMode.unrestricted,
    );
  }
}
