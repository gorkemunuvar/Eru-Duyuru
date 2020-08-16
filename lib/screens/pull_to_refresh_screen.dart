import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

void main() => runApp(PullToRefresh());

class PullToRefresh extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pull To Refresh',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var list;
  var random;

  var refreshKey = GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    list = List.generate(3, (i) => "Item $i");
    super.initState();
    random = Random();
    refreshList();
  }

  Future<Null> refreshList() async {
    refreshKey.currentState?.show(atTop: false);

    //await Future.delayed(Duration(seconds: 1));

    setState(() {
      list = List.generate(random.nextInt(100), (i) => "Item $i");
    });

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        key: refreshKey,
        child: ListView.builder(
          itemCount: list?.length,
          itemBuilder: (context, i) => ListTile(
            title: Text(list[i]),
          ),
        ),
        onRefresh: refreshList,
      ),
    );
  }
}
