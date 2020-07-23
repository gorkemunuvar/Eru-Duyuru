import 'package:http/http.dart';
import 'package:html/parser.dart';
import 'package:html/dom.dart';

class Scrapper {
  static Future parseHtml(
    String url,
    String nameSelector,
    String emailSelector,
  ) async {
    Client client = Client();
    Response response = await client.get(url);

    if (response.statusCode == 200) {
      print("-----\nstarted\n-----");

      Document document = parse(response.body);

      List<Element> names = document.querySelectorAll(nameSelector);
      List<Element> emails_phones = document.querySelectorAll(emailSelector);

      List<String> emails = List<String>();
      List<String> phones = List<String>();

      for (int i = 0; i < emails_phones.length; i++) {
        if (i % 2 == 0)
          emails.add(emails_phones[i].text);
        else {
          var newString =
              emails_phones[i].text.substring(emails_phones[i].text.length - 5);
          phones.add(newString);
        }
      }

      String json = "";

      for (int i = 0; i < names.length; i++) {
        json += "{\"name\" : \"${names[i].text}\",";
        json += "\"email\" : \"${emails[i]}\",";
        json += "\"phone\" : \"${phones[i]}\",";
        json += "\"department\" : \"Mekatronik Mühendisliği\",";
        json += "\"profession\" : \"Akademik Personel\"},";
      }

      printWrapped(json);

      print("-----\nfinished\n-----");
    }
  }
}

void printWrapped(String text) {
  final pattern = new RegExp('.{1,800}'); // 800 is the size of each chunk
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}
