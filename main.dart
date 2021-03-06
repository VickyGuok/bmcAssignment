
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jabazonflutter/adminhomepage.dart';
import 'package:jabazonflutter/covid19dailycases.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:jabazonflutter/covid19dailycaseschart.dart';
import 'package:jabazonflutter/covid19dailydeathcases.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:jabazonflutter/location.dart';
import 'package:jabazonflutter/user_login.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'L10n.dart';
import 'covid19dailydeathcasechart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: L1on.all,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    AppBar(
      title: Text('Jabazon')
    );

    final List<covid19dailycases> data = [
      covid19dailycases(
          day: "11th April 2022",
          cases: 7739,
          barColor: charts.ColorUtil.fromDartColor(Colors.blue),),
      covid19dailycases(
          day: "12th April 2022",
          cases: 9002,
          barColor: charts.ColorUtil.fromDartColor(Colors.blue),),
      covid19dailycases(
        day: "13th April 2022",
        cases: 10052,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue),),
    ];
    final List<covid19dailydeathcases> series = [
      covid19dailydeathcases(day: "11th April 2022",
          deaths: 14,
          barColor: charts.ColorUtil.fromDartColor(Colors.black),),
      covid19dailydeathcases(day: "12th April 2022",
          deaths: 5,
          barColor: charts.ColorUtil.fromDartColor(Colors.black),),
      covid19dailydeathcases(day: "13th April 2022",
          deaths: 0,
          barColor: charts.ColorUtil.fromDartColor(Colors.black),),
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text("Jabazon"),
          actions: <Widget>[
      Padding(
      padding: EdgeInsets.only(right: 20.0),
        child: GestureDetector(
            onTap: (){
              //this one change the adminhomepage to userlogin 
              Navigator.push(context, MaterialPageRoute(builder:(context) => adminhomepage()));
            },
            child: Icon(Icons.account_circle_outlined,
              size: 30.0,
            )
        )
      ),],
      ),
      body: Center(
        child: Container(
          child: ListView(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            children: [
            covid19dailycaseschart(
            data:data,),
              covid19dailydeathcasechart(
                datalist: series,
              ),
              ElevatedButton(
                  onPressed: (){},
                  child: Text('View List of clinics here')),
            ],
          )
        )
        ),
    );
  }

}
