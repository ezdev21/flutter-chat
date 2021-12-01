import 'package:flutter/material.dart';
import 'package:flutter_chat/screens/home.dart';
import 'package:provider/provider.dart';
import 'package:flutter_chat/services/authenticate.dart';

void main() {
  runApp(MultiProvider(
    providers:[
     ChangeNotifierProvider(create: (context)=>Auth()),
     Provider(create: (context)=>)
    ],
    child:MyApp()
  )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TiruHakim',
      theme:ThemeData(
        primarySwatch:Colors.blue
      ), 
      home: Home()
    );
  }
}
