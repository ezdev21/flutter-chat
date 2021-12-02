import 'package:flutter/material.dart';
import 'package:flutter_chat/services/auth.dart';
import 'package:flutter_chat/constants.dart';

class SignUp extends StatefulWidget {
  final Function toggleView;
  SignUp({Key? key,this.toggleView}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final AuthService _auth=AuthService();
  String email='';
  String password='';
  String error="";
  final _formKey=GlobalKey<FormState>();
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgrounColor:Colors.grey[500],
        title:Text('sign up to flutter chat'),
        centerTitle:true,
        elevation:0.0,
        actions:[
          FlatButton.icon(
            onPressed:(){
              widget.toggleView();
            },
            icon:Icon(Icons.person),
            label:Text('Sign In')
          )
        ]
      ),
      body:Container(
       padding:EdgeInsets.all(20),
       child:Form(
        key:_formKey,
        child:Column(
         children:[
           TextFormField(
            validator:(val) => val.isEmpty ? 'email required' :null,
            onChanged:(val){
             setState((val){
               email=val;
             });
            },
            decoration:textInputDecoration.copyWith(hintText:'email',labelText:'email')
           ),
           SizedBox(height:20),
           TextFormField(
            obsecureText:true,
            validator:(val) => val.length ? 'enter a password 6+ chars' :null,
            onChanged:(val){
             setState((){
               password=val;
             });
            },
            decoration:textInputDecoration.copyWith(hintText:'password',labelText:'password')
           ),
           SizedBox(height:20),
           TextButton(
             onPressed:() async{
              if(_formKey.currentState.validate()){
                dynamic result=await _auth.register(email:email,password:password);
                if(result){

                }
                else{
                  setState((){
                    error="please supply a valid email";
                  });
                }
              }
             },
             color:colors.brown[600],
             child:Text('sign up',style:TextStyle(color:Colors.white))
           ),
           SizedBox(height:30),
           Text(
             error,
             style:TextStyle(color:Colors.red,fontSize:20)
           )
         ]
        ) 
       )
      )
    );
  }
}