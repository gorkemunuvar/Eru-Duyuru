import 'package:shared_preferences/shared_preferences.dart';

class DeviceStorage {
  static List<String> _departmentList = List<String>();

  static write(List<String> departmentNames) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList('departments', departmentNames);

    print("Veri cihaza yazıldı");
  }

  static Future read() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> result = prefs.getStringList('departments') ?? [];

    return result;
  }
}
