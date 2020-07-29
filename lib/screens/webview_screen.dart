import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:anons/utilities/constants.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share/share.dart';

class WebViewScreen extends StatelessWidget {
  final String title;
  final String initialUrl;

  WebViewScreen({
    @required this.title,
    @required this.initialUrl,
  });

  _launchURL() async {
    if (await canLaunch(initialUrl)) {
      await launch(initialUrl);
    } else {
      throw 'Could not launch $initialUrl';
    }
  }

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
                Share.share("${title}\n${initialUrl}");
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
                _launchURL();
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
      body: WebView(
        initialUrl: initialUrl,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
