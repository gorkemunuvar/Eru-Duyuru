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

  List<Announcement> makine = List();
  List<Announcement> bilgisayar = List();
  List<Announcement> elektrik = List();

  List<Widget> _widgetOptions = <Widget>[
    DefaultTabController(
      length: 3,
      child: Container(
        child: Column(
          children: <Widget>[
            Container(
              child: TabBar(
                isScrollable: true,
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
              child: Container(
                height: 80.0,
                child: TabBarView(
                  children: <Widget>[
                    AnnouncementsScreen(
                      announcements: HtmlParsing.getAnnouncements("Bilgisayar"),
                    ),
                    AnnouncementsScreen(
                      announcements: HtmlParsing.getAnnouncements("Elektirik"),
                    ),
                    AnnouncementsScreen(
                      announcements: HtmlParsing.getAnnouncements("Makine"),
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
    List<Department> departments = [
      Department(
        name: 'Bilgisayar',
        url: 'https://bm.erciyes.edu.tr/?Anasayfa',
        startingLink: 'https://bm.erciyes.edu.tr/',
      ),
      Department(
        name: 'Elektirik',
        url: 'https://em.erciyes.edu.tr/?Anasayfa',
        startingLink: 'https://em.erciyes.edu.tr/',
      ),
      Department(
        name: 'Makine',
        url: 'https://me.erciyes.edu.tr/?Anasayfa',
        startingLink: 'https://me.erciyes.edu.tr/',
      )
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber[700],
        title: const Text('Erciyes Üniversitesi'),
        //Settings Icon
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
      ),
      body: FutureBuilder(
        future: initiate(departments),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return _widgetOptions.elementAt(_selectedIndex);
          } else if (snapshot.hasError) return Text("${snapshot.error}");

          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),

      //_widgetOptions.elementAt(_selectedIndex),
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
