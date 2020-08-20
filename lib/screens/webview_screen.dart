import 'package:share/share.dart';
import 'package:flutter/material.dart';
import 'package:anons/utilities/constants.dart';
import 'package:path_provider/path_provider.dart';
import 'package:anons/services/url_launcher_helper.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

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
  InAppWebViewController webView;

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
          InAppWebView(
            initialUrl: widget.initialUrl,
            key: _key,
            initialHeaders: {},
            initialOptions: InAppWebViewGroupOptions(
              crossPlatform: InAppWebViewOptions(
                debuggingEnabled: true,
                useOnDownloadStart: true,
              ),
            ),
            onWebViewCreated: (InAppWebViewController controller) {
              webView = controller;
            },
            onLoadStart: (InAppWebViewController controller, String url) {
              setState(() {
                isLoading = false;
              });
            },
            onLoadStop: (InAppWebViewController controller, String url) {},
            onDownloadStart: (controller, url) async {
              print("###########onDownloadStart########### $url");
              //await Permission.storage.request();

              final taskId = await FlutterDownloader.enqueue(
                url: url,
                savedDir: (await getExternalStorageDirectory()).path,
                showNotification:
                    true, // show download progress in status bar (for Android)
                openFileFromNotification:
                    true, // click on notification to open downloaded file (for Android)
                requiresStorageNotLow: true,
              );
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
