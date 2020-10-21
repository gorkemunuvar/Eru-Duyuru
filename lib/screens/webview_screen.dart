import 'dart:io';
import 'package:share/share.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:path/path.dart' as path;
import 'package:open_file/open_file.dart';
import 'package:anons/utilities/constants.dart';
import 'package:anons/services/downloading.dart';
import 'package:path_provider/path_provider.dart';
import 'package:anons/services/url_launcher_helper.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:downloads_path_provider_28/downloads_path_provider_28.dart';

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
  String url;
  String title;
  String progress = "";

  bool isLoading = true;
  UniqueKey key = UniqueKey();
  InAppWebViewController webView;

  Future<Directory> _getDownloadDirectory() async {
    if (Platform.isAndroid)
      return await DownloadsPathProvider.downloadsDirectory;

    // iOS directory visible to user
    return await getApplicationDocumentsDirectory();
  }

  Future<bool> _requestStoragePermissions() async {
    var storagePermissionStatus = await Permission.storage.status;

    if (storagePermissionStatus != PermissionStatus.granted) {
      await Permission.storage.request();
    }

    return storagePermissionStatus == PermissionStatus.granted;
  }

  Future<void> _download(String url) async {
    final dir = await _getDownloadDirectory();
    final isStoragePermissionStatusGranted = await _requestStoragePermissions();

    if (isStoragePermissionStatusGranted) {
      File file = File(url);
      String fileName = path.basename(file.path);

      String savePath = path.join(dir.path, fileName);
      DownloadHelper downloadHelper = DownloadHelper(url);
      String downloadPath =
          await downloadHelper.download(savePath, _onReceiveProgress);

      if (downloadPath != null) {
        await OpenFile.open(downloadPath);
      }
    } else {
      // handle the scenario when user declines the permissions
    }
  }

  void _onReceiveProgress(int received, int total) {
    if (total != -1) {
      setState(() {
        progress = (received / total * 100).toStringAsFixed(0) + "%";
        if (progress == "100%") progress = "";
      });
    }
  }

  UrlLauncher urlLauncher = UrlLauncher();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Share.share(
            "${widget.title}\n${widget.initialUrl}\nvia tosto.re/eruduyuru",
          );
        },
        child: Icon(Icons.share, size: 30.0),
        backgroundColor: Color(0xFFF9A81A),
      ),
      appBar: AppBar(
        backgroundColor: kAppBarColor,
        title: Text("Duyuru Sayfası"),
        actions: <Widget>[
          Center(
            child: Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: Text(
                '$progress',
                style: TextStyle(
                  fontSize: 22.0,
                  color: Colors.white,
                ),
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
            key: key,
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
            onLoadStop: (InAppWebViewController controller, String url) {
              setState(() {
                isLoading = false;
              });
            },
            onDownloadStart: (controller, url) async {
              await _download(url);
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
