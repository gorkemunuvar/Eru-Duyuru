import 'package:flutter/material.dart';
import 'package:anons/models/department.dart';
import 'package:anons/screens/announcements_screen.dart';
import 'package:anons/services/html_parser.dart';

FutureBuilder FutureBuilderAnnouncements(Department department) {
  return FutureBuilder(
    future: getAnnouncements(
      department,
    ),
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        return AnnouncementsScreen(
          announcements: HtmlParsing.getAnnouncementList(department.type),
        );
      } else if (snapshot.hasError) {
        return Text("${snapshot.error}");
      }
      return Center(
        child: CircularProgressIndicator(),
      );
    },
  );
}
