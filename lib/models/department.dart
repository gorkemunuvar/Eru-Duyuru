import 'package:flutter/foundation.dart';
import 'announcement.dart';

enum DepartmentTypes {
  Bilgisayar,
  Elektrik,
  Makine,
}

class Department {
  final DepartmentTypes type;
  final String url;
  final String startingLink;
  List<Announcement> announcements = List<Announcement>();

  Department({
    @required this.type,
    @required this.url,
    @required this.startingLink,
  });
}
