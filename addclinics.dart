import 'package:flutter/material.dart';

import 'adminhomepage.dart';

class addclinics extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Add clinic';
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: Text(appTitle),
        ),
        body: AddclinicForm(),
      ),
    );
  }
}

class AddclinicForm extends StatefulWidget {
  @override
  AddclinicFormState createState(){
    return AddclinicFormState();
  }
}
class AddclinicFormState extends State<AddclinicForm> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(
              icon: const Icon(Icons.local_hospital_outlined),
              hintText:'Enter clinic name',
              labelText:'Clinic name',
            ),
          ),
          TextFormField(
            decoration: const InputDecoration(
              icon: const Icon(Icons.local_hospital_rounded),
              hintText:'Enter clinic address',
              labelText:'Clinic address',
            ),
          ),
          new Container(
              padding: const EdgeInsets.only(left:150.0, top:40.0),
              child:new RaisedButton(
                child: const Text('Submit'),
                onPressed:(){Navigator.push(context, MaterialPageRoute(builder:(context) => adminhomepage()));},
              )
          ),
        ],
      ),
    );
  }

}
