import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:anons/utilities/constants.dart';

class WebViewScreen extends StatelessWidget {
  final String initialUrl;

  WebViewScreen({@required this.initialUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kAppBarColor,
        title: Text("Duyuru Sayfası"),
        //Settings Icon
      ),
      body: WebView(
        initialUrl: initialUrl,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
