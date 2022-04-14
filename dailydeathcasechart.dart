
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:jabazonflutter/covid19dailydeathcases.dart';

class covid19dailydeathcasechart extends StatelessWidget{
  final List<covid19dailydeathcases> datalist;

  covid19dailydeathcasechart({required this.datalist});

  @override
  Widget build(BuildContext context) {
    List<charts.Series<covid19dailydeathcases,String>> series = [
      charts.Series(
        id: "deaths",
        data: datalist,
        domainFn: (covid19dailydeathcases series, _) => series.day,
        measureFn: (covid19dailydeathcases series, _) => series.deaths,
        colorFn: (covid19dailydeathcases series, _) => series.barColor,
      )
    ];
    return Container(
      height: 300,
      padding: EdgeInsets.all(20),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Text(
                "Covid 19 daily death cases in Malaysia",
              ),
              Expanded(
                child: (charts.BarChart(series, animate: true)),
              )
            ],
          ),
        ),
      ),
    );
  }


}
