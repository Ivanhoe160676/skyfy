// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:skyfy/src/ui/global/widgets/attendshared/app_colors.dart';
import 'package:skyfy/src/ui/global/widgets/attendshared/common_widget.dart';
import 'package:skyfy/src/ui/global/widgets/attendshared/responsive_flutter.dart';
import 'package:skyfy/src/ui/global/widgets/attendshared/strings.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  const PrivacyPolicyScreen({Key? key}) : super(key: key);
  @override
  _PrivacyPolicyScreenState createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
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
            commonAppBar(
              context: context,
              backArrow: true,
              title: Strings.privacyPolicy,
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(
                  horizontal: ResponsiveFlutter.of(context).moderateScale(20),
                  vertical: ResponsiveFlutter.of(context).moderateScale(15),
                ),
                shrinkWrap: false,
                children: [
                  MyTextView(
                    Strings.dummyText4,
                    textAligntNew: TextAlign.start,
                    maxLineWrap: true,
                    styleNew: MyTextStyle(
                      colorNew: appColors.lightColor,
                      fontWeightNew: FontWeight.w400,
                      textHeight: 1.3,
                      size: ResponsiveFlutter.of(context).fontSize(2.1),
                    ),
                  ),
                  SizedBox(
                    height: ResponsiveFlutter.of(context).verticalScale(15),
                  ),
                  MyTextView(
                    Strings.dummyText5,
                    textAligntNew: TextAlign.start,
                    maxLineWrap: true,
                    styleNew: MyTextStyle(
                      colorNew: appColors.lightColor,
                      fontWeightNew: FontWeight.w400,
                      textHeight: 1.3,
                      size: ResponsiveFlutter.of(context).fontSize(2.1),
                    ),
                  ),
                  SizedBox(
                    height: ResponsiveFlutter.of(context).verticalScale(15),
                  ),
                  MyTextView(
                    Strings.dummyText6,
                    textAligntNew: TextAlign.start,
                    maxLineWrap: true,
                    styleNew: MyTextStyle(
                      colorNew: appColors.lightColor,
                      fontWeightNew: FontWeight.w400,
                      textHeight: 1.3,
                      size: ResponsiveFlutter.of(context).fontSize(2.1),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
