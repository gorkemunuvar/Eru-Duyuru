import 'package:flutter/material.dart';

class DepartmentsExpansionTile extends StatelessWidget {
  final String title;
  final bool paddingState;
  final List<Widget> childrens;

  DepartmentsExpansionTile({
    @required this.title,
    @required this.childrens,
    this.paddingState,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: paddingState == null
          ? EdgeInsets.symmetric(horizontal: 15.0)
          : EdgeInsets.zero,
      child: Card(
        child: ExpansionTile(
          title: Text(title),
          children: childrens,
        ),
      ),
    );
  }
}
