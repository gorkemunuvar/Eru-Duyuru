import 'package:anons/main.dart';
import 'package:flutter/material.dart';
import 'package:anons/components/list_tile_card.dart';
import 'package:anons/models/department.dart';
import 'package:anons/components/departments_expansion_tile.dart';

class DepartmentsListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        DepartmentsExpansionTile(title: "Mühendislik Fakültesi", childrens: <
            Widget>[
          ListTileCard(
            title: "Mühendislik Fakültesi Anasayfası",
            onTap: () {},
          ),
          ListTileCard(
            title: 'Bilgisayar Mühendisliği',
            onTap: () {
              currentDepartmentName = "Bilgisayar Mühendisliği";
              currentDepartment = Department(
                type: DepartmentTypes.Bilgisayar,
                url: 'https://bm.erciyes.edu.tr/?Anasayfa',
                startingLink: 'https://bm.erciyes.edu.tr/',
              );

              navigatorKey.currentState.pushNamed('/DepartmentAnnouncements');
            },
          ),
          ListTileCard(
            title: 'Biyomedikal Mühendisliği',
            onTap: () {},
          ),
          ListTileCard(
            title: 'Çevre Mühendisliği',
            onTap: () {},
          ),
          ListTileCard(
            title: 'Elektrik-Elektronik Mühendisliği',
            onTap: () {
              currentDepartmentName = "Elektrik-Elektronik Mühendisliği";
              currentDepartment = Department(
                type: DepartmentTypes.Elektrik,
                url: 'https://em.erciyes.edu.tr/?Anasayfa',
                startingLink: 'https://em.erciyes.edu.tr/',
              );

              navigatorKey.currentState.pushNamed('/DepartmentAnnouncements');
            },
          ),
          ListTileCard(
            title: 'Endüstri Mühendisliği',
            onTap: () {},
          ),
          ListTileCard(
            title: 'Endüstriyel Tasarım Mühendisliği',
            onTap: () {},
          ),
          ListTileCard(
            title: 'Enerji Sistemleri Mühendisliği',
            onTap: () {},
          ),
          ListTileCard(
            title: 'Gıda Mühendisliği',
            onTap: () {},
          ),
          ListTileCard(
            title: 'Harita Mühendisliği',
            onTap: () {},
          ),
          ListTileCard(
            title: 'İnşaat Mühendisliği',
            onTap: () {},
          ),
          ListTileCard(
            title: 'Makine Mühendisliği',
            onTap: () {
              currentDepartmentName = "Makine Mühendisliği";
              currentDepartment = Department(
                type: DepartmentTypes.Makine,
                url: 'https://me.erciyes.edu.tr/?Anasayfa',
                startingLink: 'https://me.erciyes.edu.tr/',
              );

              navigatorKey.currentState.pushNamed('/DepartmentAnnouncements');
            },
          ),
          ListTileCard(
            title: 'Malzeme Bilimi ve Mühendisliği',
            onTap: () {},
          ),
          ListTileCard(
            title: 'Mekatronik Mühendisliği',
            onTap: () {},
          ),
          ListTileCard(
            title: "Tekstil Mühendisliği ",
            onTap: () {},
          )
        ]),
      ],
    );
  }
}
