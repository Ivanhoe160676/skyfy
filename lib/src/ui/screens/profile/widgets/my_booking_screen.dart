// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:skyfy/src/domain/models/attend_model.dart';
import 'package:skyfy/src/ui/global/widgets/attendshared/app_colors.dart';
import 'package:skyfy/src/ui/global/widgets/attendshared/common_widget.dart';
import 'package:skyfy/src/ui/global/widgets/attendshared/image_path.dart';
import 'package:skyfy/src/ui/global/widgets/attendshared/responsive_flutter.dart';
import 'package:skyfy/src/ui/global/widgets/attendshared/strings.dart';
import 'package:skyfy/src/ui/utils/palette.dart';

class MyBookingScreen extends StatefulWidget {
  const MyBookingScreen({Key? key}) : super(key: key);
  @override
  _MyBookingScreenState createState() => _MyBookingScreenState();
}

class _MyBookingScreenState extends State<MyBookingScreen> {
  AppColors appColors = AppColors();
  List<CommonModel>? select = [
    CommonModel(isSelect: true),
    CommonModel(isSelect: false),
    CommonModel(isSelect: true),
    CommonModel(isSelect: false),
    CommonModel(isSelect: false),
    CommonModel(isSelect: true),
    CommonModel(isSelect: false),
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
              child: ListView.separated(
                itemCount: 7,
                padding: EdgeInsets.symmetric(
                  horizontal: ResponsiveFlutter.of(context).moderateScale(20),
                  vertical: ResponsiveFlutter.of(context).moderateScale(15),
                ),
                itemBuilder: (context, index) => Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      height: ResponsiveFlutter.of(context).moderateScale(200),
                      width: double.infinity,
                      margin: EdgeInsets.only(
                          bottom:
                              ResponsiveFlutter.of(context).moderateScale(40)),
                      padding: EdgeInsets.all(
                          ResponsiveFlutter.of(context).moderateScale(15)),
                      decoration: BoxDecoration(
                        color: appColors.btnColor,
                        borderRadius: BorderRadius.circular(
                          ResponsiveFlutter.of(context).moderateScale(20),
                        ),
                        image: const DecorationImage(
                          image: AssetImage(ImagePath.image_2),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      height: ResponsiveFlutter.of(context).moderateScale(100),
                      width: double.infinity,
                      margin: EdgeInsets.only(
                          bottom:
                              ResponsiveFlutter.of(context).moderateScale(40)),
                      padding: EdgeInsets.all(
                          ResponsiveFlutter.of(context).moderateScale(15)),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            ResponsiveFlutter.of(context).moderateScale(20)),
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            appColors.gradiantStartColor,
                            Colors.transparent,
                          ],
                          stops: const [0.05, 0.9],
                        ),
                      ),
                    ),
                    Positioned(
                      top: ResponsiveFlutter.of(context).moderateScale(10),
                      right: ResponsiveFlutter.of(context).moderateScale(-5),
                      child: GestureDetector(
                        onTap: () {
                          for (int i = 0; i <= select!.length - 1; i++) {
                            if (i == index) {
                              if (select![i].isSelect!) {
                                select![i].isSelect = false;
                              } else {
                                select![i].isSelect = true;
                              }
                            }
                          }
                          setState(() {});
                        },
                        child: Container(
                          height:
                              ResponsiveFlutter.of(context).moderateScale(40),
                          width:
                              ResponsiveFlutter.of(context).moderateScale(40),
                          margin: EdgeInsets.symmetric(
                              horizontal: ResponsiveFlutter.of(context)
                                  .moderateScale(15)),
                          decoration: BoxDecoration(
                            color: appColors.lightColor,
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage(select![index].isSelect!
                                  ? ImagePath.dislike
                                  : ImagePath.like),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: ResponsiveFlutter.of(context).moderateScale(80),
                      margin: EdgeInsets.symmetric(
                          horizontal:
                              ResponsiveFlutter.of(context).moderateScale(15)),
                      padding: EdgeInsets.symmetric(
                        horizontal:
                            ResponsiveFlutter.of(context).moderateScale(17),
                        vertical:
                            ResponsiveFlutter.of(context).moderateScale(15),
                      ),
                      decoration: BoxDecoration(
                        color: appColors.appLightColor,
                        borderRadius: BorderRadius.circular(
                          ResponsiveFlutter.of(context).moderateScale(15),
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MyTextView(
                                Strings.dummyText38,
                                textAligntNew: TextAlign.start,
                                maxLineWrap: true,
                                styleNew: MyTextStyle(
                                  colorNew: appColors.lightColor,
                                  fontWeightNew: FontWeight.w600,
                                  size: ResponsiveFlutter.of(context)
                                      .fontSize(2.5),
                                ),
                              ),
                              Row(
                                children: [
                                  Image.asset(
                                    ImagePath.calender,
                                    color: appColors.lightColor,
                                    height: ResponsiveFlutter.of(context)
                                        .moderateScale(15),
                                  ),
                                  SizedBox(
                                    width: ResponsiveFlutter.of(context)
                                        .moderateScale(6),
                                  ),
                                  MyTextView(
                                    Strings.dummyText22,
                                    textAligntNew: TextAlign.start,
                                    maxLineWrap: true,
                                    styleNew: MyTextStyle(
                                      colorNew: appColors.lightColor,
                                      fontWeightNew: FontWeight.w500,
                                      size: ResponsiveFlutter.of(context)
                                          .fontSize(1.5),
                                    ),
                                  ),
                                  SizedBox(
                                    width: ResponsiveFlutter.of(context)
                                        .moderateScale(10),
                                  ),
                                  Image.asset(
                                    ImagePath.time,
                                    color: appColors.lightColor,
                                    height: ResponsiveFlutter.of(context)
                                        .moderateScale(15),
                                  ),
                                  SizedBox(
                                    width: ResponsiveFlutter.of(context)
                                        .moderateScale(6),
                                  ),
                                  MyTextView(
                                    Strings.dummyText23,
                                    textAligntNew: TextAlign.start,
                                    maxLineWrap: true,
                                    styleNew: MyTextStyle(
                                      colorNew: appColors.lightColor,
                                      fontWeightNew: FontWeight.w500,
                                      size: ResponsiveFlutter.of(context)
                                          .fontSize(1.5),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => const ChatScreen(),
                              //   ),
                              // );
                            },
                            child: Container(
                              width: ResponsiveFlutter.of(context)
                                  .moderateScale(70),
                              height: ResponsiveFlutter.of(context)
                                  .moderateScale(35),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Palette.blueSkyFy,
                                borderRadius: BorderRadius.circular(
                                  ResponsiveFlutter.of(context)
                                      .moderateScale(20),
                                ),
                              ),
                              child: MyTextView(
                                Strings.chat,
                                textAligntNew: TextAlign.start,
                                maxLineWrap: true,
                                styleNew: MyTextStyle(
                                  colorNew: appColors.white,
                                  fontWeightNew: FontWeight.w600,
                                  size: ResponsiveFlutter.of(context)
                                      .fontSize(1.6),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                separatorBuilder: (context, index) => SizedBox(
                  height: ResponsiveFlutter.of(context).moderateScale(20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
