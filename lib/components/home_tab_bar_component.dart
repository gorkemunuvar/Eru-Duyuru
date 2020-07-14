import 'package:anons/index.dart';
import 'package:flutter/material.dart';

DefaultTabController HomeTabBar(
  int length,
  List<Tab> tabList,
  List<FutureBuilder> contentList,
) {
  return DefaultTabController(
    length: length == 0 ? 1 : length,
    child: Container(
      child: Column(
        children: <Widget>[
          Container(
            child: TabBar(
              isScrollable: true,
              indicatorColor: Colors.amber[700],
              labelColor: Colors.amber[700],
              unselectedLabelColor: Colors.grey,
              tabs: length == 0
                  ? [Text("Erciyes Üniversitesi Anasayfası")]
                  : tabList,
            ),
          ),
          Expanded(
            child: Container(
              height: 80.0,
              child: TabBarView(
                children: length == 0
                    ? [
                        FutureBuilderAnnouncements(
                          Department.getDepartmentInstance(
                              DepartmentTypes.AnasayfaErciyesUniversitesi),
                        )
                      ]
                    : contentList,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
