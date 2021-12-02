import 'package:flutter/material.dart';
import 'package:flutter_chat/services/auth.dart';

class SignUp extends StatefulWidget {
  SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final AuthService _auth=AuthService();
  String email='';
  String password='';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgrounColor:Colors.grey[500],
        title:Text('sign up to flutter chat'),
        centerTitle:true,
        elevation:0.0
      ),
      body:Container(
       padding:EdgeInsets.all(20),
       child:Form(
        child:Column(
         children:[
           TextFormField(
            onChanged:(val){
             setState((val){
               email=val;
             });
            },
            
           ),
           SizedBox(height:20),
           TextFormField(
            obsecureText:true,
            onChanged:(val){
             setState((){
               password=val;
             });
            },
            
           ),
           SizedBox(height:20),
           TextButton(
             onPressed:() async{

             },
             color:colors.brown[600],
             child:Text('sign up',style:TextStyle(color:Colors.white))
           )
         ]
        ) 
       )
      )
    );
  }
}