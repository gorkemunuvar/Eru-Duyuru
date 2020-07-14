import 'package:anons/components/announcement_list_tile.dart';
import 'package:flutter/material.dart';
import '../components/announcement_list_tile.dart';
import 'package:anons/models/announcement.dart';

class AnnouncementsScreen extends StatelessWidget {
  final List<Announcement> announcements;

  AnnouncementsScreen({this.announcements});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemCount: announcements.length,
        itemBuilder: (context, index) {
          return AnnouncementListTile(
            title: announcements[index].title,
            date: announcements[index].date,
            link: announcements[index].link,
          );
        },
      ),
    );
  }
}
