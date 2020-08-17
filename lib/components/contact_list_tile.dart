import 'package:flutter/material.dart';
import 'package:anons/models/person.dart';
import 'package:share/share.dart';
import 'package:anons/services/url_launcher_helper.dart';

class ContactListTile extends StatelessWidget {
  final Person person;

  ContactListTile({@required this.person});

  UrlLauncher urlLauncher = UrlLauncher();
  @override
  Widget build(BuildContext context) {
    final Uri _emailLaunchUri = Uri(
      scheme: 'mailto',
      path: person.email,
    );

    return Card(
      child: ListTile(
        dense: true,
        contentPadding: EdgeInsets.all(15.0),
        title: Padding(
          padding: const EdgeInsets.only(bottom: 5.0),
          child: Text(
            person.name,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        subtitle: Text(
          '${person.department}\n${person.email}\nDahili Numara: ${person.phone}',
          style: TextStyle(fontSize: 13.0),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.share),
              color: Colors.black54,
              iconSize: 22.0,
              onPressed: () {
                Share.share(
                    '${person.name}\n${person.department}\n${person.email}\nDahili No: ${person.phone}');
              },
            ),
            IconButton(
              icon: Icon(Icons.mail_outline),
              color: Colors.red[300],
              iconSize: 22.0,
              onPressed: () {
                urlLauncher.launchUrl(_emailLaunchUri.toString());
              },
            ),
            IconButton(
              icon: Icon(Icons.phone),
              color: Colors.green[700],
              iconSize: 22.0,
              onPressed: () {
                urlLauncher.launchUrl("tel:0352 207 6666");
              },
            ),
          ],
        ),
      ),
    );
  }
}
