import 'package:http/http.dart';
import 'package:html/parser.dart';
import 'package:html/dom.dart';
import '../models/announcement.dart';
import '../models/department.dart';

List<Department> _departments = List<Department>();

bool _isDepartmentExist(Department d) {
  if (_departments.indexOf(d) != -1)
    return true;
  else
    return false;
}

Future initiate(Department department) async {
  if (!_isDepartmentExist(department)) {
    Client client = Client();

    Response response = await client.get(department.url);

    if (response.statusCode == 200) {
      print("-----\nstarted\n-----");

      Document document = parse(response.body);

      List<Element> titles =
          document.querySelectorAll(department.titleSelector);

      List<Element> links = document.querySelectorAll(department.linkSelector);

      List<Element> dates = document.querySelectorAll(department.dateSelector);

      String pageLink = department.startingLink;

      if (titles.length == 0) {
        Announcement newAnnouncement = Announcement(
          title: "Bölüme ait duyuru bulunamadı :/",
          link: "--",
          date: "--",
        );

        department.announcements.add(newAnnouncement);
      } else {
        for (var i = 0; i < titles.length; i++) {
          if (i == 10) break;

          String link = pageLink + links[i].text.trim();

          Announcement newAnnouncement = Announcement(
            title: titles[i].text.trim(),
            link: link.trim(),
            date: dates[i].text.trim(),
          );

          department.announcements.add(newAnnouncement);
        }
      }

      _departments.add(department);

      print("-----\nfinished\n-----");
    }
  }

  return _departments;
}

class HtmlParsing {
  static List<Announcement> getAnnouncements(DepartmentTypes type) {
    print("Type --> ${type}");

    for (var d in _departments) {
      if (type == d.type) {
        return d.announcements;
      }
    }

    return null;
  }
}
