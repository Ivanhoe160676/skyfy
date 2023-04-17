// ignore_for_file: use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:skyfy/main.dart';
import 'package:skyfy/src/data/services/firebase_services.dart';
import 'package:skyfy/src/ui/global/widgets/attendshared/common_widget.dart';
import 'package:skyfy/src/ui/global/widgets/attendshared/strings.dart';
import 'package:skyfy/src/ui/utils/palette.dart';

class AircraftsScreen extends StatefulWidget {
  const AircraftsScreen({super.key});

  @override
  State<AircraftsScreen> createState() => _AircraftsScreenState();

  Widget cardAircrafts({required name, address}) {
    return Column(
      children: [
        Row(
          children: [
            const Expanded(
              flex: 1,
              child: FittedBox(
                fit: BoxFit.fill,
                child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16))),
                    child: Image(
                        image:
                            AssetImage('assets/images/aircrafts/cirrus.jpg'))),
              ),
            ),
            Expanded(
              flex: 1,
              child: Card(
                elevation: 2,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                ),
                child: InkWell(
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                  onTap: () {},
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 16, right: 16, top: 8),
                        child: Text(
                          'lipsum.createWord(numWords: 9)',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: primaryTextStyle(
                            color: appStore.textPrimaryColor,
                          ),
                        ),
                      ),
                      const Divider(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  'Brand:',
                                  style: secondaryTextStyle(
                                      color: appStore.textSecondaryColor),
                                ),
                                Text('Cyrrus',
                                    style: secondaryTextStyle(
                                        color: appStore.textSecondaryColor))
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  'Model:',
                                  style: secondaryTextStyle(
                                      color: appStore.textSecondaryColor),
                                ),
                                Text('Cyrrus',
                                    style: secondaryTextStyle(
                                        color: appStore.textSecondaryColor))
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  'Register:',
                                  style: secondaryTextStyle(
                                      color: appStore.textSecondaryColor),
                                ),
                                Text('Cyrrus',
                                    style: secondaryTextStyle(
                                        color: appStore.textSecondaryColor))
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  'Year:',
                                  style: secondaryTextStyle(
                                      color: appStore.textSecondaryColor),
                                ),
                                Text('Cyrrus',
                                    style: secondaryTextStyle(
                                        color: appStore.textSecondaryColor))
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  'Company:',
                                  style: secondaryTextStyle(
                                      color: appStore.textSecondaryColor),
                                ),
                                Text('Cyrrus',
                                    style: secondaryTextStyle(
                                        color: appStore.textSecondaryColor))
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  'Hours:',
                                  style: secondaryTextStyle(
                                      color: appStore.textSecondaryColor),
                                ),
                                Text('Cyrrus',
                                    style: secondaryTextStyle(
                                        color: appStore.textSecondaryColor))
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  'Capacity:',
                                  style: secondaryTextStyle(
                                      color: appStore.textSecondaryColor),
                                ),
                                Text('Cyrrus',
                                    style: secondaryTextStyle(
                                        color: appStore.textSecondaryColor))
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Divider(
          color: Palette.blueSkyFy,
          height: 6,
        )
      ],
    );
  }
}

class _AircraftsScreenState extends State<AircraftsScreen> {
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
                title: Strings.aircrafts,
                backArrow: true,
                theme: false,
              ),
              Expanded(
                child: FutureBuilder(
                    future: getAircrafts(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                            padding: EdgeInsets.zero,
                            itemCount: snapshot.data?.length,
                            itemBuilder: (context, index) {
                              return widget.cardAircrafts(
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
              Expanded(
                  child: ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return widget.cardAircrafts(
                          name: 'Test',
                          address: 'Test',
                        );
                        //Text(snapshot.data?[index]['name']);
                      }))
            ],
          ),
          //!Button Add
          floatingActionButton: GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed('/addAircraft');
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
    setState(() {});
  }
}
