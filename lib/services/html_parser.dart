import 'dart:io';

import 'package:html/dom.dart';
import 'package:http/http.dart';
import '../models/department.dart';
import '../models/announcement.dart';
import 'package:anons/services/networking.dart';
import 'dart:convert' show utf8;
import 'package:html/parser.dart' as parser;

List<Department> _departments = List<Department>();

bool _isDepartmentExist(Department d) {
  if (_departments.indexOf(d) != -1)
    return true;
  else
    return false;
}

class HtmlParsing {
  static void iletisim() async {
/*     url: 'http://mimarlik.erciyes.edu.tr',
    startingLink: 'http://mimarlik.erciyes.edu.tr',
     titleSelector: 'div.duyurugenislik2 > a', */

    Networking networking = Networking(
      'http://mimarlik.erciyes.edu.tr',
    );

    Response response = await networking.getData();

    String decoded = utf8.decode(response.bodyBytes);
    Document document = parser.parse(decoded);

    List<Element> titles =
        document.querySelectorAll('div.duyurugenislik2 > aR');

    for (var title in titles) {
      print(title.text);
    }
  }

  List<Announcement> parseDocument(Response response, Department department) {
    //I solved strange character prob. using this line.
    String decoded = utf8.decode(response.bodyBytes);
    Document document = parser.parse(decoded);

    List<Announcement> anons = [];

    List<Element> titles = document.querySelectorAll(department.titleSelector);
    List<Element> links = department.linkSelector == null
        ? List<Element>()
        : document.querySelectorAll(department.linkSelector);
    List<Element> dates = List<Element>();
    List<Element> dates2 = List<Element>();
    List<Element> dates3 = List<Element>();

    if (department.dateSelector != null) {
      dates = document.querySelectorAll(department.dateSelector);

      if (department.dateSelector2 != null) {
        dates2 = document.querySelectorAll(department.dateSelector2);

        if (department.dateSelector3 != null) {
          dates3 = document.querySelectorAll(department.dateSelector3);
        }
      }
    }

    String pageLink = department.startingLink;

    //İlgili bölüme ait duyuru yoksa
    if (titles.length == 0) {
      Announcement newAnnouncement = Announcement(
        title: "Malesef duyuru bulunamadı. :/",
        link: "--",
        date: "--",
      );

      department.announcements.add(newAnnouncement);
    }

    //İlgili bölüme ait duyuru bulunmuşsa
    else {
      int boundary = department.listBoundary != null
          ? department.listBoundary
          : titles.length;

      for (int i = 0; i < boundary; i++) {
        if (i == 10) break;

        String date = '';

        String link = department.linkSelector == null
            ? department.url
            : pageLink + links[i].attributes["href"].trim();

        if (department.dateSelector != null) {
          date = dates[i].text.trim();

          if (department.dateSelector2 != null) {
            date += ' ' + dates2[i].text.trim();

            if (department.dateSelector3 != null)
              date += ' ' + dates3[i].text.trim();
          }
        }

        Announcement newAnnouncement = Announcement(
          title: titles[i].text.trim(),
          link: link.trim(),
          date: department.dateSelector != null ? date : '---',
        );

        anons.add(newAnnouncement);
        department.announcements.add(newAnnouncement);
      }
    }

    _departments.add(department);

    return anons;
  }

  Future<List> getAnnouncements(Department department) async {
    if (!_isDepartmentExist(department)) {
      Networking networking = Networking(department.url);
      Response response = await networking.getData();

      if (response.statusCode == 200) {
        parseDocument(response, department);
      }
    }

    return department.announcements;
  }

  List<Announcement> getAnnouncementList(DepartmentTypes type) {
    for (var d in _departments) {
      if (type == d.type) return d.announcements;
    }

    return null;
  }
}
