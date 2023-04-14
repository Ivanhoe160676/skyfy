// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:skyfy/src/tools/bnb/colors.dart';
import 'package:skyfy/src/tools/bnb/constant.dart';
import 'package:skyfy/src/tools/bnb/strings.dart';
import 'package:skyfy/src/tools/bnb/widget.dart';
import 'package:skyfy/src/ui/screens/settings/widgets/settings_widgets.dart';
import 'package:skyfy/src/ui/screens/skyfybnb/widgets/images.dart';

class BottomNavigation extends StatefulWidget {
  static String tag = '/BottomNavigation';

  const BottomNavigation({super.key});

  @override
  BottomNavigationState createState() => BottomNavigationState();
}

class BottomNavigationState extends State<BottomNavigation> {
  var isSelected = 1;

  Widget tabItem(var pos, var icon, var name) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = pos;
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          alignment: Alignment.center,
          decoration: isSelected == pos
              ? BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: skfColorPrimary,
                  borderRadius: BorderRadius.circular(8))
              : const BoxDecoration(),
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Column(
              children: <Widget>[
                SvgPicture.asset(
                  icon,
                  width: 20,
                  height: 20,
                  color: isSelected == pos ? skfWhite : skfTextColorSecondary,
                ),
                text(name,
                    textColor:
                        isSelected == pos ? skfWhite : skfTextColorSecondary,
                    fontSize: textSizeSmall)
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.scaffoldBackgroundColor,
      bottomNavigationBar: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.all(16),
            height: 70,
            decoration: BoxDecoration(
              color: context.scaffoldBackgroundColor,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  color: shadowColorGlobal,
                  blurRadius: 10,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Flexible(
                  flex: 1,
                  child: tabItem(1, t6IcActivity, t6LblActivity),
                ),
                Flexible(
                  flex: 1,
                  child: tabItem(2, t6IcList, t6LblHealth),
                ),
                Flexible(
                  flex: 1,
                  child: tabItem(3, t6IcMeal, headProfile),
                ),
                Flexible(
                  flex: 1,
                  child: tabItem(4, profile, headProfile),
                ),
                Flexible(
                  flex: 1,
                  child: tabItem(5, t6IcSleep, t6LblSleep),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          Container(
            width: 180,
            alignment: Alignment.center,
            child: ring(t6LblWelcomeToBottomNNavigationBar),
          ),
          TopBar(
            titleName: t6LblBottomNavigation,
          ),
        ],
      ),
    );
  }
}
