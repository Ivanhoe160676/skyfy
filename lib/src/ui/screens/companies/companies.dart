// ignore_for_file: use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skyfy/src/data/services/firebase_services.dart';
import 'package:skyfy/src/ui/global/widgets/attendshared/common_widget.dart';
import 'package:skyfy/src/ui/global/widgets/attendshared/strings.dart';
import 'package:skyfy/src/ui/global/widgets/drawer_widget.dart';
import 'package:skyfy/src/ui/utils/palette.dart';

class CompaniesScreen extends StatefulWidget {
  const CompaniesScreen({super.key});

  @override
  State<CompaniesScreen> createState() => _CompaniesScreenState();

  Widget cardCompanies({required name, address}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: Card(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
                leading: Image.asset('assets/images/gold.png'),
                title: Text(name),
                subtitle: Text(address)),
          ],
        ),
      ),
    );
  }
}

class _CompaniesScreenState extends State<CompaniesScreen> {
  TextEditingController nameController = TextEditingController(text: "");
  TextEditingController addressController = TextEditingController(text: "");
  TextEditingController rucController = TextEditingController(text: "");
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
          body: Column(
            children: [
              commonAppBar(
                context: context,
                title: Strings.companies,
                backArrow: true,
                theme: false,
              ),
              //!Companies List
              Expanded(
                child: FutureBuilder(
                    future: getCompanies(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                            padding: EdgeInsets.zero,
                            itemCount: snapshot.data?.length,
                            itemBuilder: (context, index) {
                              return widget.cardCompanies(
                                name: snapshot.data?[index]['name'],
                                address: snapshot.data?[index]['address'],
                              );
                              //Text(snapshot.data?[index]['name']);
                            });
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    }),
              ),
            ],
          ),
          drawer: const DrawerWidget(),
          //! Button Add
          floatingActionButton: GestureDetector(
            onTap: () {
              openDialog();
            },
            child: Container(
              width: 60,
              height: 60,
              decoration: ShapeDecoration(
                color: Palette.blueSkyFy,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Icon(
                Icons.add,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
        ));
  }

  //!ShowDialog
  Future openDialog() => showCupertinoDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
          title: const Text('Add New Company'),
          content: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 10,
              ),
              CupertinoTextField(
                autofocus: true,
                controller: nameController,
                prefix: const Text('Name:'),
                placeholder: 'Enter Company Name',
              ),
              const SizedBox(
                height: 5,
              ),
              CupertinoTextField(
                autofocus: true,
                controller: rucController,
                prefix: const Text('RUC:'),
                placeholder: 'Enter Company RUC',
              ),
              const SizedBox(
                height: 5,
              ),
              CupertinoTextField(
                autofocus: true,
                controller: addressController,
                prefix: const Text('Address:'),
                maxLines: 3,
                placeholder: 'Enter Company Address',
              ),
            ],
          ),
          actions: [TextButton(onPressed: submit, child: const Text('SUBMIT'))],
        ),
      );
  void submit() async {
    await addCompanies(
        nameController.text, rucController.text, addressController.text);
    Navigator.of(context).pop();
    if (nameController.text.isEmpty) {
      print('There´s nothing to save');
      return;
    }
    setState(() {});
  }
}
