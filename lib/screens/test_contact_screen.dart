import 'dart:ui';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:anons/models/person.dart';
import 'package:anons/components/contact_list_tile.dart';

List<String> duplicateItems = List<String>();

Future<String> _loadFromAsset() async {
  return await rootBundle.loadString("assets/contact_list.json");
}

Future parseJson() async {
  String jsonString = await _loadFromAsset();

  final jsonResponse = jsonDecode(jsonString)['people'] as List;
  List<Person> people =
      jsonResponse.map((tagJson) => Person.fromJson(tagJson)).toList();

  for (Person person in people) duplicateItems.add(person.name);
}

class TestContacts extends StatefulWidget {
  TestContacts({Key key}) : super(key: key);

  @override
  _TestContactsState createState() => new _TestContactsState();
}

class _TestContactsState extends State<TestContacts> {
  TextEditingController editingController = TextEditingController();

  /* List<String> duplicateItems = [
    "Prof. Dr. Derviş Karaboğa",
  ]; */

  List<String> items = List<String>();

  @override
  void initState() {
    Future f = parseJson();
    f.then((value) {
      items.addAll(duplicateItems);
      super.initState();
    });
  }

  void filterSearchResults(String query) {
    List<String> dummySearchList = List<String>();
    dummySearchList.addAll(duplicateItems);
    if (query.isNotEmpty) {
      List<String> dummyListData = List<String>();
      dummySearchList.forEach((item) {
        if (item.contains(query)) {
          dummyListData.add(item);
        }
      });
      setState(() {
        items.clear();
        items.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        items.clear();
        items.addAll(duplicateItems);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: parseJson(),
      builder: (context, snapshot) {
        return Scaffold(
          body: Container(
            color: Colors.white,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 6.0),
                  child: Container(
                    color: Colors.white,
                    height: 45,
                    child: Theme(
                      data: ThemeData(
                        primaryColor: Colors.amber[700],
                      ),
                      child: TextField(
                        textAlign: TextAlign.start,
                        onChanged: (value) {
                          filterSearchResults(value);
                        },
                        controller: editingController,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.search),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.0)))),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      return ContactListTile(
                        name: "${items[index]}",
                        email: 'karaboga@erciyes.edu.tr',
                        phoneNumber: "Dahili No: 303132",
                        department: "Bilgisayar Mühendisliği",
                      );
                      /* return ListTile(
                      title: Text('${items[index]}'),
                    ); */
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

void _showToast(BuildContext context) {
  final scaffold = Scaffold.of(context);
  scaffold.showSnackBar(
    SnackBar(
      content: const Text('Added to favorite'),
      action: SnackBarAction(
          label: 'UNDO', onPressed: scaffold.hideCurrentSnackBar),
    ),
  );
}
