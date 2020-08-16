import 'package:anons/index.dart';

int _departmentsLength = 0;
List<Tab> _tabList = List<Tab>();
List<FutureBuilderAnnouncements> _contentList =
    List<FutureBuilderAnnouncements>();

Future<List> _readDepartmentsOnDevice() async {
/* _departmentsLength = 0;
   _tabList.clear();
   _contentList.clear(); */

  List<String> departmentNames = await DeviceStorage().read();
  _departmentsLength = departmentNames.length;

  for (String departmentName in departmentNames) {
    _tabList.add(Tab(text: departmentName));
    _contentList.add(FutureBuilderAnnouncements(departmentName));
  }

  return departmentNames;
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> _bottomBarWidgetList = List<Widget>();

  void updateUI() {
    _departmentsLength = 0;
    _tabList.clear();
    _contentList.clear();
    _bottomBarWidgetList.clear();

    _bottomBarWidgetList = <Widget>[
      FutureBuilder(
        future: _readDepartmentsOnDevice(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return HomeTabBarComponent(
              _departmentsLength,
              _tabList,
              _contentList,
            );
          } else if (snapshot.connectionState != ConnectionState.done) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      DepartmentsListView(),
      ContactScreen(),
      InfoScreen(),
    ];
  }

  int _selectedBottomBarWidget = 0;

  void _onBottomBarTapped(int index) {
    setState(() {
      _selectedBottomBarWidget = index;
    });
  }

  @override
  void initState() {
    super.initState();
    updateUI();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kAppBarColor,
        title: const Text('Erciyes Üniversitesi'),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: Row(
              children: <Widget>[
                //Settings Icon
                IconButton(
                  icon: Icon(
                    Icons.settings,
                    size: 26.0,
                  ),
                  onPressed: () =>
                      Routing.navigatorKey.currentState.pushNamed('/Settings'),
                ),
                SizedBox(width: 15.0),
                //Update Icon
                GestureDetector(
                  onTap: () {
                    setState(() {
                      updateUI();
                      print("UI Updated.");
                    });
                  },
                  child: Icon(
                    Icons.update,
                    size: 26.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: _bottomBarWidgetList.elementAt(_selectedBottomBarWidget),
      bottomNavigationBar: BottomNavigationBarComponent(
        currentIndex: _selectedBottomBarWidget,
        onTap: _onBottomBarTapped,
      ),
    );
  }
}
