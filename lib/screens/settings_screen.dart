import 'package:anons/index.dart';
import 'package:flutter/material.dart';
import 'package:anons/services/toast.dart';

import 'package:anons/services/storage.dart';

bool changeState = false;

List<String> _departmentSwitchStates = List<String>();

class SettingsScreen extends StatelessWidget {
  Future<List> readDeviceStorage() async {
    _departmentSwitchStates = await DeviceStorage().read();

    return _departmentSwitchStates;
  }

  Future<void> onTap(BuildContext context) async {
    await DeviceStorage().write(_departmentSwitchStates);

    Navigator.pop(context, changeState);
  }

  @override
  Widget build(BuildContext context) {
    changeState = false;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kAppBarColor,
        title: Text("Varsayılan Anasayfa Ayarları"),
        //Settings Icon
      ),
      body: FutureBuilder(
        future: readDeviceStorage(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                DepartmentsList(),
                BottomButton(
                  title: "Değişiklikleri Kaydet",
                  onTap: () {
                    onTap(context);
                  },
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

class DepartmentsList extends StatelessWidget {
  const DepartmentsList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 10,
      child: ListView(
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
  bool switchControl(String departmentName) {
    if (_departmentSwitchStates.indexOf(departmentName) != -1) return true;
    return false;
  }

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
          onChanged: (bool value) async {
            setState(() {
              //Eğer ilgili bölüm cihaza eklenmişse
              if (_departmentSwitchStates.indexOf(widget.title) != -1) {
                //Listeden sil.
                _departmentSwitchStates.remove(widget.title);
                isSwitched = false;
              }
              //Yok ise listeye ekle.
              else {
                _departmentSwitchStates.add(widget.title);
                isSwitched = true;
              }

              changeState = true;
            });
          },
        ),
      ),
    );
  }
}

class BottomButton extends StatelessWidget {
  BottomButton({@required this.title, @required this.onTap});

  final String title;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (changeState)
          onTap();
        else
          Toast.show(context, "Herhangi bir değişiklik yapmadın!");
      },
      child: Container(
        child: Center(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        color: Color(0xFFF9A81A),
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: 56.0,
        padding: EdgeInsets.only(bottom: 10.0),
      ),
    );
  }
}
