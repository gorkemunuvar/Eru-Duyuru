import 'index.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;

  List<Widget> _widgetOptions = <Widget>[
    DefaultTabController(
      length: 3,
      child: Container(
        child: Column(
          children: <Widget>[
            new Container(
              child: new TabBar(
                indicatorColor: Colors.amber[700],
                labelColor: Colors.amber[700],
                unselectedLabelColor: Colors.grey,
                tabs: [
                  Tab(text: 'Bilgisayar Mühehndisliği'),
                  Tab(text: 'E. Elektronik Mühendislii'),
                  Tab(text: 'Makina Mühendisliği'),
                ],
              ),
            ),
            Expanded(
              child: new Container(
                height: 80.0,
                child: TabBarView(
                  children: <Widget>[
                    FutureBuilder(
                      future: initiate(
                        'https://bm.erciyes.edu.tr/?Anasayfa',
                        'https://bm.erciyes.edu.tr/index.asp',
                      ),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return AnnouncementsScreen(
                            announcements: HtmlParsing.getAnnouncements(),
                          );
                        } else if (snapshot.hasError)
                          return Text("${snapshot.error}");

                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    ),
                    FutureBuilder(
                      future: initiate(
                        'https://em.erciyes.edu.tr/?Anasayfa',
                        'https://em.erciyes.edu.tr/',
                      ),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return AnnouncementsScreen(
                            announcements: HtmlParsing.getAnnouncements(),
                          );
                        } else if (snapshot.hasError)
                          return Text("${snapshot.error}");

                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    ),
                    FutureBuilder(
                      future: initiate('https://me.erciyes.edu.tr/?Anasayfa',
                          'https://me.erciyes.edu.tr/'),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return AnnouncementsScreen(
                            announcements: HtmlParsing.getAnnouncements(),
                          );
                        } else if (snapshot.hasError)
                          return Text("${snapshot.error}");

                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
    Contacts(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //Settings
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return SetttingsScreen();
                    }),
                  );
                },
                child: Icon(
                  Icons.settings,
                  size: 26.0,
                ),
              )),
        ],
        backgroundColor: Colors.amber[700],
        title: const Text('Erciyes Üniversitesi'),
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.perm_contact_calendar),
            title: Text('Rehber'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}

/* class TabBarNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TabBarView(controller: ,children: <Widget>[
      Text("Scrreen 1"),
      Text("Screen 2"),
      Text("Screen 3"),
    ]);
  }
}
 */
