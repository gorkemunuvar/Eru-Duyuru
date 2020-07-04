import 'package:flutter/material.dart';
import 'package:anons/models/department.dart';
import 'package:anons/components/future_builder_announcements.dart';

DefaultTabController HomeTabBar() {
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
                    Department.getDepartmentInstance(
                        DepartmentTypes.MuhendislikBilgisayar),
                  ),
                  FutureBuilderAnnouncements(
                    Department.getDepartmentInstance(
                        DepartmentTypes.MuhendislikElektrik),
                  ),
                  FutureBuilderAnnouncements(
                    Department.getDepartmentInstance(
                        DepartmentTypes.MuhendislikMakine),
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
