import 'package:flutter/material.dart';

class BottomNavigationBarComponent extends StatelessWidget {
  final int currentIndex;
  final Function onTap;

  BottomNavigationBarComponent({this.currentIndex, this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text('Anasayfa'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.school),
          title: Text('Bölümler'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.perm_contact_calendar),
          title: Text('Rehber'),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.link,
            size: 30.0,
          ),
          title: Text('Kısayollar'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.info_outline),
          title: Text('İletişim'),
        ),
      ],
      unselectedItemColor: Colors.grey,
      unselectedLabelStyle: TextStyle(color: Colors.grey),
      currentIndex: currentIndex,
      selectedItemColor: Colors.amber[800],
      onTap: onTap,
    );
  }
}
