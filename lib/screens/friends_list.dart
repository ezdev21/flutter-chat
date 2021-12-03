import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FriendsList extends StatefulWidget {
  FriendsList({Key? key}) : super(key: key);

  @override
  _FriendsListState createState() => _FriendsListState();
}

class _FriendsListState extends State<FriendsList> {
  final friends=Provider.of<List<Friend>>(context)
  @override
  Widget build(BuildContext context) {
    return Container(
      child:ListView.builder(
        itemCount:friends.length,
        itemBuilder:(context,index){
          return ListView(
            onTap:(){

            },
            leading:CircleAvatar(
              backgroundImage:NetworkImage(friends[index]['avatar']),
              radius:30
            ),
            title:Text(friends[index]['name'],style:TextStyle(fontSIze:20px,fontWeight:FontWEight.bold)),
            trailing:Text('DATE',style:TextStyle())
          )
        }
      )
    );
  }
}