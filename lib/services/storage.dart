import 'package:anons/index.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DeviceStorage {
  Future<void> write(List<String> departmentNames) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList('departments', departmentNames);
  }

  Future<List> read() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> stringList = prefs.getStringList('departments') ?? [];

    return stringList;
  }
}
