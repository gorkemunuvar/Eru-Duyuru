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

//TO DO
/*
  *Tarih olmayabilir.
  *Tarih birden fazla selector ile seçilebilir.
*/

Future getAnnouncements(Department department) async {
  if (!_isDepartmentExist(department)) {
    Client client = Client();

    Response response = await client.get(department.url);

    if (response.statusCode == 200) {
      print("-----\nstarted\n-----");

      Document document = parse(response.body);

      List<Element> titles =
          document.querySelectorAll(department.titleSelector);
      List<Element> links = document.querySelectorAll(department.linkSelector);
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

      print("Titles len = ${titles.length}");
      print("Dates len = ${dates.length}");

      String pageLink = department.startingLink;

      //İlgili bölüme ait duyuru yoksa
      if (titles.length == 0) {
        Announcement newAnnouncement = Announcement(
          title: "Bölüme ait duyuru bulunamadı :/",
          link: "--",
          date: "--",
        );

        department.announcements.add(newAnnouncement);
      }
      //İlgili bölüme ait duyuru bulunmuşsa
      else {
        for (var i = 0; i < titles.length; i++) {
          if (i == 10) break;

          String link = pageLink + links[i].text.trim();
          String date = '';

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
  static List<Announcement> getAnnouncementList(DepartmentTypes type) {
    print("Type --> ${type}");

    for (var d in _departments) {
      if (type == d.type) {
        return d.announcements;
      }
    }

    return null;
  }
}
