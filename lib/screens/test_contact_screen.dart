import 'dart:ui';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:anons/models/person.dart';
import 'package:anons/components/contact_list_tile.dart';

List<Person> people = List<Person>();
List<Person> searchResult = List<Person>();

class TestContacts extends StatefulWidget {
  TestContacts({Key key}) : super(key: key);

  @override
  _TestContactsState createState() => new _TestContactsState();
}

class _TestContactsState extends State<TestContacts> {
  TextEditingController editingController = TextEditingController();

  Future<String> _loadFromAsset() async {
    return await rootBundle.loadString("assets/contact_list.json");
  }

  Future<Null> parseJson() async {
    String jsonString = await _loadFromAsset();

    final jsonResponse = jsonDecode(jsonString)['people'] as List;
    List<Person> people_list =
        jsonResponse.map((tagJson) => Person.fromJson(tagJson)).toList();

    people.clear();
    for (Person person in people_list) people.add(person);
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
      if (person.name.toLowerCase().contains(query.toLowerCase()))
        searchResult.add(person);
    });

    setState(() {});
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
