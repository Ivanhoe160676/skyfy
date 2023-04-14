import 'package:flutter/material.dart';

const profColorPrimary = Color(0XFFff8080);
const profColorPrimaryLight = Color(0XFFFFEEEE);
const profColorPrimaryDark = Color(0XFFff8080);
const profColorAccent = Color(0XFFff8080);

const profAppBackground = Color(0XFFf8f8f8);
const profViewColor = Color(0XFFDADADA);

const profSignInBackground = Color(0XFFDADADA);

const profWhite = Color(0XFFffffff);
const profIconColor = Color(0XFF747474);
const profSelectedTab = Color(0XFFFCE9E9);
const profRed = Color(0XFFF10202);
const profBlue = Color(0XFF1D36C0);
const profEditTextBackground = Color(0XFFE8E8E8);
const profShadow = Color(0X70E2E2E5);
var profTextColorPrimary = materialColor(0XFF212121);
const shadowColor = Color(0X95E9EBF0);
const profColorPrimaryLight2 = Color(0XFFFCE8E8);
const profBgBottomSheet = Color(0XFFFFF1F1);

Map<int, Color> color = {
  50: const Color.fromRGBO(136, 14, 79, .1),
  100: const Color.fromRGBO(136, 14, 79, .2),
  200: const Color.fromRGBO(136, 14, 79, .3),
  300: const Color.fromRGBO(136, 14, 79, .4),
  400: const Color.fromRGBO(136, 14, 79, .5),
  500: const Color.fromRGBO(136, 14, 79, .6),
  600: const Color.fromRGBO(136, 14, 79, .7),
  700: const Color.fromRGBO(136, 14, 79, .8),
  800: const Color.fromRGBO(136, 14, 79, .9),
  900: const Color.fromRGBO(136, 14, 79, 1),
};

MaterialColor materialColor(colorHax) {
  return MaterialColor(colorHax, color);
}

MaterialColor colorCustom = MaterialColor(0XFF5959fc, color);
