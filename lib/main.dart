import 'index.dart';
import 'screens/test_contact_screen.dart';

void main() => runApp(MyApp());

String currentDepartmentName = "";
Department currentDepartment;

int _departmentsLength = 0;
List<Tab> _tabList = List<Tab>();
List<FutureBuilder> _contentList = List<FutureBuilder>();

Future _readDeviceStorage() async {
  final prefs = await SharedPreferences.getInstance();
  List<String> departmentNames = prefs.getStringList('departments') ?? [];

  _departmentsLength = departmentNames.length;

  for (String name in departmentNames) {
    _tabList.add(Tab(text: name));
    _contentList.add(FutureBuilderAnnouncements(
      Department.getDepartmentInstance(Department.getDepartmentType(name)),
    ));
  }

  return departmentNames;
}

class MyApp extends StatelessWidget {
  MyApp() {
    print("test");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/Settings': (context) => SettingsScreen(),
        '/TestContacts': (context) => TestContacts(),
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
    FutureBuilder(
      future: _readDeviceStorage(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return HomeTabBar(
            _departmentsLength,
            _tabList,
            _contentList,
          );
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    ),
    DepartmentsListView(),
    //Contacts(),
    TestContacts(),
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
            ),
          ),
        ],
      ),
      body: _widgetOptions.elementAt(_selectedIndex),

      //_widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
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
