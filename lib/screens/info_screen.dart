import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoScreen extends StatelessWidget {
  final Uri _emailLaunchUri = Uri(
    scheme: 'mailto',
    path: "soft.hiker@gmail.com",
  );

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Görüş, eleştiri ve yorumlarınız için"),
            FlatButton(
              child: Text("soft.hiker@gmail.com"),
              onPressed: () {
                launch(_emailLaunchUri.toString());
              },
            ),
          ],
        ),
      ),
    );
  }
}
