import 'package:anons/index.dart';
import 'package:flutter/material.dart';

class HomeTabBarComponent extends StatelessWidget {
  final int length;
  final List<Tab> tabList;
  final List<FutureBuilderAnnouncements> contentList;

  HomeTabBarComponent(this.length, this.tabList, this.contentList);

  @override
  Widget build(BuildContext context) {
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
                //labelStyle: TextStyle(color: Colors.grey, fontSize: 25.0),
                tabs: length == 0
                    ? [Tab(text: "Erciyes Üniversitesi Anasayfası")]
                    : tabList,
              ),
            ),
            Expanded(
              child: Container(
                height: 80.0,
                color: Colors.white,
                child: TabBarView(
                  children: length == 0
                      ? [
                          FutureBuilderAnnouncements(
                            departmentName: Department.getDepartmentName(
                              DepartmentTypes.AnasayfaErciyesUniversitesi,
                            ),
                          ),
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
}
