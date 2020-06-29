import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  CustomListTile(
      {@required this.name, @required this.email, @required this.phoneNumber});

  final String name;
  final String email;
  final String phoneNumber;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        contentPadding: EdgeInsets.all(15.0),
        title: Text(
          name,
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text('$phoneNumber\n$email'),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {},
      ),
    );
  }
}
