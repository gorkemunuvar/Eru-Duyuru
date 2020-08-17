import 'package:anons/index.dart';
import 'package:flutter/material.dart';
import 'package:anons/utilities/constants.dart';
import 'package:anons/services/url_launcher_helper.dart';
import 'package:anons/components/future_builder_announcements.dart';

class DepartmentAnnouncementsScreen extends StatelessWidget {
  final String title;
  final Department department;

  DepartmentAnnouncementsScreen({
    @required this.title,
    @required this.department,
  });

  UrlLauncher urlLauncher = UrlLauncher();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kAppBarColor,
        title: Text(title),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {
                urlLauncher.launchUrl(department.url);
              },
              child: Icon(
                Icons.open_in_browser,
                size: 26.0,
              ),
            ),
          ),
        ],
      ),
      body: FutureBuilderAnnouncements(departmentName: department.name),
    );
  }
}
