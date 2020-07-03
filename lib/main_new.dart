import 'package:flutter/material.dart';

void main() {
  runApp(new ExpansionTileSample());
}

class ExpansionTileSample extends StatefulWidget {
  @override
  ExpansionTileSampleState createState() => new ExpansionTileSampleState();
}

class ExpansionTileSampleState extends State<ExpansionTileSample> {
  String foos = 'One';

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('ExpansionTile'),
        ),
        body: ExpansionTile(
            title: Text(this.foos),
            backgroundColor: Theme.of(context).accentColor.withOpacity(0.025),
            children: <Widget>[
              ListTile(
                title: const Text('One'),
                onTap: () {
                  setState(() {
                    this.foos = 'One';
                  });
                },
              ),
              ListTile(
                title: const Text('Two'),
                onTap: () {
                  setState(() {
                    this.foos = 'Two';
                  });
                },
              ),
              ListTile(
                title: const Text('Three'),
                onTap: () {
                  setState(() {
                    this.foos = 'Three';
                  });
                },
              ),
            ]),
      ),
    );
  }
}
