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

  List<Friend> friendsList(QuerySnapshot snapshot){
    return snapshot.documents.map((doc)=>{
      return Friend(
        uid:doc.data['uid'],
        name:doc.data['name'],
        email:doc.data['emai']
      )
    }).toList();
  }
  
  List<Message> messageList(QuerySnapshot snapshot){
    return snapshot.documents.map((doc)=>{
      return Message(
        uid:doc.data['uid'],
        user_from:doc.data['user_from'],
        user_to:doc.data['user_to'],
        body:doc.data['body']
      )
    }).toList();
  }  

  Stream<List<Friend>> get friends(){
    return friends.snapshots()
    .map(friendList);
  }
  Stream<List<Message>> get messages(){
    return messages.snapshots()
    .map(messageList);
  }
}