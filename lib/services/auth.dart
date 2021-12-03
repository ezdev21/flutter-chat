import 'package:firebase_auth/firebase-auth.dart';
import 'package:flutter_chat/models/my_user.dart';
import 'package:firebase_auth/firebse_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {

  final FirebaseAuth _auth=FirebaseAuth.instance;
  
  MyUser _user(User user){
    return user? MyUser(uid:user.uid,email:user.email,name:user.name) : null;
  }

  Sream<MyUser> get() async{
   return _auth.onAuthStateChanged;
          .map((User user)=>_user(user));
  }
  
  Future register(String name,String email, String password) async{
    try{
     UserCredential result=await _auth.createUserWithEmailAndPassword(email:email,password:password);
     User user=result.user;
     await DatabaseService(uid:user.uid).createUser(name:name,email:email,password:password)
     return _user(user);
    }
    catch(e){
      return null;
    }
  }

  Future signIn(String email, String password) async{
    try{
      UserCredential result=await _auth.signInWithEmailAndPassword(email:email,password:password);
      User user=result.user;
      return _user(user);
    }
    catch(e){
      return null;
    }
  }

  Future signOut() async{
    try{
     return _auth.signOut();
    }
    catch(e){

    }
  }
}
