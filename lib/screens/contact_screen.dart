import 'dart:ui';
import 'dart:convert';
import 'package:anons/services/alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:anons/models/person.dart';
import 'package:anons/components/contact_list_tile.dart';

List<Person> people = List<Person>();
List<Person> searchResult = List<Person>();

class ContactScreen extends StatefulWidget {
  ContactScreen({Key key}) : super(key: key);

  @override
  _ContactScreenState createState() => new _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  TextEditingController editingController = TextEditingController();

  Future<String> _loadFromAsset() async {
    return await rootBundle.loadString("assets/contact_list.json");
  }

  Future<Null> parseJson() async {
    String jsonString = await _loadFromAsset();

    final jsonResponse = jsonDecode(jsonString)['people'] as List;
    List<Person> peopleList =
        jsonResponse.map((tagJson) => Person.fromJson(tagJson)).toList();

    people.clear();
    for (Person person in peopleList) people.add(person);
  }

  @override
  void initState() {
    super.initState();
    parseJson();
  }

  void filterSearchResults(String query) async {
    searchResult.clear();

    if (query.isEmpty) {
      setState(() {});
      return;
    }

    people.forEach((person) {
      if (person.name.toLowerCase().contains(query.toLowerCase()) ||
          person.department.toLowerCase().contains(query.toLowerCase()))
        searchResult.add(person);
    });

    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    searchResult.clear();
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
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          color: Colors.white,
                          height: 45,
                          child: Theme(
                            data: ThemeData(
                              primaryColor: Colors.amber[700],
                            ),
                            child: TextField(
                              focusNode: FocusNode(),
                              enableInteractiveSelection: true,
                              textAlign: TextAlign.start,
                              onChanged: (value) {
                                filterSearchResults(value);
                              },
                              controller: editingController,
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.search),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(8.0)))),
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.info_outline,
                          color: Colors.grey[700],
                        ),
                        onPressed: () {
                          AlertDialogHelper alert = AlertDialogHelper();
                          alert.show(context, "Filtreleme",
                              "Aradığınız kişinin adını/soyadını ya da bölüm/fakülte bilgisini arama kutusuna yazarak sonuçları filtreleyebilirsiniz.");
                        },
                        iconSize: 35.0,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: searchResult.length != 0 ||
                          editingController.text.isNotEmpty
                      ? ListView.builder(
                          shrinkWrap: true,
                          itemCount: searchResult.length,
                          itemBuilder: (context, i) {
                            return ContactListTile(
                              person: searchResult[i],
                            );
                          },
                        )
                      : ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: people.length,
                          itemBuilder: (context, i) {
                            return ContactListTile(person: people[i]);
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
