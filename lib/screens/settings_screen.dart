import 'package:anons/index.dart';
import 'package:flutter/material.dart';
import 'package:anons/components/switch_list_tile.dart';
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
                FlatButton(
                  onPressed: () {
                    DeviceStorage.write([
                      "Fen Bilimleri Enstitüsü",
                      "Bilgisayar Mühendisliği",
                      "Obisis Duyuruları",
                      "Makine Mühendisliği",
                      "Erasmus Duyuruları",
                    ]);
                  },
                  child: Text("Write"),
                ),
                DepartmentsExpansionTile(
                  title: "Fakülteler ve Bölümler",
                  paddingState: false,
                  childrens: <Widget>[
                    DepartmentsExpansionTile(
                      title: "Mühendislik Fakültesi",
                      childrens: <Widget>[
                        SwitchListTileCard(
                          title: "Mühendislilk Fakültesi Anasayfası",
                          isSwitched: switchControl(
                              'Mühendislilk Fakültesi Anasayfası'),
                        ),
                        SwitchListTileCard(
                          title: "Bilgisayar Mühendisliği",
                          isSwitched: switchControl(
                            'Bilgisayar Mühendisliği',
                          ),
                        ),
                        SwitchListTileCard(
                          title: "Biyomedikal Mühendisliği",
                          isSwitched: switchControl('Biyomedikal Mühendisliği'),
                        ),
                        SwitchListTileCard(
                          title: "Çevre Mühendisliği",
                          isSwitched: switchControl('Çevre Mühendisliği'),
                        ),
                        SwitchListTileCard(
                          title: "Elektrik-Elektronik Mühendisliği",
                          isSwitched:
                              switchControl('Elektrik-Elektronik Mühendisliği'),
                        ),
                        SwitchListTileCard(
                          title: "Endüstri Mühendisliği",
                          isSwitched: switchControl('Endüstri Mühendisliği'),
                        ),
                        SwitchListTileCard(
                          title: "Endüstriyel Tasarım Mühendisliği",
                          isSwitched:
                              switchControl('Endüstriyel Tasarım Mühendisliği'),
                        ),
                        SwitchListTileCard(
                          title: "Enerji Sistemleri Mühendisliği",
                          isSwitched:
                              switchControl('Enerji Sistemleri Mühendisliği'),
                        ),
                        SwitchListTileCard(
                          title: "Gıda Mühendisliği",
                          isSwitched: switchControl('Gıda Mühendisliği'),
                        ),
                        SwitchListTileCard(
                          title: "Harita Mühendisliği",
                          isSwitched: switchControl('Harita Mühendisliği'),
                        ),
                        SwitchListTileCard(
                          title: "İnşaat Mühendisliği",
                          isSwitched: switchControl('İnşaat Mühendisliği'),
                        ),
                        SwitchListTileCard(
                          title: "Makine Mühendisliği",
                          isSwitched: switchControl('Makine Mühendisliği'),
                        ),
                        SwitchListTileCard(
                          title: "Malzeme Bilimi Mühendisliği",
                          isSwitched:
                              switchControl('Malzeme Bilimi Mühendisliği'),
                        ),
                        SwitchListTileCard(
                          title: "Mekatronik Mühendisliği",
                          isSwitched: switchControl('Mekatronik Mühendisliği'),
                        ),
                        SwitchListTileCard(
                          title: "Tekstil Mühendisliği",
                          isSwitched: switchControl('Tekstil Mühendisliği'),
                        ),
                      ],
                    ),
                    DepartmentsExpansionTile(
                      title: "Eğitim Fakültesi",
                      childrens: <Widget>[
                        SwitchListTileCard(
                          title: "Eğitim Fakültesi Anasayfası",
                          isSwitched:
                              switchControl('Eğitim Fakültesi Anasayfası'),
                        ),
                        SwitchListTileCard(
                          title: "Eğitim Bilimleri",
                          isSwitched: switchControl('Eğitim Bilimleri'),
                        ),
                        SwitchListTileCard(
                          title: "Matematik ve Fen Bilimleri",
                          isSwitched:
                              switchControl('Matematik ve Fen Bilimleri'),
                        ),
                        SwitchListTileCard(
                          title: "Temel Eğitim",
                          isSwitched: switchControl('Temel Eğitim'),
                        ),
                        SwitchListTileCard(
                          title: "Türkçe Ve Sosyal Bilimler",
                          isSwitched:
                              switchControl('Türkçe Ve Sosyal Bilimler'),
                        ),
                        SwitchListTileCard(
                          title: "Yabancı Diller",
                          isSwitched: switchControl('Yabancı Diller'),
                        ),
                        SwitchListTileCard(
                          title: "Özel Eğitim",
                          isSwitched: switchControl('Özel Eğitim'),
                        ),
                      ],
                    ),
                    SwitchListTileCard(
                      title: "Diş Hekimliği Fakültesi",
                      isSwitched: switchControl('Diş Hekimliği Fakültesi'),
                    ),
                    SwitchListTileCard(
                      title: "Eczacılık Fakültesi",
                      isSwitched: switchControl('Eczacılık Fakültesi'),
                    ),
                    SwitchListTileCard(
                      title: "Edebiyat Fakültesi",
                      isSwitched: switchControl('Edebiyat Fakültesi'),
                    ),
                    SwitchListTileCard(
                      title: "Fen Fakültesi",
                      isSwitched: switchControl('Fen Fakültesi'),
                    ),
                    SwitchListTileCard(
                      title: "Güzel Sanatlar Fakültesi",
                      isSwitched: switchControl('Güzel Sanatlar Fakültesi'),
                    ),
                    SwitchListTileCard(
                      title: "Havacılık Fakültesi",
                      isSwitched: switchControl('Havacılık Fakültesi'),
                    ),
                    SwitchListTileCard(
                      title: "Hukuk Fakültesi",
                      isSwitched: switchControl('Hukuk Fakültesi'),
                    ),
                    SwitchListTileCard(
                      title: "İktisadi Ve İdari Bilimler Fakültesi",
                      isSwitched:
                          switchControl('İktisadi Ve İdari Bilimler Fakültesi'),
                    ),
                    SwitchListTileCard(
                      title: "İlahiyat Fakültesi",
                      isSwitched: switchControl('İlahiyat Fakültesi'),
                    ),
                    SwitchListTileCard(
                      title: "İletişim Fakültesi",
                      isSwitched: switchControl('İletişim Fakültesi'),
                    ),
                    SwitchListTileCard(
                      title: "Mimarlık Fakültesi",
                      isSwitched: switchControl('Mimarlık Fakültesi'),
                    ),
                    SwitchListTileCard(
                      title: "Sağlık Bilimleri Fakültesi",
                      isSwitched: switchControl('Sağlık Bilimleri Fakültesi'),
                    ),
                    SwitchListTileCard(
                      title: "Seyrani Ziraat Fakültesi",
                      isSwitched: switchControl('Seyrani Ziraat Fakültesi'),
                    ),
                    SwitchListTileCard(
                      title: "Spor Bilimleri Fakültesi",
                      isSwitched: switchControl('Spor Bilimleri Fakültesi'),
                    ),
                    SwitchListTileCard(
                      title: "Tıp Fakültesi",
                      isSwitched: switchControl('Tıp Fakültesi'),
                    ),
                    SwitchListTileCard(
                      title: "Turizm Fakültesi",
                      isSwitched: switchControl('Turizm Fakültesi'),
                    ),
                    SwitchListTileCard(
                      title: "Veteriner Fakültesi",
                      isSwitched: switchControl('Veteriner Fakültesi'),
                    ),
                  ],
                ),
                DepartmentsExpansionTile(
                  paddingState: false,
                  title: "Meslek Yüksek Okulları",
                  childrens: <Widget>[
                    SwitchListTileCard(
                      title: "Adalet Meslek Yüksekokulu",
                      isSwitched: switchControl('Adalet Meslek Yüksekokulu'),
                    ),
                    SwitchListTileCard(
                      title: "Halil Bayraktar... Yüksekokulu",
                      isSwitched:
                          switchControl('Halil Bayraktar... Yüksekokulu'),
                    ),
                  ],
                ),
                DepartmentsExpansionTile(
                  paddingState: false,
                  title: "Enstitüler",
                  childrens: <Widget>[
                    SwitchListTileCard(
                      title: "Atatürk İlkeleri ve İnkılap Tarihi Enstitüsü",
                      isSwitched: switchControl(
                          'Atatürk İlkeleri ve İnkılap Tarihi Enstitüsü'),
                    ),
                    SwitchListTileCard(
                      title: "Eğitim Bilimleri Enstitüsü",
                      isSwitched: switchControl('Eğitim Bilimleri Enstitüsü'),
                    ),
                    SwitchListTileCard(
                      title: "Fen Bilimleri Enstitüsü",
                      isSwitched: switchControl('Fen Bilimleri Enstitüsü'),
                    ),
                    SwitchListTileCard(
                      title: "Gevher Nesibe Genom ve Kök Hücre Enstitüsü",
                      isSwitched: switchControl(
                          'Gevher Nesibe Genom ve Kök Hücre Enstitüsü'),
                    ),
                    SwitchListTileCard(
                      title: "Güzel Sanatlar Enstitüsü",
                      isSwitched: switchControl('Güzel Sanatlar Enstitüsü'),
                    ),
                    SwitchListTileCard(
                      title: "Sağlık Bilimleri Enstitüsü",
                      isSwitched: switchControl('Sağlık Bilimleri Enstitüsü'),
                    ),
                    SwitchListTileCard(
                      title: "Sosyal Bilimler Enstitüsü",
                      isSwitched: switchControl('Sosyal Bilimler Enstitüsü'),
                    ),
                  ],
                ),
                SwitchListTileCard(
                  paddingState: false,
                  title: "Yabancı Diller Yüksekokulu",
                  isSwitched: switchControl('Yabancı Diller Yüksekokulu'),
                ),
                SwitchListTileCard(
                  onChanged: () {
                    //eğer listede 'obisis' varsa sil
                    if (_departmentSwitchStates.indexOf("Obisis Duyuruları") !=
                        -1)
                      _departmentSwitchStates.remove("Obisis Duyuruları");
                    //yoksa ekle
                    else
                      _departmentSwitchStates.add("Obisis Duyuruları");

                    DeviceStorage.write(_departmentSwitchStates);
                  },
                  paddingState: false,
                  title: "Obisis Duyuruları",
                  isSwitched: switchControl('Obisis Duyuruları'),
                ),
                SwitchListTileCard(
                  paddingState: false,
                  title: "Erciyes Üniversitesi Anasayfası",
                  isSwitched: switchControl('Erciyes Üniversitesi Anasayfası'),
                ),
                SwitchListTileCard(
                  paddingState: false,
                  title: "Erasmus Duyuruları",
                  isSwitched: switchControl('Erasmus Duyuruları'),
                ),
                SwitchListTileCard(
                  paddingState: false,
                  title: "Mevlana Duyuruları",
                  isSwitched: switchControl('Mevlana Duyuruları'),
                ),
                SwitchListTileCard(
                  paddingState: false,
                  title: "Farabi Duyuruları",
                  isSwitched: switchControl('Farabi Duyuruları'),
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
