// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:skyfy/src/data/services/firebase_services.dart';
import 'package:skyfy/src/ui/global/widgets/attendshared/common_widget.dart';
import 'package:skyfy/src/ui/global/widgets/attendshared/strings.dart';
import 'package:skyfy/src/ui/utils/palette.dart';

class PilotsScreen extends StatefulWidget {
  const PilotsScreen({super.key});

  @override
  State<PilotsScreen> createState() => _PilotsScreenState();

  Widget cardPilots({
    required username,
    name,
    email,
    license,
    status,
    imagePath,
    role,
    company,
    hours,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: boxDecorationDefault(
            borderRadius: radius(32), color: Palette.lightSkyfy),
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset('assets/images/joker.jpg', height: 130)
                    .cornerRadiusWithClipRRect(16),
                16.width,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(username,
                        style:
                            boldTextStyle(size: 18, weight: FontWeight.w500)),
                    8.height,
                    Text(email,
                        style: primaryTextStyle(color: Colors.blue, size: 14)),
                    8.height,
                    Text(company, style: primaryTextStyle(size: 14)),
                    Text(status, style: primaryTextStyle(size: 14))
                  ],
                ).expand(),
              ],
            ),
            16.height,
            // AppButton(
            //   text: 'Select Your Seats to continue',
            //   textStyle: primaryTextStyle(size: 15),
            //   color: Colors.amber,
            //   shapeBorder: RoundedRectangleBorder(borderRadius: radius(16)),
            //   onTap: () {},
            // )
          ],
        ),
      ),
    );
  }
}

class _PilotsScreenState extends State<PilotsScreen> {
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
                title: Strings.pilots,
                backArrow: true,
                theme: false,
              ),
              Expanded(
                child: FutureBuilder(
                    future: getPilots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                            padding: EdgeInsets.zero,
                            itemCount: snapshot.data?.length,
                            itemBuilder: (context, index) {
                              return widget.cardPilots(
                                  username: snapshot.data?[index]['username'],
                                  name: snapshot.data?[index]['name'],
                                  email: snapshot.data?[index]['email'],
                                  license: snapshot.data?[index]['license'],
                                  status: snapshot.data?[index]['status'],
                                  imagePath: snapshot.data?[index]
                                          ['imagePath'] ??
                                      const AssetImage(
                                          'assets/images/aircrafts/c172.jpg'),
                                  role: snapshot.data?[index]['role'],
                                  company: snapshot.data?[index]['company'],
                                  hours: snapshot.data?[index]['hours']);
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
          //!Button Add
          floatingActionButton: GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed('');
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

  void submit() async {
    await addCompanies(
        nameController.text, rucController.text, addressController.text);
    Navigator.of(context).pop();
    setState(() {});
  }
}
