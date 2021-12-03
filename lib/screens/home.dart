import 'package:flutter/material.dart';
import 'package:flutter_chat/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:flutter_chat/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_chat/screens/friends_list.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  final AuthService _auth=AuthService();
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Friend>>.value(
      value:DatabaseService().messages,
      child:Scaffold(
       appBar:AppBar(
        backgroundColor:Colors.brown[400],
        title:Text('Welcome ${user['name']}'),
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
      ),
      body:FriendsList()
    )
  );
  }
}