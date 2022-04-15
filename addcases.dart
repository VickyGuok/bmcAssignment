import 'package:flutter/material.dart';

import 'adminhomepage.dart';

class addcases extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Add daily cases';
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: Text(appTitle),
        ),
        body: AddcasesForm(),
      ),
    );
  }
}

class AddcasesForm extends StatefulWidget {
  @override
  AddcasesFormState createState(){
    return AddcasesFormState();
  }
}
class AddcasesFormState extends State<AddcasesForm> {
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
              icon: const Icon(Icons.add_chart),
              hintText:'Enter daily cases',
              labelText:'Daily cases',
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
