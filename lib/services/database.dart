import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService{

  final String uid;
  DatabaseService({this.uid});

  final CollectionReference users=Firestore.instance.collection('users');
  final CollectionReference messages=Firestore.instance.collection('messages');
  Future createUser(String name,String email,String password) async{
    return await users.document(uid).setData({
      'name':name,
      'email':email,
      'password':password
    });
  }
  
  Future createMessage(String uid1,String uid2,String message) asyn{
   return await messages.document(uid).setData({
    'uid1':uid1,
    'uid2':uid2,
    'message':message
   });
  }

  Stream<QuerySnapshots> get message(){
    return messages.snapshots();
  }
  
}