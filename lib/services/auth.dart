import 'package:firebase_auth/firebase-auth.dart';

class AuthService {

  final FirebaseAuth _auth=FirebaseAuth.instance;
  Future signIn() async{
    try{
      UserCredential result=await _auth.signIn();
      User user=result.user;
    }
    catch(e){

    }
  }
}
