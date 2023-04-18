import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore skyfyDB = FirebaseFirestore.instance;

//!Users Section
Future<List> getUsers() async {
  List users = [];
  CollectionReference collectionReferenceUsers = skyfyDB.collection('Users');
  QuerySnapshot queryUsers = await collectionReferenceUsers.get();
  for (var doc in queryUsers.docs) {
    users.add(doc.data());
  }
  return users;
}

//!Companies Section

Future<List> getCompanies() async {
  List companies = [];
  CollectionReference collectionReferenceCompanies =
      skyfyDB.collection('Companies');
  QuerySnapshot queryCompanies = await collectionReferenceCompanies.get();
  for (var doc in queryCompanies.docs) {
    companies.add(doc.data());
  }
  return companies;
}

Future<void> addCompanies(String name, String ruc, String address) async {
  await skyfyDB
      .collection('Companies')
      .add({"name": name, "address": address, "ruc": ruc});
}

//!Aircrafts Section

Future<List> getAircrafts() async {
  List aircrafts = [];
  CollectionReference collectionReferenceAircrafts =
      skyfyDB.collection('Aircrafts');
  QuerySnapshot queryAircrafts = await collectionReferenceAircrafts.get();
  for (var doc in queryAircrafts.docs) {
    aircrafts.add(doc.data());
  }
  return aircrafts;
}

Future<void> addAircrafts(
    String name,
    String brand,
    String model,
    String register,
    String year,
    String company,
    String hours,
    String passengerCapacity,
    String status) async {
  await skyfyDB.collection('Aircrafts').add({
    "name": name,
    "brand": brand,
    "model": model,
    "register": register,
    "year": year,
    "company": company,
    "hours": hours,
    "passengerCapacity": passengerCapacity,
    "status": status,
  });
}
