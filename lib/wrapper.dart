import 'package:flutter/material.dart';
import 'package:flutter-chat/services/authenticate.dart';
import 'package:flutter-chat/screens/home.dart';
import 'package:flutter_chat/models/my_user.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user=Provider.of<MyUser>(context);
    return Authenticate();
  }
}