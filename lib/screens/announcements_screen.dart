import 'package:anons/components/announcement_list_tile.dart';
import 'package:flutter/material.dart';
import '../components/announcement_list_tile.dart';
import 'package:anons/models/announcement.dart';

class AnnouncementsScreen extends StatefulWidget {
  final List<Announcement> announcements;

  AnnouncementsScreen({this.announcements});

  @override
  _AnnouncementsScreenState createState() => _AnnouncementsScreenState();
}

class _AnnouncementsScreenState extends State<AnnouncementsScreen> {
  @override
  Widget build(BuildContext context) {
    int length = widget.announcements.length;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        //Duyuru ekranında 10'dan fazla duyuru göstermemesi için
        itemCount: length > 10 ? 10 : length,
        itemBuilder: (context, index) {
          return AnnouncementListTile(
            title: widget.announcements[index].title,
            date: widget.announcements[index].date,
            link: widget.announcements[index].link,
          );
        },
      ),
    );
  }
}
