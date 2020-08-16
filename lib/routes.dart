import 'models/department.dart';
import 'screens/home_screen.dart';
import 'screens/settings_screen.dart';
import 'package:flutter/material.dart';
import 'screens/department_announcements_screen.dart';

class Routing {
  static Department currentDepartment;
  static String currentDepartmentName = "";

  static GlobalKey<NavigatorState> navigatorKey =
      new GlobalKey<NavigatorState>();

  static Map<String, Widget Function(BuildContext)> initiateRoutes(
      BuildContext context) {
    return {
      '/': (context) => HomeScreen(),
      '/Settings': (context) => SettingsScreen(),
      '/DepartmentAnnouncements': (context) => DepartmentAnnouncementsScreen(
            title: currentDepartmentName,
            department: currentDepartment,
          ),
    };
  }
}
