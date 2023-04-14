// ignore_for_file: library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:skyfy/src/domain/models/attend_model.dart';
import 'package:skyfy/src/ui/global/widgets/attendshared/app_colors.dart';
import 'package:skyfy/src/ui/global/widgets/attendshared/responsive_flutter.dart';
import 'package:skyfy/src/ui/screens/profile/widgets/profile_widget.dart';
import 'package:skyfy/src/ui/screens/profile/widgets/strings.dart';
import 'package:skyfy/src/ui/screens/settings/widgets/settings_widgets.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({Key? key}) : super(key: key);
  @override
  _MyProfileScreenState createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  AppColors appColors = AppColors();
  List<CommonModel>? select = [
    CommonModel(isSelect: true),
    CommonModel(isSelect: false),
    CommonModel(isSelect: true),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      top: false,
      child: Scaffold(
        backgroundColor: appColors.appMediumColor,
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    const SizedBox(height: 16),
                    Container(
                      margin: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                      decoration: boxDecoration(
                          bgColor: context.scaffoldBackgroundColor,
                          radius: 10,
                          showShadow: true),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: <Widget>[
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                rowHeading(t1LblPersonal),
                                buttonEdit(),
                              ],
                            ),
                            const SizedBox(height: 16),
                            profileText(t1UserName),
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(16, 10, 16, 10),
                              child: view(),
                            ),
                            const SizedBox(height: 8),
                            profileText("June 16, 1976"),
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(16, 10, 16, 10),
                              child: view(),
                            ),
                            const SizedBox(height: 8),
                            profileText(t1ProfileAddress, maxline: 2),
                            const SizedBox(height: 16),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      margin: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                      decoration: boxDecoration(
                          bgColor: context.scaffoldBackgroundColor,
                          radius: 10,
                          showShadow: true),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: <Widget>[
                            const SizedBox(height: 8),
                            rowHeading(t1LblContacts),
                            const SizedBox(height: 16),
                            profileText("+593 983748341"),
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(16, 10, 16, 10),
                              child: view(),
                            ),
                            const SizedBox(height: 8),
                            profileText("sron1976@gmail.com"),
                            const SizedBox(height: 8),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  buttonEdit() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: ResponsiveFlutter.of(context).moderateScale(25),
        width: ResponsiveFlutter.of(context).moderateScale(25),
        padding: EdgeInsets.all(ResponsiveFlutter.of(context).moderateScale(2)),
        child: Image.asset('assets/images/attend/ic_edit.png'),
      ),
    );
  }
}
