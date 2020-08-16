import 'routes.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

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
