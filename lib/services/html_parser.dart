import 'package:http/http.dart';
import 'package:html/parser.dart';
import 'package:html/dom.dart';
import '../models/announcement.dart';

List<Announcement> announcementList = List();

Future initiate(String url, String startingLink) async {
  var client = Client();
  Response response = await client.get(url);

  if (response.statusCode == 200) {
    print("started");

    var document = parse(response.body);
    List<Element> announcements =
        document.querySelectorAll('h5.post-title > a.font-13');

    List<Element> dates = document.querySelectorAll('tr > td.font-12');

    String pageLink = startingLink;

    announcementList.clear();

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

    print("finished.");
  }

  //return json.encode(linkMap);
  return announcementList;
}

class HtmlParsing {
  static List<Announcement> getAnnouncements() {
    return announcementList;
  }
}
