import 'package:anons/index.dart';
import 'package:flutter/material.dart';
import 'package:anons/components/future_builder_announcements.dart';
import 'package:anons/utilities/constants.dart';

class DepartmentAnnouncementsScreen extends StatelessWidget {
  final String title;
  final Department department;

  DepartmentAnnouncementsScreen(
      {@required this.title, @required this.department});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kAppBarColor,
        title: Text(title),
        //Settings Icon
      ),
      body: FutureBuilderAnnouncements(department),
    );
  }
}
