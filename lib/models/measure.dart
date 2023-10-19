class Measure {
  final String? uri;
  final String? label;
  final double weight;

  Measure({this.uri, required this.label, required this.weight});

  factory Measure.fromJson(Map<String, dynamic> json) {
    return Measure(
      uri: json['uri'],
      label: json['label'],
      weight: json['weight'],
    );
  }
}
