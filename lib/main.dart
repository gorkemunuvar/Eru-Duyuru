import 'index.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyStatefulWidget(),
      navigatorKey: navigatorKey,
    );
  }
}

final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

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
                    FutureBuilder(
                      future: initiate(
                        Department(
                          type: DepartmentTypes.Bilgisayar,
                          url: 'https://bm.erciyes.edu.tr/?Anasayfa',
                          startingLink: 'https://bm.erciyes.edu.tr/',
                        ),
                      ),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return AnnouncementsScreen(
                            announcements: HtmlParsing.getAnnouncements(
                                DepartmentTypes.Bilgisayar),
                          );
                        } else if (snapshot.hasError) {
                          return Text("${snapshot.error}");
                        }
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    ),
                    FutureBuilder(
                      future: initiate(
                        Department(
                          type: DepartmentTypes.Elektrik,
                          url: 'https://em.erciyes.edu.tr/?Anasayfa',
                          startingLink: 'https://em.erciyes.edu.tr/',
                        ),
                      ),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return AnnouncementsScreen(
                            announcements: HtmlParsing.getAnnouncements(
                                DepartmentTypes.Elektrik),
                          );
                        } else if (snapshot.hasError) {
                          return Text("${snapshot.error}");
                        }
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    ),
                    FutureBuilder(
                      future: initiate(
                        Department(
                          type: DepartmentTypes.Makine,
                          url: 'https://me.erciyes.edu.tr/?Anasayfa',
                          startingLink: 'https://me.erciyes.edu.tr/',
                        ),
                      ),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return AnnouncementsScreen(
                            announcements: HtmlParsing.getAnnouncements(
                                DepartmentTypes.Makine),
                          );
                        } else if (snapshot.hasError) {
                          return Text("${snapshot.error}");
                        }
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
    ListView(
      children: <Widget>[
        DepartmentsExpansionTile(
            title: "Mühendislik Fakültesi",
            childrens: <Widget>[
              ListTileCard(
                title: "Mühendislik Fakültesi Anasayfası",
                onTap: () {},
              ),
              ListTileCard(
                title: 'Bilgisayar Mühendisliği',
                onTap: () {},
              ),
              ListTileCard(
                title: 'Biyomedikal Mühendisliği',
                onTap: () {},
              ),
              ListTileCard(
                title: 'Çevre Mühendisliği',
                onTap: () {},
              ),
              ListTileCard(
                title: 'Elektrik-Elektronik Mühendisliği',
                onTap: () {},
              ),
              ListTileCard(
                title: 'Endüstri Mühendisliği',
                onTap: () {},
              ),
              ListTileCard(
                title: 'Endüstriyel Tasarım Mühendisliği',
                onTap: () {},
              ),
              ListTileCard(
                title: 'Enerji Sistemleri Mühendisliği',
                onTap: () {},
              ),
              ListTileCard(
                title: 'Gıda Mühendisliği',
                onTap: () {},
              ),
              ListTileCard(
                title: 'Harita Mühendisliği',
                onTap: () {},
              ),
              ListTileCard(
                title: 'İnşaat Mühendisliği',
                onTap: () {},
              ),
              ListTileCard(
                title: 'Makine Mühendisliği Bölümü',
                onTap: () {},
              ),
              ListTileCard(
                title: 'Malzeme Bilimi ve Mühendisliği',
                onTap: () {},
              ),
              ListTileCard(
                title: 'Mekatronik Mühendisliği',
                onTap: () {},
              ),
              ListTileCard(
                title: "Tekstil Mühendisliği ",
                onTap: () {},
              )
            ]),
      ],
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
      body: _widgetOptions.elementAt(_selectedIndex),

      //_widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Anasayfa'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            title: Text('Bölümler'),
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

class DepartmentsExpansionTile extends StatelessWidget {
  final String title;
  final List<Widget> childrens;

  DepartmentsExpansionTile({
    @required this.title,
    @required this.childrens,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ExpansionTile(
        title: Text(title),
        children: childrens,
      ),
    );
  }
}

class ListTileCard extends StatelessWidget {
  final String title;
  final Function onTap;

  ListTileCard({@required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Card(
        child: ListTile(
          title: Text(title),
          onTap: () {
            onTap();
          },
        ),
      ),
    );
  }
}
