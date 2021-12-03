import 'package:flutter/material.dart';
import 'package:flutter_chat/services/auth.dart';
import 'package:flutter_chat/constants.dart';
import 'package:flutter_chat/loading.dart';

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
  bool loading=false;

  String validateEmail(String value) {
    String pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter a valid email address';
    else
      return null;
  }

  @override
  Widget build(BuildContext context) {
    return loading
    ? Loading()
    : Scaffold(
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
        autovalidateMode=AutovalidateMode.always;
        child:Column(
         children:[
           TextFormField(
            validator:validateEmail,
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
                loading=true;
                dynamic result=await _auth.register(email:email,password:password);
                if(!result){
                  setState((){
                    loading=false;
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