class Nutrient {
  final double ENERC_KCAL;
  final double PROCNT;
  final double FAT;
  final double CHOCDF;
  final double FIBTG;

  Nutrient({
    this.ENERC_KCAL = 0,
    this.PROCNT = 0,
    this.FAT = 0,
    this.CHOCDF = 0,
    this.FIBTG = 0,
  });

  factory Nutrient.fromJson(Map<String, dynamic> json) {
    return Nutrient(
      ENERC_KCAL: json['ENERC_KCAL'],
      PROCNT: json['PROCNT'],
      FAT: json['FAT'],
      CHOCDF: json['CHOCDF'],
      FIBTG: json['FIBTG'],
    );
  }
}
