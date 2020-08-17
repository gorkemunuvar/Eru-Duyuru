import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoScreen extends StatelessWidget {
  final Uri _emailLaunchUri = Uri(
      scheme: 'mailto',
      path: "soft.hiker@gmail.com",
      queryParameters: {"subject": "Uygulama\bGeri\bBildirimi"});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Görüş, eleştiri ve yorumlarınız için",
                style: TextStyle(fontSize: 18.0),
              ),
              SizedBox(
                height: 10.0,
              ),
              RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  side: BorderSide(color: Colors.orange[50]),
                ),
                color: Colors.grey[200],
                child: Text("soft.hiker@gmail.com"),
                onPressed: () {
                  launch(_emailLaunchUri.toString());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
