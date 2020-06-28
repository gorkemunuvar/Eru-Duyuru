import '../people.dart';
import '../components/custom_list_tile.dart';
import 'package:flutter/material.dart';

class Contacts extends StatelessWidget {
  final List<People> people = List();

  @override
  Widget build(BuildContext context) {
    people.add(
        People("Derviş Karaboğa", "12 31 221 321", "dervis@erciyes.edu.tr"));
    people.add(
        People("Alper Karaboğa", "12 31 221 321", "dervis@erciyes.edu.tr"));
    people.add(
        People("Bahriye Karaboğa", "12 31 221 321", "dervis@erciyes.edu.tr"));
    people.add(
        People("Görkem Karaboğa", "12 31 221 321", "dervis@erciyes.edu.tr"));
    people.add(
        People("Görkem Karaboğa", "12 31 221 321", "dervis@erciyes.edu.tr"));
    people.add(
        People("Görkem Karaboğa", "12 31 221 321", "dervis@erciyes.edu.tr"));
    people.add(
        People("Görkem Karaboğa", "12 31 221 321", "dervis@erciyes.edu.tr"));
    people.add(
        People("Görkem Karaboğa", "12 31 221 321", "dervis@erciyes.edu.tr"));

    final title = 'Kişiler';
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(5.0),
          child: ListView.builder(
            itemCount: people.length,
            itemBuilder: (context, index) {
              return CustomListTile(
                name: people[index].name,
                email: people[index].email,
                phoneNumber: people[index].phoneNumber,
              );
            },
          ),
        ),
      ),
    );
  }
}
