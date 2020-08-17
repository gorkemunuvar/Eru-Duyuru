import 'package:anons/index.dart';

int _departmentsLength = 0;
List<Tab> _tabList = List<Tab>();
List<FutureBuilderAnnouncements> _contentList =
    List<FutureBuilderAnnouncements>();

Future<List> _readDepartmentsOnDevice() async {
  List<String> departmentNames = await DeviceStorage().read();

  _departmentsLength = departmentNames.length;

  for (String departmentName in departmentNames) {
    _tabList.add(Tab(text: departmentName));
    _contentList
        .add(FutureBuilderAnnouncements(departmentName: departmentName));
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
      FutureBuilderTabs(),
      DepartmentsListView(),
      ContactScreen(),
      ShortcutScreen(),
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
    _departmentsLength = 0;
    _tabList.clear();
    _contentList.clear();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kAppBarColor,
        title: Text('Erciyes Üniversitesi'),
        actions: <Widget>[
          Builder(
            builder: (context) => Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: Row(
                children: <Widget>[
                  //Settings Icon
                  IconButton(
                    icon: Icon(
                      Icons.settings,
                      size: 26.0,
                    ),
                    onPressed: () async {
                      var settings = await Routing.navigatorKey.currentState
                          .pushNamed('/Settings');

                      if (settings == true) {
                        setState(() {
                          updateUI();

                          Future.delayed(const Duration(milliseconds: 600), () {
                            Toast.show(
                                context, "Değişiklikler anasayfana eklendi.");
                          });
                        });
                      }
                    },
                  ),
                ],
              ),
            ),
          )
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

class FutureBuilderTabs extends StatefulWidget {
  const FutureBuilderTabs({
    Key key,
  }) : super(key: key);

  @override
  _FutureBuilderTabsState createState() => _FutureBuilderTabsState();
}

class _FutureBuilderTabsState extends State<FutureBuilderTabs> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _readDepartmentsOnDevice(),
      builder: (context, snapshot) {
        try {
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
        } catch (e) {}

        return Container(
          width: 0,
          height: 0,
        );
      },
    );
  }
}
