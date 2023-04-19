// ignore_for_file: use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skyfy/src/data/services/firebase_services.dart';
import 'package:skyfy/src/ui/utils/ui.dart';

class AddAircraftScreen extends StatefulWidget {
  const AddAircraftScreen({Key? key, this.url}) : super(key: key);

  final String? url;

  @override
  State<AddAircraftScreen> createState() => _AddAircraftScreenState();
}

class _AddAircraftScreenState extends State<AddAircraftScreen> {
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    TextEditingController nameController = TextEditingController(text: "");
    TextEditingController brandController = TextEditingController(text: "");
    TextEditingController modelController = TextEditingController(text: "");
    TextEditingController registerController = TextEditingController(text: "");
    TextEditingController yearController = TextEditingController(text: "");
    TextEditingController companyController = TextEditingController(text: "");
    TextEditingController hoursController = TextEditingController(text: "");
    TextEditingController capacityController = TextEditingController(text: "");
    TextEditingController statusController =
        TextEditingController(text: "online");
    bool isActiveColorSwitch = true;
    //String selectedCompany = '';

    return Scaffold(
        appBar: AppBar(
          title: const Text('Add Aircraft'),
          actions: [
            IconButton(
              icon: const Icon(Icons.save),
              onPressed: () async {
                await addAircrafts(
                    nameController.text,
                    brandController.text,
                    modelController.text,
                    registerController.text,
                    yearController.text,
                    companyController.text,
                    hoursController.text,
                    capacityController.text,
                    statusController.text);

                Navigator.of(context).pop();
                if (nameController.text.isEmpty) {
                  print("There's nothing to save");
                  return;
                }
              },
            )
          ],
        ),
        body: SafeArea(
            child: Container(
          padding: const EdgeInsets.all(32),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Add Aircraft',
                      style: TextStyle(
                          fontSize: 24, fontFamily: 'HelveticaNeueLTStd-HvCn'),
                    ),
                    CupertinoFormSection(key: formKey, children: [
                      CupertinoFormRow(
                        prefix: const Text('Name:'),
                        child: CupertinoTextFormFieldRow(
                          controller: nameController,
                          placeholder: 'Enter Aircraft Name',
                        ),
                      ),
                      CupertinoFormRow(
                        prefix: const Text('Brand:'),
                        child: CupertinoTextFormFieldRow(
                          controller: brandController,
                          placeholder: 'Enter Aircraft Brand',
                        ),
                      ),
                      CupertinoFormRow(
                        prefix: const Text('Model:'),
                        child: CupertinoTextFormFieldRow(
                          controller: modelController,
                          placeholder: 'Enter Aircraft Model',
                        ),
                      ),
                      CupertinoFormRow(
                        prefix: const Text('Register:'),
                        child: CupertinoTextFormFieldRow(
                          controller: registerController,
                          placeholder: 'Enter Aircraft Register',
                        ),
                      ),
                      CupertinoFormRow(
                        prefix: const Text('Year:'),
                        child: CupertinoTextFormFieldRow(
                          controller: yearController,
                          placeholder: 'Enter Aircraft Year',
                        ),
                      ),
                      // StreamBuilder<QuerySnapshot>(
                      //   stream: FirebaseFirestore.instance
                      //       .collection('Companies')
                      //       .snapshots(),
                      //   builder: (BuildContext context,
                      //       AsyncSnapshot<QuerySnapshot> snapshot) {
                      //     if (!snapshot.hasData) {
                      //       return const SizedBox();
                      //     } else if (snapshot.hasError) {
                      //       const Text('No data avaible right now');
                      //     }
                      //     List? companies = snapshot.data?.docs
                      //         .map((doc) => doc.get('name'))
                      //         .toList();
                      //     return DropdownButtonFormField(
                      //       value: selectedCompany,
                      //       hint: const Text('Seleccione la compañía'),
                      //       items: companies?.map((company) {
                      //         print(selectedCompany);
                      //         return DropdownMenuItem(
                      //           value: company,
                      //           child: Text(company),
                      //         );
                      //       }).toList(),
                      //       onChanged: (value) {
                      //         setState(() {
                      //           selectedCompany = value.toString();
                      //         });
                      //       },
                      //       decoration: const InputDecoration(
                      //         hintText: 'Compañía',
                      //       ),
                      //       validator: (value) {
                      //         if (value == null) {
                      //           return 'Por favor seleccione una compañía';
                      //         }
                      //         return null;
                      //       },
                      //     );
                      //   },
                      // ),
                      CupertinoFormRow(
                        prefix: const Text('Company:'),
                        child: CupertinoTextFormFieldRow(
                          controller: companyController,
                          placeholder: 'Enter Aircraft Company',
                        ),
                      ),
                      CupertinoFormRow(
                        prefix: const Text('Capacity:'),
                        child: CupertinoTextFormFieldRow(
                          controller: capacityController,
                          placeholder: 'Enter Aircraft Passenger Capacity',
                        ),
                      ),
                      CupertinoFormRow(
                        prefix: const Text('Hours:'),
                        child: CupertinoTextFormFieldRow(
                          controller: hoursController,
                          placeholder: 'Enter Aircraft Flight hours',
                        ),
                      ),
                      CupertinoSwitch(
                        value: isActiveColorSwitch,
                        activeColor: Palette.blueSkyFy,
                        onChanged: (bool val) {
                          isActiveColorSwitch = val;
                          setState(() {});
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ]),
                    const SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () async {
                        final picker = ImagePicker();
                        final XFile? pickedFile = await picker.pickImage(
                            // source: ImageSource.gallery,
                            source: ImageSource.camera,
                            imageQuality: 100);

                        if (pickedFile == null) {
                          print('No seleccionó nada');
                          return;
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Stack(children: [
                          Container(
                              margin:
                                  const EdgeInsets.only(top: 20, bottom: 20),
                              width: double.infinity,
                              height: 200,
                              decoration: BoxDecoration(
                                color: Palette.lightSkyfy,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.camera_alt_outlined,
                                        size: 50, color: Palette.blueSkyFy),
                                    Text(
                                      'Select Picture',
                                      style: TextStyle(
                                          color: Palette.blueSkyFy,
                                          fontFamily: 'Matter-Bold',
                                          fontSize: 20),
                                    )
                                  ],
                                ),
                              )),
                        ]),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        )));
  }
}
