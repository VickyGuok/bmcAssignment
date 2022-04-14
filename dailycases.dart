import 'package:charts_flutter/flutter.dart' as charts;

class covid19dailycases {
  final String day;
  final int cases;
  final charts.Color barColor;

  covid19dailycases(
  {required this.day,
    required this.cases,
    required this.barColor});

}
