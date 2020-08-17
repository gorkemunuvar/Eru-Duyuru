import 'package:url_launcher/url_launcher.dart';

class UrlLauncher {
  launchUrl(String url) async {
    try {
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    } catch (e) {}
  }
}
