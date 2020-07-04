import 'index.dart';

void main() => runApp(MyApp());

String currentDepartmentName = "";
Department currentDepartment;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/Settings': (context) => SetttingsScreen(),
        '/DepartmentAnnouncements': (context) => DepartmentAnnouncementsScreen(
              title: currentDepartmentName,
              department: currentDepartment,
            ),
      },
    );
  }
}

final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  List<Widget> _widgetOptions = <Widget>[
    TabBarComponent(),
    DepartmentsListView(),
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
        backgroundColor: kAppBarColor,
        title: const Text('Erciyes Üniversitesi'),
        //Settings Icon
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  navigatorKey.currentState.pushNamed('/Settings');
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
