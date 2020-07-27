import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:anons/models/person.dart';
import 'package:share/share.dart';

class ContactListTile extends StatelessWidget {
  ContactListTile({@required this.person});

  final Person person;

  @override
  Widget build(BuildContext context) {
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
                Clipboard.setData(ClipboardData(text: person.email));
                _showToast(context);
              },
            ),
            IconButton(
              icon: Icon(Icons.phone),
              color: Colors.green[700],
              iconSize: 22.0,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

void _showToast(BuildContext context) {
  final scaffold = Scaffold.of(context);
  scaffold.showSnackBar(
    SnackBar(
      duration: Duration(milliseconds: 700),
      content: const Text(
        'Email panoya kopyalandı.',
        textAlign: TextAlign.center,
      ),
    ),
  );
}
