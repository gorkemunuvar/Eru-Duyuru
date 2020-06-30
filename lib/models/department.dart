import 'package:flutter/foundation.dart';
import 'announcement.dart';

class Department {
  final String name;
  final String url;
  final String startingLink;
  List<Announcement> _announcements;

  Department({
    @required this.name,
    @required this.url,
    @required this.startingLink,
  });

  void setAnnouncements(List<Announcement> announcements) {
    _announcements = announcements;
  }

  List<Announcement> getAnnouncements() {
    return _announcements;
  }
}
