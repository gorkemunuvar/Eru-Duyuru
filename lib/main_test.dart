import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Kişiler';

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: <Widget>[
              CustomListTile(
                avatarImage: AssetImage('images/avatar.png'),
              ),
              CustomListTile(
                avatarImage: AssetImage('images/avatar_purple.png'),
              ),
              CustomListTile(
                avatarImage: AssetImage('images/avatar_brown.png'),
              ),
              CustomListTile(
                avatarImage: AssetImage('images/avatar_green.png'),
              ),
              CustomListTile(
                avatarImage: AssetImage('images/avatar_red.png'),
              ),
              CustomListTile(
                avatarImage: AssetImage('images/avatar_yellow.png'),
              ),
              CustomListTile(
                avatarImage: AssetImage('images/avatar.png'),
              ),
              CustomListTile(
                avatarImage: AssetImage('images/avatar_yellow.png'),
              ),
              CustomListTile(
                avatarImage: AssetImage('images/avatar.png'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
  CustomListTile({@required this.avatarImage});

  final AssetImage avatarImage;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        contentPadding: EdgeInsets.all(15.0),
        title: Text(
          'Prof. Dr. Derviş Karaboğa',
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text('+90 (352) 207-6666 x32577\nkaraboga@erciyes.edu.tr'),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {},
      ),
    );
  }
}
