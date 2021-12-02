import 'package:flutter/material.dart';
import 'package:flutter_chat/screens/home.dart';
import 'package:provider/provider.dart';
import 'package:flutter_chat/services/authenticate.dart';
import 'package:flutter_chat/models/my_user.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<MyUser>.value(
      value:AuthService().user,
      child:MaterialApp(
      title: 'my chat',
      theme:ThemeData(
        primarySwatch:Colors.blue
      ), 
      home: Home()
    );
    )
  }
}
