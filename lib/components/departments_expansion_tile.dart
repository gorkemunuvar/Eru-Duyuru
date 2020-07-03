import 'package:flutter/material.dart';

class DepartmentsExpansionTile extends StatelessWidget {
  final String title;
  final List<Widget> childrens;

  DepartmentsExpansionTile({
    @required this.title,
    @required this.childrens,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ExpansionTile(
        title: Text(title),
        children: childrens,
      ),
    );
  }
}
