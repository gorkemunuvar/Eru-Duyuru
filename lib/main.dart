import 'routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterDownloader.initialize(
      // optional: set false to disable printing logs to console
      debug: false);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: Routing.navigatorKey,
      initialRoute: '/',
      routes: Routing.initiateRoutes(context),
    );
  }
}
