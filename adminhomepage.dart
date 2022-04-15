
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jabazonflutter/casesmenu.dart';
import 'package:jabazonflutter/clinicmenu.dart';

class adminhomepage extends StatelessWidget{
  const adminhomepage({Key? key}) : super(key: key);

  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(length: 2, child: Scaffold(
        appBar: AppBar(
            bottom: const TabBar(tabs: [
            Tab(
            icon: Icon(Icons.auto_graph),
            text: 'Daily Cases',
            ),
            Tab(
            icon: Icon(Icons.local_hospital_outlined),
            text: 'Clinics',
            ),
            ],
            ),
          title: const Text('Admin menu'),
        ),
          body: const TabBarView(
              children: [
                casesmenu(),
                clinicmenu(),
              ],
          ),
      ),
      ),
    );
  }
}
