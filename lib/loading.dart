import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  Widget build(BuildContext context) {
    return Container(
     color:Colors.brown[300],
     child:Center(
       child:SpinKitFadingCube(
         color:Colors.white,
         size:50.0
       )
     )
    );
  }
}