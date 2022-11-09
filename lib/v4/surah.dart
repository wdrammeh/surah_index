enum Surah {
  Fatiha(name: "Fatiha", position: 1, period: Period.Makki, verses: 7),
  Baqara(name: "Baqarah", position: 2, period: Period.Madani, verses: 286),
  AliImran(name: "Ali Imran", position: 3, period: Period.Madani, verses: 200),
  Nisa(name: "Nisa", position: 4, period: Period.Madani, verses: 176),
  Maidah(name: "Maidah", position: 5, period: Period.Madani, verses: 120),
  Anham(name: "Anham", position: 6, period: Period.Makki, verses: 165),
  Ahraf(name: "Ahraf", position: 7, period: Period.Makki, verses: 206),
  Anfal(name: "Anfal", position: 8, period: Period.Madani, verses: 75),
  Tawbah(name: "Tawbah", position: 9, period: Period.Madani, verses: 129),
  Yunus(name: "Yunus", position: 10, period: Period.Makki, verses: 109);

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