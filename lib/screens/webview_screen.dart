import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:anons/utilities/constants.dart';
import 'package:anons/services/url_launcher_helper.dart';
import 'package:share/share.dart';

class WebViewScreen extends StatefulWidget {
  final String title;
  final String initialUrl;

  WebViewScreen({
    @required this.title,
    @required this.initialUrl,
  });

  @override
  _WebViewScreenState createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  String title, url;
  bool isLoading = true;
  final _key = UniqueKey();

  UrlLauncher urlLauncher = UrlLauncher();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kAppBarColor,
        title: Text("Duyuru Sayfası"),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {
                Share.share("${widget.title}\n${widget.initialUrl}");
              },
              child: Icon(
                Icons.share,
                size: 26.0,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {
                urlLauncher.launchUrl(widget.initialUrl);
              },
              child: Icon(
                Icons.open_in_browser,
                size: 26.0,
              ),
            ),
          ),
        ],
        //Settings Icon
      ),
      body: Stack(
        children: [
          WebView(
            userAgent:
                'Mozilla/5.0 (Linux; <Android Version>; <Build Tag etc.>) AppleWebKit/<WebKit Rev> (KHTML, like Gecko) Chrome/<Chrome Rev> Mobile Safari/<WebKit Rev>',
            key: _key,
            initialUrl: widget.initialUrl,
            javascriptMode: JavascriptMode.unrestricted,
            onPageFinished: (finish) {
              setState(() {
                isLoading = false;
              });
            },
          ),
          isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Stack(),
        ],
      ),
    );
  }
}
