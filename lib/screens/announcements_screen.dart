import 'package:flutter/material.dart';
import 'package:anons/services/html_parser.dart';
import '../components/custom_list_tile.dart';
import 'package:anons/models/announcement.dart';

class AnnouncementsWidget extends StatelessWidget {
  List<Announcement> _announcements;
  AnnouncementsWidget() {
    _announcements = getAnnouncements();
  }

  @override
  Widget build(BuildContext context) {
    final title = 'Duyurular';

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(5.0),
          child: ListView.builder(
            itemCount: _announcements.length,
            itemBuilder: (context, index) {
              return CustomListTile(
                name: _announcements[index].title,
                email: _announcements[index].link,
                phoneNumber: "213 123 123",
              );
            },
          ),
        ),
      ),
    );
  }
}
