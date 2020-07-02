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
    ListView.builder(
      itemBuilder: (BuildContext context, int index) => EntryItem(data[index]),
      itemCount: data.length,
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

// One entry in the multilevel list displayed by this app.
class Entry {
  Entry(this.title, [this.children = const <Entry>[]]);

  final String title;
  final List<Entry> children;
}

// The entire multilevel list displayed by this app.
final List<Entry> data = <Entry>[
  Entry(
    'Mühendislik Fakültesi',
    <Entry>[
      Entry('Bilgisayar Mühendisliği'),
      Entry('Biyomedikal Mühendisliği'),
      Entry('Çevre Mühendisliği'),
      Entry('Elektrik-Elektronik Mühendisliği'),
      Entry('Endüstri Mühendisliği'),
      Entry('Endüstriyel Tasarım Mühendisliği'),
      Entry('Enerji Sistemleri Mühendisliği'),
      Entry('Gıda Mühendisliği'),
      Entry('Harita Mühendisliği'),
      Entry('İnşaat Mühendisliği'),
      Entry('Makine Mühendisliği Bölümü'),
      Entry('Malzeme Bilimi ve Mühendisliği'),
      Entry('Mekatronik Mühendisliği'),
      Entry('Tekstil Mühendisliği'),
    ],
  ),
  Entry(
    'Chapter B',
    <Entry>[
      Entry('Section B0'),
      Entry('Section B1'),
    ],
  ),
  Entry(
    'Chapter C',
    <Entry>[
      Entry('Section C0'),
      Entry('Section C1'),
      Entry(
        'Section C2',
        <Entry>[
          Entry('Item C2.0'),
          Entry('Item C2.1'),
          Entry('Item C2.2'),
          Entry('Item C2.3'),
        ],
      ),
    ],
  ),
];

// Displays one Entry. If the entry has children then it's displayed
// with an ExpansionTile.
class EntryItem extends StatelessWidget {
  const EntryItem(this.entry);

  final Entry entry;

  Widget _buildTiles(Entry root) {
    if (root.children.isEmpty) return ListTile(title: Text(root.title));
    return ExpansionTile(
      key: PageStorageKey<Entry>(root),
      title: Text(root.title),
      children: root.children.map(_buildTiles).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry);
  }
}
