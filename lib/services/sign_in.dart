import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({Key? key,this.toggleView}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth=AuthService();
  String email="";
  String password="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgrounColor:Colors.grey[500],
        title:Text('sign in to flutter chat'),
        centerTitle:true,
        elevation:0.0,
        actions:[
          FlatButton.icon(
            onPressed:(){
             widget.toggleView();
            },
            icon:Icon(Icons.person),
            label:Text('Sign Up')
          )
        ]
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
             child:Text('sign in',style:TextStyle(color:Colors.white))
           )
         ]
        ) 
       )
      )
    );
  }
}