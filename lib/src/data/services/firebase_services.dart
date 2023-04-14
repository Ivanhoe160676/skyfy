import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore skyfyDB = FirebaseFirestore.instance;

Future<List> getUsers() async {
  List users = [];
  CollectionReference collectionReferenceUsers = skyfyDB.collection('Users');
  QuerySnapshot queryUsers = await collectionReferenceUsers.get();
  for (var doc in queryUsers.docs) {
    users.add(doc.data());
  }
  return users;
}
