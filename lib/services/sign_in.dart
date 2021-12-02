import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgrounColor:Colors.grey[500],
        title:Text('sign in to flutter chat'),
        centerTitle:true,
        elevation:0.0
      ),
      body:Container(
       padding:EdgeInsets.all(20),
       child:Form(
        child:Column(
         children:[
           TextFormField(
            onChanged:(){

            },
            
           )
         ]
        ) 
       )
      )
    );
  }
}