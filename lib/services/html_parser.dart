import 'package:http/http.dart'; // Contains a client for making API calls
import 'package:html/parser.dart'; // Contains HTML parsers to generate a Document object
import 'package:html/dom.dart'; // Contains DOM related classes for extracting data from elements
import '../models/announcement.dart';

List<Announcement> announcementList = List();

Future initiate() async {
  var client = Client();
  Response response = await client.get('https://bm.erciyes.edu.tr/?Anasayfa');

  if (response.statusCode == 200) {
    print("started");

    var document = parse(response.body);
    List<Element> announcements =
        document.querySelectorAll('h5.post-title > a.font-13');

    String pageLink = 'https://bm.erciyes.edu.tr/index.asp';

    announcementList.clear();
    for (var announcement in announcements) {
      String link = pageLink + announcement.attributes['href'];

      print(announcement.text);
      print(link);

      announcementList.add(Announcement(
        title: announcement.text,
        link: link,
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
