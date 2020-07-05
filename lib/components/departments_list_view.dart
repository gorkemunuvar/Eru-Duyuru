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
          title: "Fakülteler ve Bölümler",
          childrens: <Widget>[
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
            DepartmentsExpansionTile(
                title: "Eğitim Fakültesi",
                childrens: <Widget>[
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
            ListTileCard(
              paddingState: false,
              title: "Fen Fakültesi",
              onTap: () {
                _showAnnouncements(
                  "Fen Fakültesi",
                  Department.getDepartmentInstance(
                    DepartmentTypes.FakulteFen,
                  ),
                );
              },
            ),
            ListTileCard(
              paddingState: false,
              title: "Güzel Sanatlar Fakültesi",
              onTap: () {
                _showAnnouncements(
                  "Güzel Sanatlar Fakültesi",
                  Department.getDepartmentInstance(
                    DepartmentTypes.FakulteGuzelSanatlar,
                  ),
                );
              },
            ),
            ListTileCard(
              paddingState: false,
              title: "Havacılık Fakültesi",
              onTap: () {
                _showAnnouncements(
                  "Havacılık Fakültesi",
                  Department.getDepartmentInstance(
                    DepartmentTypes.FakulteHavacilik,
                  ),
                );
              },
            ),
            ListTileCard(
              paddingState: false,
              title: "Hukuk Fakültesi",
              onTap: () {
                _showAnnouncements(
                  "Hukuk Fakültesi",
                  Department.getDepartmentInstance(
                    DepartmentTypes.FakulteHukuk,
                  ),
                );
              },
            ),
            ListTileCard(
              paddingState: false,
              title: "İktisadi Ve İdari Bilimler Fakültesi",
              onTap: () {
                _showAnnouncements(
                  "İktisadi Ve İdari Bilimler Fakültesi",
                  Department.getDepartmentInstance(
                    DepartmentTypes.FakulteIIBF,
                  ),
                );
              },
            ),
            ListTileCard(
              paddingState: false,
              title: "İlahiyat Fakültesi",
              onTap: () {
                _showAnnouncements(
                  "İlahiyat Fakültesi",
                  Department.getDepartmentInstance(
                    DepartmentTypes.FakulteIlahiyat,
                  ),
                );
              },
            ),
            ListTileCard(
              paddingState: false,
              title: "İletişim Fakültesi",
              onTap: () {
                _showAnnouncements(
                  "İletişim Fakültesi",
                  Department.getDepartmentInstance(
                    DepartmentTypes.FakulteIletisim,
                  ),
                );
              },
            ),
            ListTileCard(
              paddingState: false,
              title: "Mimarlık Fakültesi",
              onTap: () {
                _showAnnouncements(
                  "Mimarlık Fakültesi",
                  Department.getDepartmentInstance(
                    DepartmentTypes.FakulteMimarlik,
                  ),
                );
              },
            ),
            ListTileCard(
              paddingState: false,
              title: "Sağlık Bilimleri Fakültesi",
              onTap: () {
                _showAnnouncements(
                  "Sağlık Bilimleri Fakültesi",
                  Department.getDepartmentInstance(
                    DepartmentTypes.FakulteSaglikBilimleri,
                  ),
                );
              },
            ),
            ListTileCard(
              paddingState: false,
              title: "Seyrani Ziraat Fakültesi",
              onTap: () {
                _showAnnouncements(
                  "Seyrani Ziraat Fakültesi",
                  Department.getDepartmentInstance(
                    DepartmentTypes.FakulteSeyraniZiraat,
                  ),
                );
              },
            ),
            /*Duyuru bulunamadı. */
            ListTileCard(
              paddingState: false,
              title: "Spor Bilimleri Fakültesi",
              onTap: () {
                _showAnnouncements(
                  "Spor Bilimleri Fakültesi",
                  Department.getDepartmentInstance(
                    DepartmentTypes.FakulteSporBilimleri,
                  ),
                );
              },
            ),
            ListTileCard(
              paddingState: false,
              title: "Tıp Fakültesi",
              onTap: () {
                _showAnnouncements(
                  "Tıp Fakültesi",
                  Department.getDepartmentInstance(
                    DepartmentTypes.FakulteTip,
                  ),
                );
              },
            ),
            ListTileCard(
              paddingState: false,
              title: "Turizm Fakültesi",
              onTap: () {
                _showAnnouncements(
                  "Turizm Fakültesi",
                  Department.getDepartmentInstance(
                    DepartmentTypes.FakulteTurizm,
                  ),
                );
              },
            ),
            ListTileCard(
              paddingState: false,
              title: "Veteriner Fakültesi",
              onTap: () {
                _showAnnouncements(
                  "Veteriner Fakültesi",
                  Department.getDepartmentInstance(
                    DepartmentTypes.FakulteVeteriner,
                  ),
                );
              },
            ),
          ],
        ),
        DepartmentsExpansionTile(
          title: "Meslek Yüksek Okulları",
          childrens: <Widget>[
            ListTileCard(
              title: 'Adalet Meslek Yüksekokulu',
              onTap: () {
                _showAnnouncements(
                  "Adalet Meslek Yüksekokulu",
                  Department.getDepartmentInstance(
                    DepartmentTypes.MeslekYuksekOkulAdalet,
                  ),
                );
              },
            ),
            ListTileCard(
              title: 'Halil Bayraktar... Yüksekokulu',
              onTap: () {
                _showAnnouncements(
                  "Halil Bayraktar... Yüksekokulu",
                  Department.getDepartmentInstance(
                    DepartmentTypes
                        .MeslekYuksekOkulHalilBayraktarSaglikHizmetleri,
                  ),
                );
              },
            ),
          ],
        ),
        DepartmentsExpansionTile(
          title: "Enstitüler",
          childrens: <Widget>[
            ListTileCard(
              title: "Atatürk İlkeleri ve İnkılap Tarihi Enstitüsü",
              onTap: () {
                _showAnnouncements(
                  "Atatürk İlkeleri ve İnkılap Tarihi Enstitüsü",
                  Department.getDepartmentInstance(
                      DepartmentTypes.EnstituAtaturkIlkeleriVeInkiplaplari),
                );
              },
            ),
            ListTileCard(
              title: "Eğitim Bilimleri Enstitüsü",
              onTap: () {
                _showAnnouncements(
                  "Eğitim Bilimleri Enstitüsü",
                  Department.getDepartmentInstance(
                      DepartmentTypes.EnstituEgitimBilimleri),
                );
              },
            ),
            ListTileCard(
              title: "Fen Bilimleri Enstitüsü",
              onTap: () {
                _showAnnouncements(
                  "Fen Bilimleri Enstitüsü",
                  Department.getDepartmentInstance(
                      DepartmentTypes.EnstituFenBilimleri),
                );
              },
            ),
            ListTileCard(
              title: "Gevher Nesibe Genom ve Kök Hücre Enstitüsü",
              onTap: () {
                _showAnnouncements(
                  "Gevher Nesibe Genom ve Kök Hücre Enstitüsü",
                  Department.getDepartmentInstance(
                      DepartmentTypes.EnstituGevherNesibeGenomVeKokHucre),
                );
              },
            ),
            ListTileCard(
              title: "Atatürk İlkeleri ve İnkılap Tarihi Enstitüsü",
              onTap: () {
                _showAnnouncements(
                  "Atatürk İlkeleri ve İnkılap Tarihi Enstitüsü",
                  Department.getDepartmentInstance(
                      DepartmentTypes.EnstituAtaturkIlkeleriVeInkiplaplari),
                );
              },
            ),
            ListTileCard(
              title: "Güzel Sanatlar Enstitüsü",
              onTap: () {
                _showAnnouncements(
                  "Güzel Sanatlar Enstitüsü",
                  Department.getDepartmentInstance(
                      DepartmentTypes.EnstituGuzelSanatlar),
                );
              },
            ),
            ListTileCard(
              title: "Sağlık Bilimleri Enstitüsü",
              onTap: () {
                _showAnnouncements(
                  "Sağlık Bilimleri Enstitüsü",
                  Department.getDepartmentInstance(
                      DepartmentTypes.EnstituSaglikBilimleri),
                );
              },
            ),
          ],
        ),
        ListTileCard(
          paddingState: false,
          title: "Yabancı Diller Yüksekokulu",
          onTap: () {
            _showAnnouncements(
              "Yabancı Diller Yüksekokulu",
              Department.getDepartmentInstance(
                  DepartmentTypes.YuksekOkulYabanciDil),
            );
          },
        ),
        ListTileCard(
          paddingState: false,
          title: "Obisis Duyuruları",
          onTap: () {
            _showAnnouncements(
              "Obisis Duyuruları",
              Department.getDepartmentInstance(
                DepartmentTypes.Obisis,
              ),
            );
          },
        ),
        ListTileCard(
          paddingState: false,
          title: "Erasmus Duyuruları",
          onTap: () {
            _showAnnouncements(
              "Erasmus Duyuruları",
              Department.getDepartmentInstance(
                DepartmentTypes.Erasmus,
              ),
            );
          },
        ),
      ],
    );
  }
}
