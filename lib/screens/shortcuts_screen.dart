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
            title: 'Obisis',
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
          ListTileCard(
            title: 'Erü DM',
            onTap: () {
              urlLauncher.launchUrl('https://erudm.erciyes.edu.tr');
            },
          ),
          ListTileCard(
            title: 'Erüzem',
            onTap: () {
              urlLauncher.launchUrl('https://clms.erciyes.edu.tr');
            },
          ),
          ListTileCard(
            title: 'Öğrenci İşleri',
            onTap: () {
              urlLauncher.launchUrl('https://ogrisl.erciyes.edu.tr');
            },
          ),
        ],
      ),
    );
  }
}
