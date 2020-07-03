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
      home: new Scaffold(
        appBar: new AppBar(
          title: const Text('ExpansionTile'),
        ),
        body: new ExpansionTile(
            title: new Text(this.foos),
            backgroundColor: Theme.of(context).accentColor.withOpacity(0.025),
            children: <Widget>[
              new ListTile(
                title: const Text('One'),
                onTap: () {
                  setState(() {
                    this.foos = 'One';
                  });
                },
              ),
              new ListTile(
                title: const Text('Two'),
                onTap: () {
                  setState(() {
                    this.foos = 'Two';
                  });
                },
              ),
              new ListTile(
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
