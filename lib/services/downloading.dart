import 'package:share/share.dart';
import 'package:flutter/material.dart';
import 'package:anons/utilities/constants.dart';
import 'package:path_provider/path_provider.dart';
import 'package:anons/services/url_launcher_helper.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import 'package:dio/dio.dart';

class DownloadHelper {
  String url;

  DownloadHelper(this.url);

  Dio _dio = Dio();

  Future<String> download(String savePath, Function onRecieveProgress) async {
    try {
      await _dio.download(
        url,
        savePath,
        onReceiveProgress: onRecieveProgress,
      );
    } catch (error) {
      savePath = null;
    }

    return savePath;
  }
}
