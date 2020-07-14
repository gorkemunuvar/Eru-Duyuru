import 'package:flutter/foundation.dart';
import 'announcement.dart';

class Department {
  final String name;
  final DepartmentTypes type;
  final String url;
  final String startingLink;
  final String titleSelector;
  final String linkSelector;
  final String dateSelector;
  final String dateSelector2;
  final String dateSelector3;
  //Bazen titles ve dates liste uzunluğu aynı olmuyor.
  //getAnnouncement içindeki döngü sınırın eşit olmadıklarında eşitlemek için.
  final int listBoundary;

  List<Announcement> announcements = List<Announcement>();

  Department({
    this.name,
    @required this.type,
    @required this.url,
    @required this.startingLink,
    @required this.titleSelector,
    @required this.linkSelector,
    this.dateSelector,
    this.dateSelector2,
    this.dateSelector3,
    this.listBoundary,
  });

  static Department getDepartmentInstance(DepartmentTypes type) {
    for (Department d in _departments) if (type == d.type) return d;
    return null;
  }

  static DepartmentTypes getDepartmentType(String departmentName) {
    for (Department d in _departments)
      if (departmentName == d.name) return d.type;
    return null;
  }
}

List<Department> _departments = [
  Department(
    name: 'Mühendislik Fakültesi Anasayfası',
    type: DepartmentTypes.MuhendislikAnasayfa,
    url: 'https://mf.erciyes.edu.tr/?Anasayfa',
    startingLink: 'https://mf.erciyes.edu.tr/',
    titleSelector: 'h5.post-title > a.font-13',
    linkSelector: 'h5.post-title > a[href]',
    dateSelector: 'tr > td.font-12',
  ),
  Department(
    name: 'Bilgisayar Mühendisliği',
    type: DepartmentTypes.MuhendislikBilgisayar,
    url: 'https://bm.erciyes.edu.tr/?Anasayfa',
    startingLink: 'https://bm.erciyes.edu.tr/',
    titleSelector: 'h5.post-title > a.font-13',
    linkSelector: 'h5.post-title > a[href]',
    dateSelector: 'tr > td.font-12',
  ),
  Department(
    name: 'Biyomedikal Mühendisliği',
    type: DepartmentTypes.MuhendislikBiyomedikal,
    url: 'https://biomed.erciyes.edu.tr/?Anasayfa',
    startingLink: 'https://biomed.erciyes.edu.tr/',
    titleSelector: 'h5.post-title > a.font-13',
    linkSelector: 'h5.post-title > a[href]',
    dateSelector: 'tr > td.font-12',
  ),
  Department(
    name: 'Çevre Mühendisliği',
    type: DepartmentTypes.MuhendislikCevre,
    url: 'https://cevre.erciyes.edu.tr/?Anasayfa',
    startingLink: 'https://cevre.erciyes.edu.tr/',
    titleSelector: 'h5.post-title > a.font-13',
    linkSelector: 'h5.post-title > a[href]',
    dateSelector: 'tr > td.font-12',
  ),
  Department(
    name: 'Elektrik-Elektronik Mühendisliği',
    type: DepartmentTypes.MuhendislikElektrik,
    url: 'https://em.erciyes.edu.tr/?Anasayfa',
    startingLink: 'https://em.erciyes.edu.tr/',
    titleSelector: 'h5.post-title > a.font-13',
    linkSelector: 'h5.post-title > a[href]',
    dateSelector: 'tr > td.font-12',
  ),
  Department(
    name: 'Endüstri Mühendisliği',
    type: DepartmentTypes.MuhendislikEndustri,
    url: 'https://endustri.erciyes.edu.tr/?Anasayfa',
    startingLink: 'https://endustri.erciyes.edu.tr/',
    titleSelector: 'h5.post-title > a.font-13',
    linkSelector: 'h5.post-title > a[href]',
    dateSelector: 'tr > td.font-12',
  ),
  Department(
    name: 'Endüstriyel Tasarım Mühendisliği',
    type: DepartmentTypes.MuhendislikEndustriyelTasarim,
    url: 'https://etm.erciyes.edu.tr/?Anasayfa',
    startingLink: 'https://etm.erciyes.edu.tr/',
    titleSelector: 'h5.post-title > a.font-13',
    linkSelector: 'h5.post-title > a[href]',
    dateSelector: 'tr > td.font-12',
  ),
  Department(
    name: 'Enerji Sistemleri Mühendisliği',
    type: DepartmentTypes.MuhendislikEnerjiSistemleri,
    url: 'https://esm.erciyes.edu.tr/?Anasayfa',
    startingLink: 'https://esm.erciyes.edu.tr/',
    titleSelector: 'h5.post-title > a.font-13',
    linkSelector: 'h5.post-title > a[href]',
    dateSelector: 'tr > td.font-12',
  ),
  Department(
    name: 'Gıda Mühendisliği',
    type: DepartmentTypes.MuhendislikGida,
    url: 'https://gida.erciyes.edu.tr/?Anasayfa',
    startingLink: 'https://gida.erciyes.edu.tr/',
    titleSelector: 'h5.post-title > a.font-13',
    linkSelector: 'h5.post-title > a[href]',
    dateSelector: 'tr > td.font-12',
  ),
  Department(
    name: 'Harita Mühendisliği',
    type: DepartmentTypes.MuhendislikHarita,
    url: 'https://harita.erciyes.edu.tr/?Anasayfa',
    startingLink: 'https://harita.erciyes.edu.tr/',
    titleSelector: 'h5.post-title > a.font-13',
    linkSelector: 'h5.post-title > a[href]',
    dateSelector: 'tr > td.font-12',
  ),
  Department(
    name: 'İnşaat Mühendisliği',
    type: DepartmentTypes.MuhendislikInsaat,
    url: 'https://insaat.erciyes.edu.tr/?Anasayfa',
    startingLink: 'https://insaat.erciyes.edu.tr/',
    titleSelector: 'h5.post-title > a.font-13',
    linkSelector: 'h5.post-title > a[href]',
    dateSelector: 'tr > td.font-12',
  ),
  Department(
    name: 'Makine Mühendisliği',
    type: DepartmentTypes.MuhendislikMakine,
    url: 'https://me.erciyes.edu.tr/?Anasayfa',
    startingLink: 'https://me.erciyes.edu.tr/',
    titleSelector: 'h5.post-title > a.font-13',
    linkSelector: 'h5.post-title > a[href]',
    dateSelector: 'tr > td.font-12',
  ),
  Department(
    name: 'Malzeme Bilimi Mühendisliği',
    type: DepartmentTypes.MuhendislikMalzemeBilimi,
    url: 'https://mbm.erciyes.edu.tr/?Anasayfa',
    startingLink: 'https://mbm.erciyes.edu.tr/',
    titleSelector: 'h5.post-title > a.font-13',
    linkSelector: 'h5.post-title > a[href]',
    dateSelector: 'tr > td.font-12',
  ),
  Department(
    name: 'Mekatronik Mühendisliği',
    type: DepartmentTypes.MuhendislikMekatronik,
    url: 'https://mekatronik.erciyes.edu.tr/?Anasayfa',
    startingLink: 'https://mekatronik.erciyes.edu.tr/',
    titleSelector: 'h5.post-title > a.font-13',
    linkSelector: 'h5.post-title > a[href]',
    dateSelector: 'tr > td.font-12',
  ),
  Department(
    name: 'Tekstil Mühendisliği',
    type: DepartmentTypes.MuhendislikTekstil,
    url: 'https://tekstil.erciyes.edu.tr',
    startingLink: 'https://tekstil.erciyes.edu.tr/',
    titleSelector: 'h5.post-title > a.font-13',
    linkSelector: 'h5.post-title > a[href]',
    dateSelector: 'tr > td.font-12',
  ),
  Department(
    name: 'Diş Hekimliği Fakültesi',
    type: DepartmentTypes.FakulteDisHekimligi,
    url: 'http://dent.erciyes.edu.tr/Duyuru_Tumu.aspx',
    startingLink: 'http://dent.erciyes.edu.tr/',
    titleSelector: 'div.post-right > h5.mt-0 > a',
    linkSelector: 'div.post-right > h5.mt-0 > a[href]',
    dateSelector: 'li.pr-0 > span',
  ),
  Department(
    name: 'Eczacılık Fakültesi',
    type: DepartmentTypes.FakulteEczacilik,
    url: 'https://pharmacy.erciyes.edu.tr',
    startingLink: 'https://pharmacy.erciyes.edu.tr/',
    titleSelector: 'span.aciklama >  a',
    linkSelector: 'span.aciklama >  a[href]',
    dateSelector: 'li > span.img > span.yil',
  ),
  Department(
    name: 'Edebiyat Fakültesi',
    type: DepartmentTypes.FakulteEdebiyat,
    url: 'https://edebiyat.erciyes.edu.tr/',
    startingLink: 'https://edebiyat.erciyes.edu.tr/',
    titleSelector: 'li > span.aciklama > a',
    linkSelector: 'li > span.aciklama > a[href]',
    dateSelector: 'li > span.img > span.gun',
    dateSelector2: 'li > span.img > span.ay',
    dateSelector3: 'li > span.img > span.yil',
  ),
  Department(
    name: 'Eğitim Fakültesi Anasayfası',
    type: DepartmentTypes.EgitimAnasayfa,
    url: 'http://egitim.erciyes.edu.tr',
    startingLink: 'http://egitim.erciyes.edu.tr',
    titleSelector: 'div.news-content-holder > h3 > a > span',
    linkSelector: 'div.news-content-holder > h3 > a[href]',
    dateSelector: 'div.post-date > span',
  ),
  Department(
    name: 'Eğitim Bilimleri',
    type: DepartmentTypes.EgitimEgitimBilimleri,
    url: 'http://egt.egitim.erciyes.edu.tr',
    startingLink: 'http://egt.egitim.erciyes.edu.tr',
    titleSelector: 'div.news-content-holder > h3 > a > span',
    linkSelector: 'div.news-content-holder > h3 > a[href]',
    dateSelector: 'div.post-date > span',
  ),
  Department(
    name: 'Matematik ve Fen Bilimleri',
    type: DepartmentTypes.EgitimMatematikFenBilimleri,
    url: 'http://matfen.egitim.erciyes.edu.tr',
    startingLink: 'http://matfen.egt.egitim.erciyes.edu.tr',
    titleSelector: 'div.news-content-holder > h3 > a > span',
    linkSelector: 'div.news-content-holder > h3 > a[href]',
    dateSelector: 'div.post-date > span',
  ),
  Department(
    name: 'Temel Eğitim',
    type: DepartmentTypes.EgitimTemelEgitim,
    url: 'http://temeg.egitim.erciyes.edu.tr',
    startingLink: 'http://temeg.egt.egitim.erciyes.edu.tr',
    titleSelector: 'div.news-content-holder > h3 > a > span',
    linkSelector: 'div.news-content-holder > h3 > a[href]',
    dateSelector: 'div.post-date > span',
  ),
  Department(
    name: 'Türkçe ve Sosyal Bilimler',
    type: DepartmentTypes.EgitimTurkceSosyalBilimler,
    url: 'http://trsos.egitim.erciyes.edu.tr',
    startingLink: 'http://trsos.egt.egitim.erciyes.edu.tr',
    titleSelector: 'div.news-content-holder > h3 > a > span',
    linkSelector: 'div.news-content-holder > h3 > a[href]',
    dateSelector: 'div.post-date > span',
  ),
  Department(
    name: 'Yabancı Diller',
    type: DepartmentTypes.EgitimYabanciDiller,
    url: 'http://dil.egitim.erciyes.edu.tr/?id=000026',
    startingLink: 'http://dil.egitim.erciyes.edu.tr',
    titleSelector: 'div.news-content-holder > h3 > a > span',
    linkSelector: 'div.news-content-holder > h3 > a[href]',
    dateSelector: 'div.post-date > span',
  ),
  Department(
    name: 'Özel Eğitim',
    type: DepartmentTypes.EgitimOzelEgitim,
    url: 'http://ozel.egitim.erciyes.edu.tr/?id=000027',
    startingLink: 'http://ozel.egitim.erciyes.edu.tr',
    titleSelector: 'div.news-content-holder > h3 > a > span',
    linkSelector: 'div.news-content-holder > h3 > a[href]',
    dateSelector: 'div.post-date > span',
  ),
  Department(
    name: 'Fen Fakültesi',
    type: DepartmentTypes.FakulteFen,
    url: 'http://fen.erciyes.edu.tr',
    startingLink: 'https://fen.erciyes.edu.tr/',
    titleSelector: 'li > span.aciklama > a',
    linkSelector: 'li > span.aciklama > a[href]',
    dateSelector: 'li > span.img > span.gun',
    dateSelector2: 'li > span.img > span.ay',
    dateSelector3: 'li > span.img > span.yil',
  ),
  Department(
    name: 'Güzel Sanatlar Fakültesi',
    type: DepartmentTypes.FakulteGuzelSanatlar,
    url: 'http://guzelsanat.erciyes.edu.tr',
    startingLink: 'http://guzelsanat.erciyes.edu.tr/',
    titleSelector: 'div.card-body > h3 > a',
    linkSelector: 'div.card-body > h3 > a[href]',
    dateSelector: 'div.card-head > div.card-stamp > a',
  ),
  Department(
    name: 'Havacılık Fakültesi',
    type: DepartmentTypes.FakulteHavacilik,
    url: 'https://havacilik.erciyes.edu.tr/',
    startingLink: 'https://havacilik.erciyes.edu.tr/',
    titleSelector: 'li > span.aciklama > a',
    linkSelector: 'li > span.aciklama > a[href]',
    dateSelector: 'li > span.img > span.gun',
    dateSelector2: 'li > span.img > span.ay',
    dateSelector3: 'li > span.img > span.yil',
  ),
  Department(
    name: 'Hukuk Fakültesi',
    type: DepartmentTypes.FakulteHukuk,
    url: 'https://hukuk.erciyes.edu.tr/',
    startingLink: 'https://hukuk.erciyes.edu.tr/',
    titleSelector: 'li > span.aciklama > a',
    linkSelector: 'li > span.aciklama > a[href]',
    dateSelector: 'li > span.img > span.gun',
    dateSelector2: 'li > span.img > span.ay',
    dateSelector3: 'li > span.img > span.yil',
  ),
  Department(
    name: 'İktisadi ve İdari Bilimler Fakültesi',
    type: DepartmentTypes.FakulteIIBF,
    url: 'http://iibf.erciyes.edu.tr',
    startingLink: 'http://iibf.erciyes.edu.tr',
    titleSelector: 'div.Categories > ul > li > a > font',
    linkSelector: 'div.Categories > ul > li > a[href]',
    dateSelector: 'div.Categories > ul > li > span.label',
  ),
  Department(
    name: 'İlahiyat Fakültesi',
    type: DepartmentTypes.FakulteIlahiyat,
    url: 'https://ilahiyat.erciyes.edu.tr/',
    startingLink: 'https://ilahiyat.erciyes.edu.tr/',
    titleSelector: 'li > span.aciklama > a',
    linkSelector: 'li > span.aciklama > a[href]',
    dateSelector: 'li > span.img > span.gun',
    dateSelector2: 'li > span.img > span.ay',
    dateSelector3: 'li > span.img > span.yil',
  ),
  Department(
    name: 'İletişim Fakültesi',
    type: DepartmentTypes.FakulteIletisim,
    url: 'http://iletisim.erciyes.edu.tr/category/duyuru/',
    startingLink: 'asdfsss',
    titleSelector: 'div.post-info > h2 > a',
    linkSelector: 'div.post-info > h2 > a[href]',
    dateSelector: 'div.post-info > p.postmetadata',
  ),
  Department(
    name: 'Mimarlık Fakültesi',
    type: DepartmentTypes.FakulteMimarlik,
    url: 'http://mimarlik.erciyes.edu.tr',
    startingLink: 'http://mimarlik.erciyes.edu.tr',
    titleSelector: 'div.duyurugenislik2 > a',
    linkSelector: 'div.duyurugenislik2 > a[href]',
    dateSelector: 'div > div[style|=font]',
    dateSelector2: 'div > div[style|=margin]',
  ),
  Department(
    name: 'Sağlık Bilimleri Fakültesi',
    type: DepartmentTypes.FakulteSaglikBilimleri,
    url: 'https://sbf.erciyes.edu.tr/',
    startingLink: 'https://sbf.erciyes.edu.tr/',
    titleSelector: 'li > span.aciklama > a',
    linkSelector: 'li > span.aciklama > a[href]',
    dateSelector: 'li > span.img > span.gun',
    dateSelector2: 'li > span.img > span.ay',
    dateSelector3: 'li > span.img > span.yil',
  ),
  Department(
    name: 'Seyrani Ziraat Fakültesi',
    type: DepartmentTypes.FakulteSeyraniZiraat,
    url: 'https://ziraat.erciyes.edu.tr/',
    startingLink: 'https://ziraat.erciyes.edu.tr/',
    titleSelector: 'li > span.aciklama > a',
    linkSelector: 'li > span.aciklama > a[href]',
    dateSelector: 'li > span.img > span.gun',
    dateSelector2: 'li > span.img > span.ay',
    dateSelector3: 'li > span.img > span.yil',
  ),
  Department(
    name: 'Spor Bilimleri Fakültesi',
    type: DepartmentTypes.FakulteSporBilimleri,
    url: 'https://spbf.erciyes.edu.tr/',
    startingLink: 'https://spbf.erciyes.edu.tr/',
    titleSelector: 'li > span.aciklama > a',
    linkSelector: 'li > span.aciklama > a[href]',
    dateSelector: 'li > span.img > span.gun',
    dateSelector2: 'li > span.img > span.ay',
    dateSelector3: 'li > span.img > span.yil',
  ),
  Department(
    name: 'Tıp Fakültesi',
    type: DepartmentTypes.FakulteTip,
    url: 'http://tip.erciyes.edu.tr/bizden-duyurular.html',
    startingLink: 'http://tip.erciyes.edu.tr/',
    titleSelector: 'div.irs-courses-content > h4 > a',
    linkSelector: 'div.irs-courses-content > h4 > a[href]',
    dateSelector: 'li > p > a',
  ),
  Department(
    name: 'Turizm Fakültesi',
    type: DepartmentTypes.FakulteTurizm,
    url: 'http://turizm.erciyes.edu.tr/duyurulist.asp',
    startingLink: 'http://turizm.erciyes.edu.tr/',
    titleSelector: 'div.duyurukutu > a',
    linkSelector: 'div.duyurukutu > a[href]',
    dateSelector: 'div.duyurukutu > div.duyurutarih',
  ),
  Department(
    name: 'Veteriner Fakültesi',
    type: DepartmentTypes.FakulteVeteriner,
    url: 'https://veteriner.erciyes.edu.tr',
    startingLink: 'https://veteriner.erciyes.edu.tr/',
    titleSelector: 'div.profile-post-in > h3.heading-xs > a',
    linkSelector: 'div.profile-post-in > h3.heading-xs > a[href]',
    dateSelector: 'div.profile-post > span.profile-post-numb',
  ),
  Department(
    name: 'Erasmus Duyuruları',
    type: DepartmentTypes.Erasmus,
    url: 'https://erasmus.erciyes.edu.tr/duyurular.asp',
    startingLink: 'https://erasmus.erciyes.edu.tr/',
    titleSelector: 'div[style|=font] > a.link1',
    linkSelector: 'div[style|=font] > a.link1',
    dateSelector: '.ana_div div div div div div a i',
    listBoundary: 5,
  ),
  Department(
    name: 'Obisis Duyuruları',
    type: DepartmentTypes.Obisis,
    url: 'https://obisis.erciyes.edu.tr',
    startingLink: '',
    titleSelector: 'tr > td > span.NormalBlue',
    linkSelector: 'tr > td > span.NormalBlue',
  ),
  Department(
    name: 'Adalet Meslek Yüksekokulu',
    type: DepartmentTypes.MeslekYuksekOkulAdalet,
    url: 'https://adalet.erciyes.edu.tr',
    startingLink: 'https://adalet.erciyes.edu.tr/',
    titleSelector: 'li > span.aciklama > a',
    linkSelector: 'li > span.aciklama > a[href]',
    dateSelector: 'li > span.img > span.gun',
    dateSelector2: 'li > span.img > span.ay',
    dateSelector3: 'li > span.img > span.yil',
  ),
  Department(
    name: 'Halil Bayraktar... Yüksekokulu',
    type: DepartmentTypes.MeslekYuksekOkulHalilBayraktarSaglikHizmetleri,
    url: 'https://hbshmyo.erciyes.edu.tr',
    startingLink: 'https://hbshmyo.erciyes.edu.tr/',
    titleSelector: 'li > span.aciklama > a',
    linkSelector: 'li > span.aciklama > a[href]',
    dateSelector: 'li > span.img > span.gun',
    dateSelector2: 'li > span.img > span.ay',
    dateSelector3: 'li > span.img > span.yil',
  ),
  Department(
    name: 'Yabancı Diller Yüksekokulu',
    type: DepartmentTypes.YuksekOkulYabanciDil,
    url: 'http://ydyo.erciyes.edu.tr',
    startingLink: '',
    titleSelector: 'h6 > a',
    linkSelector: 'h6 > a',
    dateSelector: 'div.course > span',
  ),
  Department(
    name: 'Atatürk İlkeleri ve İnkılap Tarihi Enstitüsü',
    type: DepartmentTypes.EnstituAtaturkIlkeleriVeInkiplaplari,
    url: 'https://aiite.erciyes.edu.tr',
    startingLink: 'https://aiite.erciyes.edu.tr/',
    titleSelector: 'li > span.aciklama > a',
    linkSelector: 'li > span.aciklama > a[href]',
    dateSelector: 'li > span.img > span.gun',
    dateSelector2: 'li > span.img > span.ay',
    dateSelector3: 'li > span.img > span.yil',
  ),
  Department(
    name: 'Fen Bilimleri Enstitüsü',
    type: DepartmentTypes.EnstituFenBilimleri,
    url: 'https://fbe.erciyes.edu.tr',
    startingLink: 'https://fbe.erciyes.edu.tr/',
    titleSelector: 'li > span.aciklama > a',
    linkSelector: 'li > span.aciklama > a[href]',
    dateSelector: 'li > span.img > span.gun',
    dateSelector2: 'li > span.img > span.ay',
    dateSelector3: 'li > span.img > span.yil',
  ),
  Department(
    name: 'Gevher Nesibe Genom ve Kök Hücre Enstitüsü',
    type: DepartmentTypes.EnstituGevherNesibeGenomVeKokHucre,
    url: 'https://gevhernesibe.erciyes.edu.tr',
    startingLink: 'https://gevhernesibe.erciyes.edu.tr/',
    titleSelector: 'li > span.aciklama > a',
    linkSelector: 'li > span.aciklama > a[href]',
    dateSelector: 'li > span.img > span.gun',
    dateSelector2: 'li > span.img > span.ay',
    dateSelector3: 'li > span.img > span.yil',
  ),
  Department(
    name: 'Güzel Sanatlar Enstitüsü',
    type: DepartmentTypes.EnstituGuzelSanatlar,
    url: 'https://gse.erciyes.edu.tr',
    startingLink: 'https://gse.erciyes.edu.tr/',
    titleSelector: 'li > span.aciklama > a',
    linkSelector: 'li > span.aciklama > a[href]',
    dateSelector: 'li > span.img > span.gun',
    dateSelector2: 'li > span.img > span.ay',
    dateSelector3: 'li > span.img > span.yil',
  ),
  Department(
    name: 'Sosyal Bilimler Enstitüsü',
    type: DepartmentTypes.EnstituSosyalBilimler,
    url: 'https://sbe.erciyes.edu.tr',
    startingLink: 'https://sbe.erciyes.edu.tr/',
    titleSelector: 'li > span.aciklama > a',
    linkSelector: 'li > span.aciklama > a[href]',
    dateSelector: 'li > span.img > span.gun',
    dateSelector2: 'li > span.img > span.ay',
    dateSelector3: 'li > span.img > span.yil',
  ),
  Department(
    name: 'Eğitim Bilimleri Ensitüsü',
    type: DepartmentTypes.EnstituEgitimBilimleri,
    url:
        'https://ebil.erciyes.edu.tr/dosya.asp?bolum=dosyalar&menu=1&dili=turkce&sayfabasi=DUYURU%20ve%20HABERLER',
    startingLink: '',
    titleSelector: 'td > a',
    linkSelector: 'td > a[href]',
    dateSelector: 'div.date',
  ),
  Department(
    name: 'Sağlık Bilimleri Enstitüsü',
    type: DepartmentTypes.EnstituSaglikBilimleri,
    url: 'http://sagens.erciyes.edu.tr',
    startingLink: '',
    titleSelector: 'font > a',
    linkSelector: 'font > a',
  ),
  Department(
    name: 'Farabi Duyuruları',
    type: DepartmentTypes.Farabi,
    url:
        'https://farabi.erciyes.edu.tr/0/Erciyes-Universitesi-Farabi-Degisim-Programı/Tum-Duyurular',
    startingLink: '',
    titleSelector: 'td > div > a',
    linkSelector: 'td > div > a',
    dateSelector: 'td > div > span',
  ),
  Department(
    name: 'Mevlana Duyuruları',
    type: DepartmentTypes.Mevlana,
    url: 'https://mevlana.erciyes.edu.tr/Mevlana-Degisim-Programi/Duyurular',
    startingLink: '',
    titleSelector: 'div.duyuruSatir',
    linkSelector: 'div.duyuruSatir',
  ),
  Department(
    name: 'Erciyes Üniversitesi Anasayfası',
    type: DepartmentTypes.AnasayfaErciyesUniversitesi,
    url: 'https://www.erciyes.edu.tr/Tum-Duyurular/0',
    startingLink: '',
    titleSelector: 'div.container > div.row > div > a',
    linkSelector: 'div.container > div.row > div > a[href]',
    dateSelector: 'div.container > div.row > div > span',
  ),
  /* Department(
    type: DepartmentTypes.Erasmus,
    url: '',
    startingLink: '',
    titleSelector: '',
    linkSelector: '',
    dateSelector: '',
  ), */
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
  FakulteFen,
  FakulteGuzelSanatlar,
  FakulteHavacilik,
  FakulteHukuk,
  FakulteIIBF,
  FakulteIlahiyat,
  FakulteIletisim,
  FakulteMimarlik,
  FakulteSaglikBilimleri,
  FakulteSeyraniZiraat,
  FakulteSporBilimleri,
  FakulteTip,
  FakulteTurizm,
  FakulteVeteriner,
  EgitimAnasayfa,
  EgitimEgitimBilimleri,
  EgitimMatematikFenBilimleri,
  EgitimTemelEgitim,
  EgitimTurkceSosyalBilimler,
  EgitimYabanciDiller,
  EgitimOzelEgitim,
  MeslekYuksekOkulAdalet,
  MeslekYuksekOkulHalilBayraktarSaglikHizmetleri,
  YuksekOkulYabanciDil,
  EnstituAtaturkIlkeleriVeInkiplaplari,
  EnstituEgitimBilimleri,
  EnstituFenBilimleri,
  EnstituGevherNesibeGenomVeKokHucre,
  EnstituGuzelSanatlar,
  EnstituSaglikBilimleri,
  EnstituSosyalBilimler,
  Obisis,
  Erasmus,
  Mevlana,
  Farabi,
  AnasayfaErciyesUniversitesi,
}
