/* import '../models/person.dart';
import '../components/contact_list_tile.dart';
import 'package:flutter/material.dart';

class Contacts extends StatelessWidget {
  final List<Person> people = List();

  @override
  Widget build(BuildContext context) {
    people.add(
        Person("Derviş Karaboğa", "12 31 221 321", "dervis@erciyes.edu.tr"));
    people.add(
        Person("Alper Karaboğa", "12 31 221 321", "dervis@erciyes.edu.tr"));
    people.add(
        Person("Bahriye Karaboğa", "12 31 221 321", "dervis@erciyes.edu.tr"));
    people.add(
        Person("Görkem Karaboğa", "12 31 221 321", "dervis@erciyes.edu.tr"));
    people.add(
        Person("Görkem Karaboğa", "12 31 221 321", "dervis@erciyes.edu.tr"));
    people.add(
        Person("Görkem Karaboğa", "12 31 221 321", "dervis@erciyes.edu.tr"));
    people.add(
        Person("Görkem Karaboğa", "12 31 221 321", "dervis@erciyes.edu.tr"));
    people.add(
        Person("Görkem Karaboğa", "12 31 221 321", "dervis@erciyes.edu.tr"));

    final title = 'Kişiler';
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: ListView.builder(
        itemCount: people.length,
        itemBuilder: (context, index) {
          return ContactListTile(
            name: people[index].name,
            email: people[index].email,
            phoneNumber: people[index].phoneNumber,
          );
        },
      ),
    );
  }
}
 */
