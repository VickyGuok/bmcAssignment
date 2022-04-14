import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

void main() => runApp(
    MaterialApp(
      home: MyApp(),
    )
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: Text('User Login Form')),
            body: Center(
                child: LoginUser()
            )
        )
    );
  }
}

class LoginUser extends StatefulWidget{
  LoginUserState createState() => LoginUserState();

}
class LoginUserState extends State{
  bool visible = false;
  //to get value from textfield widget
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  Future userLogin() async{
    //show circularprogress indicator
    setState(() {
      visible=true;
    });

    //getting value from controller
    String username= usernameController.text;
    String password = passwordController.text;

    //server login url
    var url = 'https://192.168.64.3/user_login.php';
    //store data with parameter names
    var data = {'username': username, 'password':password};
    //start web api call
    var response = await http.post(Uri.parse(url), body: json.encode(data));
    //get server response into variable
    var message = jsonDecode(response.body);

    //if response message is matched
    if(message == 'Login Matched'){
      //hide circularprogressindicator
      setState(() {
        visible = false;
      });
      //navigate to other screen
      Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen(username : usernameController.text))
      );
    }else{
      //if password or username did not match
      setState(() {
        visible = false;
      });

      showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: new Text(message),
            actions:<Widget>[
              FlatButton(
                child: new Text("OK"),
                onPressed: (){
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );}
  }
  Widget build(BuildContext context){
    return Scaffold(
        body:SingleChildScrollView(
            child: Center(
              child:Column(
                children :<Widget>[
                  Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text('User login ', style : TextStyle(fontSize:21))
                  ),
                  Divider(),
                  Container(
                      width : 280,
                      padding : EdgeInsets.all(10.0),
                      child:TextField(
                        controller:usernameController,
                        autocorrect: false,
                        decoration:InputDecoration(hintText: 'username'),
                      )
                  ),
                  Container(
                      width: 280,
                      padding: EdgeInsets.all(10.0),
                      child: TextField(
                        controller: passwordController,
                        autocorrect: false,
                        obscureText: true,
                        decoration: InputDecoration(hintText: 'password'),
                      )
                  ),
                  RaisedButton(
                    onPressed:userLogin,
                    color: Colors.blueGrey,
                    textColor: Colors.white,
                    padding: EdgeInsets.fromLTRB(9, 9, 9, 9),
                    child: Text('Login'),
                  ),
                  Visibility(
                      visible: visible,
                      child: Container(
                          margin: EdgeInsets.only(bottom:30),
                          child: CircularProgressIndicator()
                      )
                  ),
                ],
              ),
            )
        )
    );
  }
}

class ProfileScreen extends StatelessWidget {
  final String username;

  //receive username using constructor
  // ProfileScreen({Key key, @required this.username}) : super(key: key);
  ProfileScreen({Key? key, required this.username}) : super(key: key);

  //logout function
  logout(BuildContext context){
    Navigator.pop(context);
  }

  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: Text('Profile Screen'),
                automaticallyImplyLeading: false),
            body: Center(
                child: Column(children: <Widget>[

                  Container(
                      width: 280,
                      padding: EdgeInsets.all(10.0),
                      child: Text('username = ' + '\n' + username,
                          style: TextStyle(fontSize: 20))
                  ),
                  RaisedButton(
                    onPressed: () {
                      logout(context);
                    },
                    color: Colors.red,
                    textColor: Colors.white,
                    child: Text('Click Here To Logout'),
                  ),

                ],)
            )
        )
    );
  }
}
