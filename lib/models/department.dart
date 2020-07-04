import 'package:flutter/foundation.dart';
import 'announcement.dart';

class Department {
  final DepartmentTypes type;
  final String url;
  final String startingLink;
  final String titleSelector;
  final String linkSelector;
  final String dateSelector;

  List<Announcement> announcements = List<Announcement>();

  Department({
    @required this.type,
    @required this.url,
    @required this.startingLink,
    @required this.titleSelector,
    @required this.linkSelector,
    @required this.dateSelector,
  });

  static Department getDepartmentInstance(DepartmentTypes type) {
    for (Department d in _departments) if (type == d.type) return d;
    return null;
  }
}

List<Department> _departments = [
  Department(
    type: DepartmentTypes.MuhendislikAnasayfa,
    url: 'https://mf.erciyes.edu.tr/?Anasayfa',
    startingLink: 'https://mf.erciyes.edu.tr/',
    titleSelector: 'h5.post-title > a.font-13',
    linkSelector: 'h5.post-title > a[href]',
    dateSelector: 'tr > td.font-12',
  ),
  Department(
    type: DepartmentTypes.MuhendislikBilgisayar,
    url: 'https://bm.erciyes.edu.tr/?Anasayfa',
    startingLink: 'https://bm.erciyes.edu.tr/',
    titleSelector: 'h5.post-title > a.font-13',
    linkSelector: 'h5.post-title > a[href]',
    dateSelector: 'tr > td.font-12',
  ),
  Department(
    type: DepartmentTypes.MuhendislikBiyomedikal,
    url: 'https://biomed.erciyes.edu.tr/?Anasayfa',
    startingLink: 'https://biomed.erciyes.edu.tr/',
    titleSelector: 'h5.post-title > a.font-13',
    linkSelector: 'h5.post-title > a[href]',
    dateSelector: 'tr > td.font-12',
  ),
  Department(
    type: DepartmentTypes.MuhendislikCevre,
    url: 'https://cevre.erciyes.edu.tr/?Anasayfa',
    startingLink: 'https://cevre.erciyes.edu.tr/',
    titleSelector: 'h5.post-title > a.font-13',
    linkSelector: 'h5.post-title > a[href]',
    dateSelector: 'tr > td.font-12',
  ),
  Department(
    type: DepartmentTypes.MuhendislikElektrik,
    url: 'https://em.erciyes.edu.tr/?Anasayfa',
    startingLink: 'https://em.erciyes.edu.tr/',
    titleSelector: 'h5.post-title > a.font-13',
    linkSelector: 'h5.post-title > a[href]',
    dateSelector: 'tr > td.font-12',
  ),
  Department(
    type: DepartmentTypes.MuhendislikEndustri,
    url: 'https://endustri.erciyes.edu.tr/?Anasayfa',
    startingLink: 'https://endustri.erciyes.edu.tr/',
    titleSelector: 'h5.post-title > a.font-13',
    linkSelector: 'h5.post-title > a[href]',
    dateSelector: 'tr > td.font-12',
  ),
  Department(
    type: DepartmentTypes.MuhendislikEndustriyelTasarim,
    url: 'https://etm.erciyes.edu.tr/?Anasayfa',
    startingLink: 'https://etm.erciyes.edu.tr/',
    titleSelector: 'h5.post-title > a.font-13',
    linkSelector: 'h5.post-title > a[href]',
    dateSelector: 'tr > td.font-12',
  ),
  Department(
    type: DepartmentTypes.MuhendislikEnerjiSistemleri,
    url: 'https://esm.erciyes.edu.tr/?Anasayfa',
    startingLink: 'https://esm.erciyes.edu.tr/',
    titleSelector: 'h5.post-title > a.font-13',
    linkSelector: 'h5.post-title > a[href]',
    dateSelector: 'tr > td.font-12',
  ),
  Department(
    type: DepartmentTypes.MuhendislikGida,
    url: 'https://gida.erciyes.edu.tr/?Anasayfa',
    startingLink: 'https://gida.erciyes.edu.tr/',
    titleSelector: 'h5.post-title > a.font-13',
    linkSelector: 'h5.post-title > a[href]',
    dateSelector: 'tr > td.font-12',
  ),
  Department(
    type: DepartmentTypes.MuhendislikHarita,
    url: 'https://harita.erciyes.edu.tr/?Anasayfa',
    startingLink: 'https://harita.erciyes.edu.tr/',
    titleSelector: 'h5.post-title > a.font-13',
    linkSelector: 'h5.post-title > a[href]',
    dateSelector: 'tr > td.font-12',
  ),
  Department(
    type: DepartmentTypes.MuhendislikInsaat,
    url: 'https://insaat.erciyes.edu.tr/?Anasayfa',
    startingLink: 'https://insaat.erciyes.edu.tr/',
    titleSelector: 'h5.post-title > a.font-13',
    linkSelector: 'h5.post-title > a[href]',
    dateSelector: 'tr > td.font-12',
  ),
  Department(
    type: DepartmentTypes.MuhendislikMakine,
    url: 'https://me.erciyes.edu.tr/?Anasayfa',
    startingLink: 'https://me.erciyes.edu.tr/',
    titleSelector: 'h5.post-title > a.font-13',
    linkSelector: 'h5.post-title > a[href]',
    dateSelector: 'tr > td.font-12',
  ),
  Department(
    type: DepartmentTypes.MuhendislikMalzemeBilimi,
    url: 'https://mbm.erciyes.edu.tr/?Anasayfa',
    startingLink: 'https://mbm.erciyes.edu.tr/',
    titleSelector: 'h5.post-title > a.font-13',
    linkSelector: 'h5.post-title > a[href]',
    dateSelector: 'tr > td.font-12',
  ),
  Department(
    type: DepartmentTypes.MuhendislikMekatronik,
    url: 'https://mekatronik.erciyes.edu.tr/?Anasayfa',
    startingLink: 'https://mekatronik.erciyes.edu.tr/',
    titleSelector: 'h5.post-title > a.font-13',
    linkSelector: 'h5.post-title > a[href]',
    dateSelector: 'tr > td.font-12',
  ),
  Department(
    type: DepartmentTypes.MuhendislikTekstil,
    url: 'https://tekstil.erciyes.edu.tr',
    startingLink: 'https://tekstil.erciyes.edu.tr/',
    titleSelector: 'h5.post-title > a.font-13',
    linkSelector: 'h5.post-title > a[href]',
    dateSelector: 'tr > td.font-12',
  ),
  Department(
    type: DepartmentTypes.FakulteDisHekimligi,
    url: 'http://dent.erciyes.edu.tr/Duyuru_Tumu.aspx',
    startingLink: 'http://dent.erciyes.edu.tr/',
    titleSelector: 'div.post-right > h5.mt-0 > a',
    linkSelector: 'div.post-right > h5.mt-0 > a[href]',
    dateSelector: 'li.pr-0 > span',
  ),
  Department(
    type: DepartmentTypes.FakulteEczacilik,
    url: 'https://pharmacy.erciyes.edu.tr',
    startingLink: 'https://pharmacy.erciyes.edu.tr/',
    titleSelector: 'span.aciklama >  a',
    linkSelector: 'span.aciklama >  a[href]',
    dateSelector: 'li > span.img > span.yil',
  ),
  /*Hata var.*/
  Department(
    type: DepartmentTypes.FakulteEdebiyat,
    url: 'https://edebiyat.erciyes.edu.tr/DYRT/Tum-Duyuru-ve-Haberler/0',
    startingLink: 'https://edebiyat.erciyes.edu.tr/',
    titleSelector: 'div.DuyuruBaslik > p >  a',
    linkSelector: 'div.DuyuruBaslik > p >  a[href]',
    dateSelector: 'div.DuyuruTarih > span',
  ),
  Department(
    type: DepartmentTypes.EgitimAnasayfa,
    url: 'http://egitim.erciyes.edu.tr',
    startingLink: 'http://egitim.erciyes.edu.tr',
    titleSelector: 'div.news-content-holder > h3 > a > span',
    linkSelector: 'div.news-content-holder > h3 > a[href]',
    dateSelector: 'div.post-date > span',
  ),
  Department(
    type: DepartmentTypes.EgitimEgitimBilimleri,
    url: 'http://egt.egitim.erciyes.edu.tr',
    startingLink: 'http://egt.egitim.erciyes.edu.tr',
    titleSelector: 'div.news-content-holder > h3 > a > span',
    linkSelector: 'div.news-content-holder > h3 > a[href]',
    dateSelector: 'div.post-date > span',
  ),
  Department(
    type: DepartmentTypes.EgitimMatematikFenBilimleri,
    url: 'http://matfen.egitim.erciyes.edu.tr',
    startingLink: 'http://matfen.egt.egitim.erciyes.edu.tr',
    titleSelector: 'div.news-content-holder > h3 > a > span',
    linkSelector: 'div.news-content-holder > h3 > a[href]',
    dateSelector: 'div.post-date > span',
  ),
  Department(
    type: DepartmentTypes.EgitimTemelEgitim,
    url: 'http://temeg.egitim.erciyes.edu.tr',
    startingLink: 'http://temeg.egt.egitim.erciyes.edu.tr',
    titleSelector: 'div.news-content-holder > h3 > a > span',
    linkSelector: 'div.news-content-holder > h3 > a[href]',
    dateSelector: 'div.post-date > span',
  ),
  Department(
    type: DepartmentTypes.EgitimTurkceSosyalBilimler,
    url: 'http://trsos.egitim.erciyes.edu.tr',
    startingLink: 'http://trsos.egt.egitim.erciyes.edu.tr',
    titleSelector: 'div.news-content-holder > h3 > a > span',
    linkSelector: 'div.news-content-holder > h3 > a[href]',
    dateSelector: 'div.post-date > span',
  ),
  Department(
    type: DepartmentTypes.EgitimYabanciDiller,
    url: 'http://dil.egitim.erciyes.edu.tr/?id=000026',
    startingLink: 'http://dil.egitim.erciyes.edu.tr',
    titleSelector: 'div.news-content-holder > h3 > a > span',
    linkSelector: 'div.news-content-holder > h3 > a[href]',
    dateSelector: 'div.post-date > span',
  ),
  Department(
    type: DepartmentTypes.EgitimOzelEgitim,
    url: 'http://ozel.egitim.erciyes.edu.tr/?id=000027',
    startingLink: 'http://ozel.egitim.erciyes.edu.tr',
    titleSelector: 'div.news-content-holder > h3 > a > span',
    linkSelector: 'div.news-content-holder > h3 > a[href]',
    dateSelector: 'div.post-date > span',
  ),
];

enum DepartmentTypes {
  MuhendislikAnasayfa,
  MuhendislikBilgisayar,
  MuhendislikBiyomedikal,
  MuhendislikCevre,
  MuhendislikElektrik,
  MuhendislikEndustri,
  MuhendislikEndustriyelTasarim,
  MuhendislikEnerjiSistemleri,
  MuhendislikGida,
  MuhendislikHarita,
  MuhendislikInsaat,
  MuhendislikMakine,
  MuhendislikMalzemeBilimi,
  MuhendislikMekatronik,
  MuhendislikTekstil,
  FakulteDisHekimligi,
  FakulteEczacilik,
  FakulteEdebiyat,
  EgitimAnasayfa,
  EgitimEgitimBilimleri,
  EgitimMatematikFenBilimleri,
  EgitimTemelEgitim,
  EgitimTurkceSosyalBilimler,
  EgitimYabanciDiller,
  EgitimOzelEgitim,
}
