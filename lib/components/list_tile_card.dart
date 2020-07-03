import 'package:flutter/material.dart';

class ListTileCard extends StatelessWidget {
  final String title;
  final Function onTap;

  ListTileCard({@required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Card(
        child: ListTile(
          title: Text(title),
          onTap: () {
            onTap();
          },
        ),
      ),
    );
  }
}
