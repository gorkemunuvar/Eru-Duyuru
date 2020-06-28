import 'package:flutter/material.dart';
import '../components/custom_list_tile.dart';
import 'package:anons/models/announcement.dart';

class AnnouncementsScreen extends StatelessWidget {
  final List<Announcement> announcements;

  AnnouncementsScreen({this.announcements});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(5.0),
          child: ListView.builder(
            itemCount: announcements.length,
            itemBuilder: (context, index) {
              return CustomListTile(
                name: announcements[index].title,
                email: announcements[index].link,
                phoneNumber: "213 123 123",
              );
            },
          ),
        ),
      ),
    );
  }
}
