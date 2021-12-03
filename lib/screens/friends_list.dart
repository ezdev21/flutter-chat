import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FriendsList extends StatefulWidget {
  FriendsList({Key? key}) : super(key: key);

  @override
  _FriendsListState createState() => _FriendsListState();
}

class _FriendsListState extends State<FriendsList> {
  final friends=Provider.of<QuerySnapshot>(context)
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}