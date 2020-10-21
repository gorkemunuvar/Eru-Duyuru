import 'package:flutter/material.dart';
import 'package:anons/models/department.dart';
import 'package:anons/screens/announcements_screen.dart';
import 'package:anons/services/html_parser.dart';
import 'package:anons/models/announcement.dart';

class FutureBuilderAnnouncements extends StatefulWidget {
  final String departmentName;

  FutureBuilderAnnouncements({
    @required this.departmentName,
  });

  @override
  _FutureBuilderAnnouncementsState createState() =>
      _FutureBuilderAnnouncementsState();
}

class _FutureBuilderAnnouncementsState
    extends State<FutureBuilderAnnouncements> {
  List<Announcement> announcements = [];

  Future<List> getData() async {
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
        try {
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
              padding: const EdgeInsets.symmetric(horizontal: 35.0),
              child: Column(
                children: <Widget>[
                  Expanded(
                    flex: 10,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.error_outline,
                          size: 90.0,
                          color: Colors.grey,
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          "Beklenmeyen bir hata ile karşılaştın :/ İnternet bağlantını kontrol edip tekrar dene!",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 17,
                          ),
                        ),
                        SizedBox(height: 25.0),
                        RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            side: BorderSide(color: Colors.orange[50]),
                          ),
                          color: Colors.grey[200],
                          child: Text('Tekrar Dene'),
                          onPressed: () {
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
        } catch (e) {}
      },
    );
  }
}
