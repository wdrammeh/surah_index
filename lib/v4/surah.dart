enum Surah {
  Fatiha(name: "Fatiha", position: 1, period: Period.Makki, verses: 7),
  Baqara(name: "Baqarah", position: 2, period: Period.Madani, verses: 286),
  AliImran(name: "Ali Imran", position: 3, period: Period.Madani, verses: 200),
  Nisa(name: "Nisa", position: 4, period: Period.Madani, verses: 176),
  Maidah(name: "Maida", position: 5, period: Period.Madani, verses: 120),
  Anham(name: "Anham", position: 6, period: Period.Makki, verses: 165),
  Ahraf(name: "Ahraf", position: 7, period: Period.Makki, verses: 206),
  Anfal(name: "Anfal", position: 8, period: Period.Madani, verses: 75),
  Tawbah(name: "Tawbah", position: 9, period: Period.Madani, verses: 129),
  Yunus(name: "Yunus", position: 10, period: Period.Makki, verses: 109),
  Hud(name: "Hud", position: 11, period: Period.Makki, verses: 123),
  Yusuf(name: "Yusuf", position: 12, period: Period.Makki, verses: 111),
  Rahd(name: "Rahd", position: 13, period: Period.Madani, verses: 43),
  Ibrahim(name: "Ibrahim", position: 14, period: Period.Makki, verses: 52),
  Hijr(name: "Hijr", position: 15, period: Period.Makki, verses: 99),
  Nahl(name: "Nahl", position: 16, period: Period.Makki, verses: 128),
  Isra(name: "Israh", position: 17, period: Period.Makki, verses: 111),
  Kahf(name: "Kahf", position: 18, period: Period.Makki, verses: 110),
  Maryam(name: "Maryam", position: 19, period: Period.Makki, verses: 98),
  TaHa(name: "Ta-Ha", position: 20, period: Period.Makki, verses: 135),
  Anbiyah(name: "Anbiyah", position: 21, period: Period.Makki, verses: 112),
  Hajj(name: "Hajj", position: 22, period: Period.Madani, verses: 78),
  Muhminun(name: "Muhminun", position: 23, period: Period.Makki, verses: 118),
  Nur(name: "Nur", position: 24, period: Period.Madani, verses: 64),
  Furqan(name: "Furqan", position: 25, period: Period.Makki, verses: 77),
  Shuharah(name: "Shuharah", position: 26, period: Period.Makki, verses: 227),
  Naml(name: "Naml", position: 27, period: Period.Makki, verses: 93),
  Qasas(name: "Qasas", position: 28, period: Period.Makki, verses: 88),
  Ankabut(name: "Ankabut", position: 29, period: Period.Makki, verses: 69),
  Rum(name: "Rum", position: 30, period: Period.Makki, verses: 60),
  Luqman(name: "Luqman", position: 31, period: Period.Makki, verses: 34),
  Sajdah(name: "Sajdah", position: 32, period: Period.Makki, verses: 30),
  Ahzab(name: "Ahzab", position: 33, period: Period.Madani, verses: 73),
  Saba(name: "Saba", position: 34, period: Period.Makki, verses: 54),
  Fatir(name: "Fatir", position: 35, period: Period.Makki, verses: 45),
  YaSeen(name: "Ya-Seen", position: 36, period: Period.Makki, verses: 83),
  Saffat(name: "Saffat", position: 37, period: Period.Makki, verses: 182),
  Saad(name: "Saad", position: 38, period: Period.Makki, verses: 88),
  Zumur(name: "Zumur", position: 39, period: Period.Makki, verses: 75),
  Ghafir(name: "Ghafir", position: 40, period: Period.Makki, verses: 85),
  Fussilat(name: "Fussilat", position: 41, period: Period.Makki, verses: 54),
  Shurah(name: "Shurah", position: 42, period: Period.Makki, verses: 53),
  Zukhruf(name: "Zukhruf", position: 43, period: Period.Makki, verses: 89),
  Dukhan(name: "Dukhan", position: 44, period: Period.Makki, verses: 59),
  Jasiyah(name: "Jasiyah", position: 45, period: Period.Makki, verses: 37),
  Ahqaf(name: "Ahqaf", position: 46, period: Period.Makki, verses: 35),
  Muhammad(name: "Muhammad", position: 47, period: Period.Madani, verses: 38),
  Fath(name: "Fath", position: 48, period: Period.Madani, verses: 29),
  Hujurat(name: "Hujurat", position: 49, period: Period.Madani, verses: 18),
  Qaf(name: "Qaf", position: 50, period: Period.Makki, verses: 45),
  Dhariyat(name: "Dhariyat", position: 51, period: Period.Makki, verses: 60),
  Tur(name: "Tur", position: 52, period: Period.Makki, verses: 49),
  Najm(name: "Najm", position: 53, period: Period.Makki, verses: 62),
  Qamar(name: "Qamar", position: 54, period: Period.Makki, verses: 45),
  Rahman(name: "Rahman", position: 55, period: Period.Madani, verses: 78),
  Waqihah(name: "Waqihah", position: 56, period: Period.Makki, verses: 96),
  Hadid(name: "Hadid", position: 57, period: Period.Madani, verses: 29),
  Mujadilah(name: "Mujadilah", position: 58, period: Period.Madani, verses: 2),
  Hashr(name: "Hashr", position: 59, period: Period.Madani, verses: 24),
  Mumtahana(name: "Mumtahana", position: 60, period: Period.Madani, verses: 13),
  Saff(name: "Saff", position: 61, period: Period.Madani, verses: 14),
  Jumuhah(name: "Jumuhah", position: 62, period: Period.Madani, verses: 11),
  Munafiqun(name: "Munafiqun", position: 63, period: Period.Madani, verses: 1),
  Taghabun(name: "Taghabun", position: 64, period: Period.Madani, verses: 18),
  Talaq(name: "Talaq", position: 65, period: Period.Madani, verses: 12),
  Tahrim(name: "Tahrim", position: 66, period: Period.Madani, verses: 12),
  Mulk(name: "Mulk", position: 67, period: Period.Makki, verses: 30),
  Qalam(name: "Qalam", position: 68, period: Period.Makki, verses: 52),
  Haqqah(name: "Haqqah", position: 69, period: Period.Makki, verses: 52),
  Mahrij(name: "Mahrij", position: 70, period: Period.Makki, verses: 44),
  Nuh(name: "Nuh", position: 71, period: Period.Makki, verses: 28),
  Jin(name: "Jin", position: 72, period: Period.Makki, verses: 28),
  Muzzammil(name: "Muzzammil", position: 73, period: Period.Makki, verses: 20),
  Muddathir(name: "Muddathir", position: 74, period: Period.Makki, verses: 56),
  Qiyamah(name: "Qiyamah", position: 75, period: Period.Makki, verses: 40),
  Insan(name: "Insan", position: 76, period: Period.Madani, verses: 31),
  Mursalat(name: "Mursalat", position: 77, period: Period.Makki, verses: 50),
  Nabah(name: "Nabah", position: 78, period: Period.Makki, verses: 40),
  Naziat(name: "Naziat", position: 79, period: Period.Makki, verses: 46),
  Abasa(name: "Abasa", position: 80, period: Period.Makki, verses: 42),
  Takwir(name: "Takwir", position: 81, period: Period.Makki, verses: 29),
  Infitar(name: "Infitar", position: 82, period: Period.Makki, verses: 19),
  Mutaffifin(name: "Mutaffifin", position: 83, period: Period.Makki, verses: 36),
  Inshiqaq(name: "Inshiqaq", position: 84, period: Period.Makki, verses: 25),
  Buruj(name: "Buruj", position: 85, period: Period.Makki, verses: 22),
  Tariq(name: "Tariq", position: 86, period: Period.Makki, verses: 17),
  Ahla(name: "Ahla", position: 87, period: Period.Makki, verses: 19),
  Ghasiyah(name: "Ghasiyah", position: 88, period: Period.Makki, verses: 26),
  Fajr(name: "Fajr", position: 89, period: Period.Makki, verses: 30),
  Balad(name: "Balad", position: 90, period: Period.Makki, verses: 20),
  Shams(name: "Shams", position: 91, period: Period.Makki, verses: 15),
  Layl(name: "Layl", position: 92, period: Period.Makki, verses: 21),
  Duhaa(name: "Duhaa", position: 93, period: Period.Makki, verses: 11),
  Sharha(name: "Sharha", position: 94, period: Period.Makki, verses: 8),
  Tin(name: "Tin", position: 95, period: Period.Makki, verses: 8),
  Alaq(name: "Alaq", position: 96, period: Period.Makki, verses: 19),
  Qadr(name: "Qadr", position: 97, period: Period.Makki, verses: 5),
  Bayyinah(name: "Bayyinah", position: 98, period: Period.Madani, verses: 8),
  Zalzalah(name: "Zalzalah", position: 99, period: Period.Madani, verses: 8),
  Adiyat(name: "Adiyat", position: 100, period: Period.Makki, verses: 1),
  Qhariah(name: "Qhariah", position: 101, period: Period.Makki, verses: 11),
  Takathur(name: "Takathur", position: 102, period: Period.Makki, verses: 8),
  Asr(name: "Asr", position: 103, period: Period.Makki, verses: 3),
  Humazah(name: "Humazah", position: 104, period: Period.Makki, verses: 9),
  Fil(name: "Fil", position: 105, period: Period.Makki, verses: 5),
  Quraysh(name: "Quraysh", position: 106, period: Period.Makki, verses: 4),
  Mahun(name: "Mahun", position: 107, period: Period.Makki, verses: 7),
  Kawthar(name: "Kawthar", position: 108, period: Period.Makki, verses: 3),
  Kafirun(name: "Kafirun", position: 109, period: Period.Makki, verses: 6),
  Nasr(name: "Nasr", position: 110, period: Period.Madani, verses: 3),
  Masad(name: "Masad", position: 111, period: Period.Makki, verses: 5),
  Ikhlas(name: "Ikhlas", position: 112, period: Period.Makki, verses: 4),
  Falaq(name: "Falaq", position: 113, period: Period.Makki, verses: 5),
  Nas(name: "Nas", position: 114, period: Period.Makki, verses: 6);

  const Surah({required this.name, required this.position, required this.verses, required this.period});

  final String name;
  final int position;
  final int verses;
  final Period period;
  
  @override
  String toString() {
    return "$position - $name - $verses verses - $period";
  }

}

enum Period {
  Makki("Makki"),
  Madani("Madani");

  const Period(this.name);

  final String name;
  
  @override
  String toString() {
    return name;
  }

}
