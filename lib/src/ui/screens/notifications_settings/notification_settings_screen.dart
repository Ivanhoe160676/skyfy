// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:skyfy/src/ui/global/widgets/attendshared/app_colors.dart';
import 'package:skyfy/src/ui/global/widgets/attendshared/common_widget.dart';
import 'package:skyfy/src/ui/global/widgets/attendshared/constants.dart';
import 'package:skyfy/src/ui/global/widgets/attendshared/image_path.dart';
import 'package:skyfy/src/ui/global/widgets/attendshared/responsive_flutter.dart';
import 'package:skyfy/src/ui/global/widgets/attendshared/strings.dart';
import 'package:skyfy/src/ui/utils/palette.dart';

class NotificationSettingsScreen extends StatefulWidget {
  const NotificationSettingsScreen({Key? key}) : super(key: key);
  @override
  _NotificationSettingsScreenState createState() =>
      _NotificationSettingsScreenState();
}

class _NotificationSettingsScreenState
    extends State<NotificationSettingsScreen> {
  AppColors appColors = AppColors();
  bool? showNotification = true;
  bool? paymentNotification = true;
  bool? liveNotification = false;
  bool? invitationNotification = false;
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
              title: Strings.notificationSettings,
              backArrow: true,
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(
                  vertical: ResponsiveFlutter.of(context).verticalScale(15),
                  horizontal: ResponsiveFlutter.of(context).scale(20),
                ),
                children: [
                  Stack(
                    alignment: Alignment.topLeft,
                    children: [
                      Container(
                        width: double.infinity,
                        margin: EdgeInsets.only(
                          left: ResponsiveFlutter.of(context).moderateScale(20),
                        ),
                        padding: const EdgeInsets.fromLTRB(45, 25, 25, 25),
                        decoration: BoxDecoration(
                          color: appColors.appLightColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                MyTextView(
                                  Strings.showAllNotifications,
                                  textAligntNew: TextAlign.center,
                                  styleNew: MyTextStyle(
                                    colorNew: appColors.lightColor,
                                    fontWeightNew: FontWeight.w400,
                                    size: ResponsiveFlutter.of(context)
                                        .fontSize(1.5),
                                  ),
                                ),
                                FlutterSwitch(
                                  value: showNotification!,
                                  width: ResponsiveFlutter.of(context)
                                      .moderateScale(38),
                                  height: ResponsiveFlutter.of(context)
                                      .moderateScale(20),
                                  activeToggleColor: appColors.white,
                                  activeColor: Palette.blueSkyFy,
                                  inactiveToggleColor: appColors.white,
                                  toggleColor: appColors.switchColor,
                                  inactiveColor: !Constants.darkTheme
                                      ? appColors.darkGreyText
                                      : appColors.grey,
                                  toggleSize: ResponsiveFlutter.of(context)
                                      .moderateScale(12),
                                  onToggle: (val) {
                                    setState(() {
                                      showNotification = val;
                                    });
                                  },
                                ),
                              ],
                            ),
                            Divider(
                              height: ResponsiveFlutter.of(context)
                                  .moderateScale(40),
                              color: appColors.dividerColor,
                              thickness: 1.5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                MyTextView(
                                  Strings.paymentNotification,
                                  textAligntNew: TextAlign.center,
                                  styleNew: MyTextStyle(
                                    colorNew: appColors.lightColor,
                                    fontWeightNew: FontWeight.w400,
                                    size: ResponsiveFlutter.of(context)
                                        .fontSize(1.5),
                                  ),
                                ),
                                FlutterSwitch(
                                  value: paymentNotification!,
                                  width: ResponsiveFlutter.of(context)
                                      .moderateScale(38),
                                  height: ResponsiveFlutter.of(context)
                                      .moderateScale(20),
                                  activeToggleColor: appColors.white,
                                  activeColor: Palette.blueSkyFy,
                                  inactiveToggleColor: appColors.white,
                                  toggleColor: appColors.switchColor,
                                  inactiveColor: !Constants.darkTheme
                                      ? appColors.darkGreyText
                                      : appColors.grey,
                                  toggleSize: ResponsiveFlutter.of(context)
                                      .moderateScale(12),
                                  onToggle: (val) {
                                    setState(() {
                                      paymentNotification = val;
                                    });
                                  },
                                ),
                              ],
                            ),
                            SizedBox(
                              height: ResponsiveFlutter.of(context)
                                  .moderateScale(15),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                MyTextView(
                                  Strings.liveNotification,
                                  textAligntNew: TextAlign.center,
                                  styleNew: MyTextStyle(
                                    colorNew: appColors.lightColor,
                                    fontWeightNew: FontWeight.w400,
                                    size: ResponsiveFlutter.of(context)
                                        .fontSize(1.5),
                                  ),
                                ),
                                FlutterSwitch(
                                  value: liveNotification!,
                                  width: ResponsiveFlutter.of(context)
                                      .moderateScale(38),
                                  height: ResponsiveFlutter.of(context)
                                      .moderateScale(20),
                                  activeToggleColor: appColors.white,
                                  activeColor: Palette.blueSkyFy,
                                  inactiveToggleColor: appColors.white,
                                  toggleColor: appColors.switchColor,
                                  inactiveColor: !Constants.darkTheme
                                      ? appColors.darkGreyText
                                      : appColors.grey,
                                  toggleSize: ResponsiveFlutter.of(context)
                                      .moderateScale(12),
                                  onToggle: (val) {
                                    setState(() {
                                      liveNotification = val;
                                    });
                                  },
                                ),
                              ],
                            ),
                            SizedBox(
                              height: ResponsiveFlutter.of(context)
                                  .moderateScale(15),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                MyTextView(
                                  Strings.invitationNotification,
                                  textAligntNew: TextAlign.center,
                                  styleNew: MyTextStyle(
                                    colorNew: appColors.lightColor,
                                    fontWeightNew: FontWeight.w400,
                                    size: ResponsiveFlutter.of(context)
                                        .fontSize(1.5),
                                  ),
                                ),
                                FlutterSwitch(
                                  value: invitationNotification!,
                                  width: ResponsiveFlutter.of(context)
                                      .moderateScale(38),
                                  height: ResponsiveFlutter.of(context)
                                      .moderateScale(20),
                                  activeToggleColor: appColors.white,
                                  activeColor: Palette.blueSkyFy,
                                  inactiveToggleColor: appColors.white,
                                  toggleColor: appColors.switchColor,
                                  inactiveColor: !Constants.darkTheme
                                      ? appColors.darkGreyText
                                      : appColors.grey,
                                  toggleSize: ResponsiveFlutter.of(context)
                                      .moderateScale(12),
                                  onToggle: (val) {
                                    setState(() {
                                      invitationNotification = val;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: ResponsiveFlutter.of(context).verticalScale(43),
                        width: ResponsiveFlutter.of(context).scale(43),
                        padding: EdgeInsets.symmetric(
                            vertical: ResponsiveFlutter.of(context)
                                .moderateScale(10)),
                        margin: EdgeInsets.only(
                            top: ResponsiveFlutter.of(context)
                                .moderateScale(10)),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: appColors.white,
                          border: Border.all(
                            color: appColors.appMediumColor,
                            width: ResponsiveFlutter.of(context).scale(2.5),
                          ),
                        ),
                        child: const Image(
                          image: AssetImage(ImagePath.notifications),
                        ),
                      ),
                    ],
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
