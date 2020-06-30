import 'package:http/http.dart';
import 'package:html/parser.dart';
import 'package:html/dom.dart';
import '../models/announcement.dart';
import '../models/department.dart';

List<Department> _departments = List();

Future initiate(List<Department> departments) async {
  for (var department in departments) {
    List<Announcement> announcementList = List();
    var client = Client();
    Response response = await client.get(department.url);

    if (response.statusCode == 200) {
      print("-------------------\nstarted\n-------------------");

      var document = parse(response.body);

      List<Element> announcements =
          document.querySelectorAll('h5.post-title > a.font-13');
      List<Element> dates = document.querySelectorAll('tr > td.font-12');

      String pageLink = department.startingLink;
      for (var i = 0; i < 10; i++) {
        String link = pageLink + announcements[i].attributes['href'];

        print(link);
        print(dates[i].text);
        print(announcements[i].text);

        announcementList.add(Announcement(
          title: announcements[i].text,
          link: link,
          date: dates[i].text,
        ));
      }

      department.setAnnouncements(announcementList);
      announcementList.clear();

      print("-------------------\nfinished\n-------------------");
    }
  }

  _departments = departments;

  return departments;
}

class HtmlParsing {
  static List<Announcement> getAnnouncements(String departmentName) {
    for (var department in _departments) {
      print("nameeeeeeee\n$department.name");
      if (department.name == departmentName)
        return department.getAnnouncements();
    }

    return null;
  }
}
