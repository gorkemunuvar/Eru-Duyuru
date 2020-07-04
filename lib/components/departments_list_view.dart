import 'package:anons/main.dart';
import 'package:flutter/material.dart';
import 'package:anons/components/list_tile_card.dart';
import 'package:anons/models/department.dart';
import 'package:anons/components/departments_expansion_tile.dart';

class DepartmentsListView extends StatelessWidget {
  void _showAnnouncements(String title, Department department) {
    //Those variables is for navigator in main.dart to navigate to /DepartmentAnnouncements
    currentDepartmentName = title;
    currentDepartment = department;

    navigatorKey.currentState.pushNamed('/DepartmentAnnouncements');
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        DepartmentsExpansionTile(
            title: "Mühendislik Fakültesi",
            childrens: <Widget>[
              ListTileCard(
                title: "Mühendislik Fakültesi Anasayfası",
                onTap: () {
                  _showAnnouncements(
                    "Mühendislik Fakültesi Anasayfası",
                    Department.getDepartmentInstance(
                        DepartmentTypes.MuhendislikAnasayfa),
                  );
                },
              ),
              ListTileCard(
                title: 'Bilgisayar Mühendisliği',
                onTap: () {
                  _showAnnouncements(
                    "Bilgisayar Mühendisliği",
                    Department.getDepartmentInstance(
                        DepartmentTypes.MuhendislikBilgisayar),
                  );
                },
              ),
              ListTileCard(
                title: 'Biyomedikal Mühendisliği',
                onTap: () {
                  _showAnnouncements(
                    "Biyomedikal Mühendisliği",
                    Department.getDepartmentInstance(
                        DepartmentTypes.MuhendislikBiyomedikal),
                  );
                },
              ),
              ListTileCard(
                title: 'Çevre Mühendisliği',
                onTap: () {
                  _showAnnouncements(
                    "Çevre Mühendisliği",
                    Department.getDepartmentInstance(
                        DepartmentTypes.MuhendislikCevre),
                  );
                },
              ),
              ListTileCard(
                title: 'Elektrik-Elektronik Mühendisliği',
                onTap: () {
                  _showAnnouncements(
                    "Elektrik-Elektronik Mühendisliği",
                    Department.getDepartmentInstance(
                        DepartmentTypes.MuhendislikElektrik),
                  );
                },
              ),
              ListTileCard(
                title: 'Endüstri Mühendisliği',
                onTap: () {
                  _showAnnouncements(
                    "Endustri Mühendisliği",
                    Department.getDepartmentInstance(
                        DepartmentTypes.MuhendislikEndustri),
                  );
                },
              ),
              ListTileCard(
                title: 'Endüstriyel Tasarım Mühendisliği',
                onTap: () {
                  _showAnnouncements(
                    "Endüstriyel Tasarım Mühendisliği",
                    Department.getDepartmentInstance(
                        DepartmentTypes.MuhendislikEndustriyelTasarim),
                  );
                },
              ),
              ListTileCard(
                title: 'Enerji Sistemleri Mühendisliği',
                onTap: () {
                  _showAnnouncements(
                    "Enerji Sistemleri Mühendisliği",
                    Department.getDepartmentInstance(
                        DepartmentTypes.MuhendislikEnerjiSistemleri),
                  );
                },
              ),
              ListTileCard(
                title: 'Gıda Mühendisliği',
                onTap: () {
                  _showAnnouncements(
                    "Gıda Mühendisliği",
                    Department.getDepartmentInstance(
                        DepartmentTypes.MuhendislikGida),
                  );
                },
              ),
              ListTileCard(
                title: 'Harita Mühendisliği',
                onTap: () {
                  _showAnnouncements(
                    "Harita Mühendisliği",
                    Department.getDepartmentInstance(
                        DepartmentTypes.MuhendislikHarita),
                  );
                },
              ),
              ListTileCard(
                title: 'İnşaat Mühendisliği',
                onTap: () {
                  _showAnnouncements(
                    "İnşaat Mühendisliği",
                    Department.getDepartmentInstance(
                        DepartmentTypes.MuhendislikInsaat),
                  );
                },
              ),
              ListTileCard(
                title: 'Makine Mühendisliği',
                onTap: () {
                  _showAnnouncements(
                    "Makine Mühendisliği",
                    Department.getDepartmentInstance(
                        DepartmentTypes.MuhendislikMakine),
                  );
                },
              ),
              ListTileCard(
                title: 'Malzeme Bilimi ve Mühendisliği',
                onTap: () {
                  _showAnnouncements(
                    "Malzeme Bilimi Mühendisliği",
                    Department.getDepartmentInstance(
                        DepartmentTypes.MuhendislikMalzemeBilimi),
                  );
                },
              ),
              ListTileCard(
                title: 'Mekatronik Mühendisliği',
                onTap: () {
                  _showAnnouncements(
                    "Mekatronik Mühendisliği",
                    Department.getDepartmentInstance(
                        DepartmentTypes.MuhendislikMekatronik),
                  );
                },
              ),
              ListTileCard(
                title: "Tekstil Mühendisliği ",
                onTap: () {
                  _showAnnouncements(
                    "Tekstil Mühendisliği",
                    Department.getDepartmentInstance(
                        DepartmentTypes.MuhendislikTekstil),
                  );
                },
              )
            ]),
        DepartmentsExpansionTile(title: "Eğitim Fakültesi", childrens: <Widget>[
          ListTileCard(
            title: "Eğitim Fakültesi Anasayfası",
            onTap: () {
              _showAnnouncements(
                "Eğitim Fakültesi Anasayfası",
                Department.getDepartmentInstance(
                    DepartmentTypes.EgitimAnasayfa),
              );
            },
          ),
          ListTileCard(
            title: "Eğitim Bilimleri",
            onTap: () {
              _showAnnouncements(
                "Eğitim Bilimleri",
                Department.getDepartmentInstance(
                    DepartmentTypes.EgitimEgitimBilimleri),
              );
            },
          ),
          ListTileCard(
            title: "Matematik Ve Fen Bilimleri",
            onTap: () {
              _showAnnouncements(
                "Matematik Ve Fen Bilimleri",
                Department.getDepartmentInstance(
                    DepartmentTypes.EgitimMatematikFenBilimleri),
              );
            },
          ),
          ListTileCard(
            title: "Temel Eğitim",
            onTap: () {
              _showAnnouncements(
                "Temel Eğitim",
                Department.getDepartmentInstance(
                    DepartmentTypes.EgitimTemelEgitim),
              );
            },
          ),
          ListTileCard(
            title: "Türkçe Ve Sosyal Bilimler",
            onTap: () {
              _showAnnouncements(
                "Türkçe Ve Sosyal Bilimler",
                Department.getDepartmentInstance(
                    DepartmentTypes.EgitimTurkceSosyalBilimler),
              );
            },
          ),
          ListTileCard(
            title: "Yabancı Diller",
            onTap: () {
              _showAnnouncements(
                "Yabancı Diller",
                Department.getDepartmentInstance(
                    DepartmentTypes.EgitimYabanciDiller),
              );
            },
          ),
          ListTileCard(
            title: "Özel Eğitim",
            onTap: () {
              _showAnnouncements(
                "Özel Eğitim",
                Department.getDepartmentInstance(
                    DepartmentTypes.EgitimOzelEgitim),
              );
            },
          ),
        ]),
        ListTileCard(
          paddingState: false,
          title: "Diş Hekimliği Fakültesi",
          onTap: () {
            _showAnnouncements(
              "Diş Hekimliği Fakültesi",
              Department.getDepartmentInstance(
                  DepartmentTypes.FakulteDisHekimligi),
            );
          },
        ),
        ListTileCard(
          paddingState: false,
          title: "Eczacılık Fakültesi",
          onTap: () {
            _showAnnouncements(
              "Eczacılık Fakültesi",
              Department.getDepartmentInstance(
                  DepartmentTypes.FakulteEczacilik),
            );
          },
        ),
        ListTileCard(
          paddingState: false,
          title: "Edebiyat Fakültesi",
          onTap: () {
            _showAnnouncements(
              "Edebiyat Fakültesi",
              Department.getDepartmentInstance(
                DepartmentTypes.FakulteEdebiyat,
              ),
            );
          },
        ),
      ],
    );
  }
}
