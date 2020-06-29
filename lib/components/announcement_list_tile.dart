import 'package:flutter/material.dart';
import 'package:anons/screens/webview_screen.dart';

class AnnouncementListTile extends StatelessWidget {
  final String title;
  final String date;
  final String link;

  AnnouncementListTile({
    @required this.title,
    @required this.date,
    @required this.link,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        contentPadding: EdgeInsets.all(10.0),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Baseline(
          baseline: 35.0,
          baselineType: TextBaseline.alphabetic,
          child: Text(
            '$date',
          ),
        ),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          print("\n$link\n");

          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return WebViewScreen(initialUrl: link);
            }),
          );
        },
      ),
    );
  }
}
