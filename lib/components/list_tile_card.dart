import 'package:flutter/material.dart';

class ListTileCard extends StatelessWidget {
  final String title;
  final Function onTap;
  final bool paddingState;

  ListTileCard({@required this.title, this.onTap, this.paddingState});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: paddingState == null
          ? EdgeInsets.symmetric(horizontal: 15.0)
          : EdgeInsets.zero,
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
