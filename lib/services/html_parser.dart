import 'package:http/http.dart';
import 'package:html/parser.dart';
import 'package:html/dom.dart';
import '../models/announcement.dart';
import '../models/department.dart';

List<Department> _departments = List<Department>();

Future initiate(Department department) async {
  //_departments.clear();
  var client = Client();

  Response response = await client.get(department.url);

  if (response.statusCode == 200) {
    print("-----\nstarted\n-----");

    var document = parse(response.body);

    List<Element> announcements =
        document.querySelectorAll('h5.post-title > a.font-13');
    List<Element> dates = document.querySelectorAll('tr > td.font-12');

    String pageLink = department.startingLink;
    for (var i = 0; i < 10; i++) {
      String link = pageLink + announcements[i].attributes['href'];

      department.announcements.add(Announcement(
        title: announcements[i].text,
        link: link,
        date: dates[i].text,
      ));
    }

    _departments.add(department);

    print("-----\nfinished\n-----");
  }

  return _departments;
}

class HtmlParsing {
  static List<Announcement> getAnnouncements(DepartmentTypes type) {
    for (var d in _departments) {
      if (type == d.type) {
        return d.announcements;
      }
    }

    return null;
  }
}
