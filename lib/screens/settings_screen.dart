import 'package:anons/index.dart';
import 'package:flutter/material.dart';
import 'package:anons/services/storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

List<String> _departmentSwitchStates = List<String>();

//Map<departmentName, isSwitched>
//Future<Map<String, bool>>> olabilir.
Future<List<String>> _readDeviceStorage() async {
  final prefs = await SharedPreferences.getInstance();
  List<String> departmentNames = prefs.getStringList('departments') ?? [];

  for (String name in departmentNames) {
    print(name);
    _departmentSwitchStates.add(name);
  }

  return _departmentSwitchStates;
}

bool switchControl(String departmentName) {
  if (_departmentSwitchStates.indexOf(departmentName) != -1) return true;
  return false;
}

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kAppBarColor,
        title: Text("Varsayılan Anasayfa Ayarları"),
        //Settings Icon
      ),
      body: FutureBuilder(
        future: _readDeviceStorage(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView(
              children: <Widget>[
                DepartmentsExpansionTile(
                  title: "Fakülteler ve Bölümler",
                  paddingState: false,
                  childrens: <Widget>[
                    DepartmentsExpansionTile(
                      title: "Mühendislik Fakültesi",
                      childrens: <Widget>[
                        SwitchListTileCard(
                          title: "Mühendislilk Fakültesi Anasayfası",
                        ),
                        SwitchListTileCard(
                          title: "Bilgisayar Mühendisliği",
                        ),
                        SwitchListTileCard(
                          title: "Biyomedikal Mühendisliği",
                        ),
                        SwitchListTileCard(
                          title: "Çevre Mühendisliği",
                        ),
                        SwitchListTileCard(
                          title: "Elektrik-Elektronik Mühendisliği",
                        ),
                        SwitchListTileCard(
                          title: "Endüstri Mühendisliği",
                        ),
                        SwitchListTileCard(
                          title: "Endüstriyel Tasarım Mühendisliği",
                        ),
                        SwitchListTileCard(
                          title: "Enerji Sistemleri Mühendisliği",
                        ),
                        SwitchListTileCard(
                          title: "Gıda Mühendisliği",
                        ),
                        SwitchListTileCard(
                          title: "Harita Mühendisliği",
                        ),
                        SwitchListTileCard(
                          title: "İnşaat Mühendisliği",
                        ),
                        SwitchListTileCard(
                          title: "Makine Mühendisliği",
                        ),
                        SwitchListTileCard(
                          title: "Malzeme Bilimi Mühendisliği",
                        ),
                        SwitchListTileCard(
                          title: "Mekatronik Mühendisliği",
                        ),
                        SwitchListTileCard(
                          title: "Tekstil Mühendisliği",
                        ),
                      ],
                    ),
                    DepartmentsExpansionTile(
                      title: "Eğitim Fakültesi",
                      childrens: <Widget>[
                        SwitchListTileCard(
                          title: "Eğitim Fakültesi Anasayfası",
                        ),
                        SwitchListTileCard(
                          title: "Eğitim Bilimleri",
                        ),
                        SwitchListTileCard(
                          title: "Matematik ve Fen Bilimleri",
                        ),
                        SwitchListTileCard(
                          title: "Temel Eğitim",
                        ),
                        SwitchListTileCard(
                          title: "Türkçe Ve Sosyal Bilimler",
                        ),
                        SwitchListTileCard(
                          title: "Yabancı Diller",
                        ),
                        SwitchListTileCard(
                          title: "Özel Eğitim",
                        ),
                      ],
                    ),
                    SwitchListTileCard(
                      title: "Diş Hekimliği Fakültesi",
                    ),
                    SwitchListTileCard(
                      title: "Eczacılık Fakültesi",
                    ),
                    SwitchListTileCard(
                      title: "Edebiyat Fakültesi",
                    ),
                    SwitchListTileCard(
                      title: "Fen Fakültesi",
                    ),
                    SwitchListTileCard(
                      title: "Güzel Sanatlar Fakültesi",
                    ),
                    SwitchListTileCard(
                      title: "Havacılık Fakültesi",
                    ),
                    SwitchListTileCard(
                      title: "Hukuk Fakültesi",
                    ),
                    SwitchListTileCard(
                      title: "İktisadi Ve İdari Bilimler Fakültesi",
                    ),
                    SwitchListTileCard(
                      title: "İlahiyat Fakültesi",
                    ),
                    SwitchListTileCard(
                      title: "İletişim Fakültesi",
                    ),
                    SwitchListTileCard(
                      title: "Mimarlık Fakültesi",
                    ),
                    SwitchListTileCard(
                      title: "Sağlık Bilimleri Fakültesi",
                    ),
                    SwitchListTileCard(
                      title: "Seyrani Ziraat Fakültesi",
                    ),
                    SwitchListTileCard(
                      title: "Spor Bilimleri Fakültesi",
                    ),
                    SwitchListTileCard(
                      title: "Tıp Fakültesi",
                    ),
                    SwitchListTileCard(
                      title: "Turizm Fakültesi",
                    ),
                    SwitchListTileCard(
                      title: "Veteriner Fakültesi",
                    ),
                  ],
                ),
                DepartmentsExpansionTile(
                  paddingState: false,
                  title: "Meslek Yüksek Okulları",
                  childrens: <Widget>[
                    SwitchListTileCard(
                      title: "Adalet Meslek Yüksekokulu",
                    ),
                    SwitchListTileCard(
                      title: "Halil Bayraktar... Yüksekokulu",
                    ),
                  ],
                ),
                DepartmentsExpansionTile(
                  paddingState: false,
                  title: "Enstitüler",
                  childrens: <Widget>[
                    SwitchListTileCard(
                      title: "Atatürk İlkeleri ve İnkılap Tarihi Enstitüsü",
                    ),
                    SwitchListTileCard(
                      title: "Eğitim Bilimleri Enstitüsü",
                    ),
                    SwitchListTileCard(
                      title: "Fen Bilimleri Enstitüsü",
                    ),
                    SwitchListTileCard(
                      title: "Gevher Nesibe Genom ve Kök Hücre Enstitüsü",
                    ),
                    SwitchListTileCard(
                      title: "Güzel Sanatlar Enstitüsü",
                    ),
                    SwitchListTileCard(
                      title: "Sağlık Bilimleri Enstitüsü",
                    ),
                    SwitchListTileCard(
                      title: "Sosyal Bilimler Enstitüsü",
                    ),
                  ],
                ),
                SwitchListTileCard(
                  paddingState: false,
                  title: "Yabancı Diller Yüksekokulu",
                ),
                SwitchListTileCard(
                  paddingState: false,
                  title: "Erciyes Üniversitesi Anasayfası",
                ),
                SwitchListTileCard(
                  paddingState: false,
                  title: "Öğrenci İşleri",
                ),
                SwitchListTileCard(
                  paddingState: false,
                  title: "Obisis Duyuruları",
                ),
                SwitchListTileCard(
                  paddingState: false,
                  title: "Erasmus Duyuruları",
                ),
                SwitchListTileCard(
                  paddingState: false,
                  title: "Farabi Duyuruları",
                ),
                SwitchListTileCard(
                  paddingState: false,
                  title: "Erüzem Duyuruları",
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

class SwitchListTileCard extends StatefulWidget {
  final String title;
  final bool paddingState;

  const SwitchListTileCard({Key key, @required this.title, this.paddingState})
      : super(key: key);

  @override
  _SwitchListTileCardState createState() => _SwitchListTileCardState();
}

class _SwitchListTileCardState extends State<SwitchListTileCard> {
  @override
  Widget build(BuildContext context) {
    bool isSwitched = switchControl(widget.title);

    return Padding(
      padding: widget.paddingState == null
          ? EdgeInsets.symmetric(horizontal: 15.0)
          : EdgeInsets.zero,
      child: Card(
        child: SwitchListTile(
          title: Text(widget.title),
          value: isSwitched,
          onChanged: (bool value) {
            setState(() {
              //eğer listede 'obisis' varsa sil
              if (_departmentSwitchStates.indexOf(widget.title) != -1) {
                _departmentSwitchStates.remove(widget.title);
                isSwitched = false;
              }
              //yoksa ekle
              else {
                _departmentSwitchStates.add(widget.title);
                isSwitched = true;
              }

              //Yeni listi cihaza yaz
              DeviceStorage.write(_departmentSwitchStates);

              //_lights = value;
            });
          },
        ),
      ),
    );
  }
}
