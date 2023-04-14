// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:skyfy/src/tools/bnb/images.dart';
import 'package:skyfy/src/tools/bnb/strings.dart';
import 'package:skyfy/src/tools/search/airport_lookup.dart';
import 'package:skyfy/src/ui/screens/about/about_screen.dart';
import 'package:skyfy/src/ui/screens/emptylegs/emptylegs_screen.dart';
import 'package:skyfy/src/ui/screens/home/home_screen.dart';
import 'package:skyfy/src/ui/screens/profile/profile_screen.dart';
import 'package:skyfy/src/ui/screens/settings/settings_screen.dart';
import 'package:skyfy/src/ui/screens/settings/widgets/settings_widgets.dart';
import 'package:skyfy/src/ui/screens/skyfybnb/widgets/colors.dart';
import 'package:skyfy/src/ui/screens/skyfybnb/widgets/constant.dart';
import 'package:skyfy/src/ui/utils/palette.dart';

class SkyFyBottomNavigation extends StatefulWidget {
  final AirportLookup airportLookup;
  static String tag = '/SkyFyBottomNavigation';

  const SkyFyBottomNavigation({super.key, required this.airportLookup});

  @override
  SkyFyBottomNavigationState createState() => SkyFyBottomNavigationState();
}

class SkyFyBottomNavigationState extends State<SkyFyBottomNavigation> {
  final screens = [
    HomeScreen(
      airportLookup: AirportLookup(airports: []),
    ),
    const EmptyLegsScreen(),
    const AboutScreen(),
    const ProfileScreen(),
    const SettingScreen(),
  ];
  var isSelected = 0;

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
                  color: Palette.blueSkyFy,
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
                  color: isSelected == pos ? t6white : t6textColorSecondary,
                ),
                text(name,
                    textColor:
                        isSelected == pos ? t6white : t6textColorSecondary,
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
                    child: tabItem(0, homeSKF, homeSkyFy),
                  ),
                  Flexible(
                    flex: 1,
                    child: tabItem(1, emptyLegs, skyFyEmptyLegs),
                  ),
                  Flexible(
                    flex: 1,
                    child: tabItem(2, t6IcSleep, t6LblSleep),
                  ),
                  Flexible(
                    flex: 1,
                    child: tabItem(3, headProfile, profile),
                  ),
                  Flexible(
                    flex: 1,
                    child: tabItem(4, settings, skyFySettings),
                  ),
                ],
              ),
            ),
          ],
        ),
        body: screens[isSelected]);
  }
}
