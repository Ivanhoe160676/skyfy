// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:skyfy/src/ui/global/widgets/attendshared/app_colors.dart';
import 'package:skyfy/src/ui/global/widgets/attendshared/common_widget.dart';
import 'package:skyfy/src/ui/global/widgets/attendshared/image_path.dart';
import 'package:skyfy/src/ui/global/widgets/attendshared/responsive_flutter.dart';
import 'package:skyfy/src/ui/global/widgets/attendshared/strings.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  AppColors appColors = AppColors();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      top: false,
      child: Scaffold(
        backgroundColor: appColors.appMediumColor,
        body: Column(
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Stack(
                  children: [
                    Container(
                      height: ResponsiveFlutter.of(context).moderateScale(170),
                      width: double.infinity,
                      alignment: Alignment.bottomCenter,
                      padding: EdgeInsets.symmetric(
                        vertical:
                            ResponsiveFlutter.of(context).moderateScale(20),
                        horizontal:
                            ResponsiveFlutter.of(context).moderateScale(20),
                      ),
                      margin: EdgeInsets.only(
                          bottom:
                              ResponsiveFlutter.of(context).moderateScale(50)),
                      decoration: BoxDecoration(
                        color: appColors.appDarkColor,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(
                              ResponsiveFlutter.of(context).moderateScale(30)),
                          bottomRight: Radius.circular(
                              ResponsiveFlutter.of(context).moderateScale(30)),
                        ),
                      ),
                    ),
                    commonAppBar(
                      context: context,
                      backArrow: true,
                      title: Strings.editProfile,
                      appBarColor: appColors.appDarkColor,
                      edit: false,
                      editClick: () {},
                    ),
                  ],
                ),
                SizedBox(
                  height: ResponsiveFlutter.of(context).moderateScale(125),
                  width: ResponsiveFlutter.of(context).moderateScale(125),
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          height:
                              ResponsiveFlutter.of(context).moderateScale(120),
                          width:
                              ResponsiveFlutter.of(context).moderateScale(120),
                          decoration: BoxDecoration(
                            color: appColors.appMediumColor,
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset(
                            ImagePath.image_9,
                          ),
                        ),
                      ),
                      Container(
                        height: ResponsiveFlutter.of(context).moderateScale(37),
                        width: ResponsiveFlutter.of(context).moderateScale(37),
                        decoration: BoxDecoration(
                          color: appColors.appMediumColor,
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset(
                          ImagePath.camera,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            ListView(
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(
                vertical: ResponsiveFlutter.of(context).moderateScale(25),
                horizontal: ResponsiveFlutter.of(context).moderateScale(20),
              ),
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(
                      ResponsiveFlutter.of(context).moderateScale(20)),
                  decoration: BoxDecoration(
                    color: appColors.appLightColor,
                    borderRadius: BorderRadius.circular(
                      ResponsiveFlutter.of(context).moderateScale(20),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyTextView(
                        Strings.yourName,
                        textAligntNew: TextAlign.center,
                        styleNew: MyTextStyle(
                          colorNew: appColors.transactionText,
                          fontWeightNew: FontWeight.w400,
                          size: ResponsiveFlutter.of(context).fontSize(1.8),
                        ),
                      ),
                      SizedBox(
                          height:
                              ResponsiveFlutter.of(context).moderateScale(5)),
                      commonTestField(
                        context: context,
                        hintText: Strings.enterYourName,
                        icon: false,
                        keyboardType: TextInputType.number,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                    height: ResponsiveFlutter.of(context).moderateScale(10)),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(
                      ResponsiveFlutter.of(context).moderateScale(20)),
                  decoration: BoxDecoration(
                    color: appColors.appLightColor,
                    borderRadius: BorderRadius.circular(
                      ResponsiveFlutter.of(context).moderateScale(20),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyTextView(
                        Strings.yourAddress,
                        textAligntNew: TextAlign.center,
                        styleNew: MyTextStyle(
                          colorNew: appColors.transactionText,
                          fontWeightNew: FontWeight.w400,
                          size: ResponsiveFlutter.of(context).fontSize(1.8),
                        ),
                      ),
                      SizedBox(
                          height:
                              ResponsiveFlutter.of(context).moderateScale(5)),
                      commonTestField(
                        context: context,
                        hintText: Strings.enterYourAddress,
                        icon: false,
                        keyboardType: TextInputType.number,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                    height: ResponsiveFlutter.of(context).moderateScale(10)),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(
                      ResponsiveFlutter.of(context).moderateScale(20)),
                  decoration: BoxDecoration(
                    color: appColors.appLightColor,
                    borderRadius: BorderRadius.circular(
                        ResponsiveFlutter.of(context).moderateScale(20)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyTextView(
                        Strings.yourPhoneNumber,
                        textAligntNew: TextAlign.center,
                        styleNew: MyTextStyle(
                          colorNew: appColors.transactionText,
                          fontWeightNew: FontWeight.w400,
                          size: ResponsiveFlutter.of(context).fontSize(1.8),
                        ),
                      ),
                      SizedBox(
                          height:
                              ResponsiveFlutter.of(context).moderateScale(5)),
                      commonTestField(
                        context: context,
                        hintText: Strings.enterYourPhoneNumber,
                        icon: false,
                        keyboardType: TextInputType.number,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                    height: ResponsiveFlutter.of(context).moderateScale(25)),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: commonButton(
                    title: Strings.save,
                    context: context,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
