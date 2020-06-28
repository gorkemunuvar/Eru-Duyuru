import 'package:anons/html_parser.dart';
import 'screens/contact_page.dart';
import 'package:flutter/material.dart';
import 'screens/announcements_page.dart';
import 'screens/settings_screen.dart';

void main() => runApp(MyApp());

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;

  List<Widget> _widgetOptions = <Widget>[
    FutureBuilder(
      future: initiate(),
      builder: (context, snapshot) {
        if (snapshot.hasData)
          return AnnouncementsWidget();
        else if (snapshot.hasError) return Text("${snapshot.error}");

        return Center(
          child: CircularProgressIndicator(),
        );
      },
    ),
    Contacts(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return SetttingsScreen();
                  }));
                },
                child: Icon(
                  Icons.settings,
                  size: 26.0,
                ),
              )),
        ],
        backgroundColor: Colors.amber[700],
        title: const Text('Erciyes Üniversitesi'),
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.perm_contact_calendar),
            title: Text('Rehber'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
