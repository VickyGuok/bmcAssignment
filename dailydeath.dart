import 'package:charts_flutter/flutter.dart' as charts;

class covid19dailydeathcases {
  final String day;
  final int deaths;
  final charts.Color barColor;

  covid19dailydeathcases(
      {required this.day,
        required this.deaths,
        required this.barColor});

}
