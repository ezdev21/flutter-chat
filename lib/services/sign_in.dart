import 'package:flutter/material.dart';
import 'package:flutter_chat/constants.dart';

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
  String error="";
  final _formKey=GlobalKey<FormState>();

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
            decoration:textInputDecoration.copyWith(labelText:'email',hintText:'email'),
           ),
           SizedBox(height:20),
           TextFormField(
            obsecureText:true,
            validator:(val) => val.isEmpty ? 'password required' :null,
            onChanged:(val){
             setState((){
               password=val;
             });
            },
            decoration:textInputDecoration.copyWith(labelText:'password',hintText:'password')
           ),
           SizedBox(height:20),
           TextButton(
             onPressed:() async{
               if(_formKey.currentState.validate()){
                dynamic result=await _auth.signIn(email:email,password:password);
                if(result){
                  
                }
                else{
                  setState((){
                    error="invalid email or password";
                  });
                }
              }
             },
             color:colors.brown[600],
             child:Text('sign in',style:TextStyle(color:Colors.white))
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