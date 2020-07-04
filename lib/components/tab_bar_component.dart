import 'package:flutter/material.dart';
import 'package:anons/models/department.dart';
import 'package:anons/components/future_builder_announcements.dart';

DefaultTabController TabBarComponent() {
  return DefaultTabController(
    length: 3,
    child: Container(
      child: Column(
        children: <Widget>[
          Container(
            child: TabBar(
              isScrollable: true,
              indicatorColor: Colors.amber[700],
              labelColor: Colors.amber[700],
              unselectedLabelColor: Colors.grey,
              tabs: [
                Tab(text: 'Bilgisayar Mühendisliği'),
                Tab(text: 'E. Elektronik Mühendisliği'),
                Tab(text: 'Makine Mühendisliği'),
              ],
            ),
          ),
          Expanded(
            child: Container(
              height: 80.0,
              child: TabBarView(
                children: <Widget>[
                  FutureBuilderAnnouncements(
                    Department(
                      type: DepartmentTypes.Bilgisayar,
                      url: 'https://bm.erciyes.edu.tr/?Anasayfa',
                      startingLink: 'https://bm.erciyes.edu.tr/',
                    ),
                  ),
                  FutureBuilderAnnouncements(
                    Department(
                      type: DepartmentTypes.Elektrik,
                      url: 'https://em.erciyes.edu.tr/?Anasayfa',
                      startingLink: 'https://em.erciyes.edu.tr/',
                    ),
                  ),
                  FutureBuilderAnnouncements(
                    Department(
                      type: DepartmentTypes.Makine,
                      url: 'https://me.erciyes.edu.tr/?Anasayfa',
                      startingLink: 'https://me.erciyes.edu.tr/',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
