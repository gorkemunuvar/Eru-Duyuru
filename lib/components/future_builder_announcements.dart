import 'package:flutter/material.dart';
import 'package:anons/models/department.dart';
import 'package:anons/screens/announcements_screen.dart';
import 'package:anons/services/html_parser.dart';
import 'package:anons/services/alert_dialog.dart';
import 'package:anons/models/announcement.dart';

class FutureBuilderAnnouncements extends StatefulWidget {
  final String departmentName;

  FutureBuilderAnnouncements(this.departmentName);

  @override
  _FutureBuilderAnnouncementsState createState() =>
      _FutureBuilderAnnouncementsState();
}

class _FutureBuilderAnnouncementsState
    extends State<FutureBuilderAnnouncements> {
  List<Announcement> announcements = List<Announcement>();

  Future<List> getData() async {
    announcements.clear();
    Department department = Department.getDepartmentInstance(
      Department.getDepartmentType(widget.departmentName),
    );
    announcements = await HtmlParsing().getAnnouncements(department);

    return announcements;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return AnnouncementsScreen(
            announcements: announcements,
          );
        } else if (snapshot.connectionState != ConnectionState.done) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          //Error Screen
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 10,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.error_outline,
                        size: 30.0,
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        "Beklenmeyen bir hata ile karşılaştın :/ İnternet bağlantını kontrol edip tekrar dene!",
                        textAlign: TextAlign.center,
                      ),
                      FlatButton(
                        child: Text('Tekrar Dene'),
                        onPressed: () {
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                ),
                FlatButton(
                  child: Text('Hatayı Görüntüle'),
                  onPressed: () => AlertDialogHelper().show(
                    context,
                    "Hata",
                    snapshot.error.toString(),
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
