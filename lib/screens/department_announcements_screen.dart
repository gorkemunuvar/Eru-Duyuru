import 'package:anons/index.dart';
import 'package:flutter/material.dart';
import 'announcements_screen.dart';
import 'package:anons/utilities/constants.dart';

class DepartmentAnnouncementsScreen extends StatelessWidget {
  final String title;
  final List<Announcement> announcements;

  DepartmentAnnouncementsScreen(
      {@required this.title, @required this.announcements});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kAppBarColor,
        title: Text(title),
        //Settings Icon
      ),
      body: FutureBuilder(
        future: initiate(
          Department(
            type: DepartmentTypes.Bilgisayar,
            url: 'https://bm.erciyes.edu.tr/?Anasayfa',
            startingLink: 'https://bm.erciyes.edu.tr/',
          ),
        ),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return AnnouncementsScreen(
              announcements:
                  HtmlParsing.getAnnouncements(DepartmentTypes.Bilgisayar),
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
