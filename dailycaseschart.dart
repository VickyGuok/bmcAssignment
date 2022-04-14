import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jabazonflutter/covid19dailycases.dart';

class covid19dailycaseschart extends StatelessWidget{
  final List<covid19dailycases> data;

  covid19dailycaseschart({required this.data});

  @override
  Widget build(BuildContext context) {
    List<charts.Series<covid19dailycases,String>> series = [
      charts.Series(
        id: "cases",
        data: data,
        domainFn: (covid19dailycases series, _) => series.day,
        measureFn: (covid19dailycases series, _) =>series.cases,
        colorFn: (covid19dailycases series, _) => series.barColor)
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
                "Covid 19 daily cases in Malaysia ",
              ),
              Expanded(
                child:( charts.BarChart(series, animate: true)),
              )
            ],
          ),
        ),
      ),
    );
  }
  }
