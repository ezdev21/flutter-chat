import 'package:firebase_auth/firebase-auth.dart';
import 'package:flutter_chat/models/my_user.dart';
import 'package:firebase_auth/firebse_auth.dart';

class AuthService {

  final FirebaseAuth _auth=FirebaseAuth.instance;
  MyUser _user(User user){
    if(!user){

    }
    else{
      return user;
    }
  }
  Future signIn() async{
    try{
      UserCredential result=await _auth.signIn();
      User user=result.user;
    }
    catch(e){

    }
  }
}
