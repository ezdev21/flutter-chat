import 'package:flutter/material.dart';
import 'package:flutter_chat/services/auth.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  final AuthService _auth=AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor:Colors.brown[400],
        title:Text('Home'),
        elevation:0.0,
        actions:[
          FlatButton.icon(
           onPressed:() async{
             await _auth.signOut();
           },
           icon:Icon(Icons.person),
           label:Text('logout')
          )
        ]
      )
    );
  }
}