
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class clinicmenu extends StatefulWidget{
  const clinicmenu({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<clinicmenu> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RaisedButton(
                  child: Text("Add clinic", style: TextStyle(fontSize: 20),),
                  onPressed: () {},
                  color: Colors.blueGrey,
                  textColor: Colors.white,
                  padding: EdgeInsets.all(8.0),
                  splashColor: Colors.grey,
                ),
                RaisedButton(
                  child: Text(
                    "List all clinics", style: TextStyle(fontSize: 20),),
                  onPressed: () {},
                  color: Colors.blueGrey,
                  textColor: Colors.white,
                  padding: EdgeInsets.all(8.0),
                  splashColor: Colors.grey,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}
