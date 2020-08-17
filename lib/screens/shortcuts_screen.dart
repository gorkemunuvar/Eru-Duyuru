import 'package:flutter/material.dart';
import 'package:anons/services/url_launcher_helper.dart';
import 'package:anons/components/list_tile_card.dart';

class ShortcutScreen extends StatelessWidget {
  UrlLauncher urlLauncher = UrlLauncher();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView(
        children: [
          ListTileCard(
            title: 'Obisis Web Sayfası',
            onTap: () {
              urlLauncher.launchUrl('https://obisis.erciyes.edu.tr');
            },
          ),
          ListTileCard(
            title: 'Erü Webmail',
            onTap: () {
              urlLauncher.launchUrl('https://webmail.erciyes.edu.tr');
            },
          ),
        ],
      ),
    );
  }
}
