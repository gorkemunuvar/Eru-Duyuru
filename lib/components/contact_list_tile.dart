import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ContactListTile extends StatelessWidget {
  ContactListTile(
      {@required this.name, this.email, this.phoneNumber, this.department});

  final String name;
  final String email;
  final String phoneNumber;
  final String department;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        dense: true,
        contentPadding: EdgeInsets.all(15.0),
        title: Padding(
          padding: const EdgeInsets.only(bottom: 5.0),
          child: Text(
            name,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        subtitle: Text(
          '${department}\n${email}\n${phoneNumber}',
          style: TextStyle(fontSize: 13.0),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.mail_outline),
              color: Colors.red[300],
              iconSize: 25.0,
              onPressed: () {
                Clipboard.setData(ClipboardData(text: email));
                _showToast(context);
              },
            ),
            IconButton(
              icon: Icon(Icons.phone),
              color: Colors.green[700],
              iconSize: 25.0,
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
      duration: Duration(milliseconds: 1000),
      content: const Text(
        'Email panoya kopyalandı.',
        textAlign: TextAlign.center,
      ),
    ),
  );
}
