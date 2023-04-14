import 'package:flutter/material.dart';

const t1ColorPrimary = Color(0XFFff8080);
const t1ColorPrimaryLight = Color(0XFFFFEEEE);
const t1ColorPrimaryDark = Color(0XFFff8080);
const t1ColorAccent = Color(0XFFff8080);

const t1AppBackground = Color(0XFFf8f8f8);
const t1ViewColor = Color(0XFFDADADA);

const t1SignInBackground = Color(0XFFDADADA);

const t1White = Color(0XFFffffff);
const t1IconColor = Color(0XFF747474);
const t1SelectedTab = Color(0XFFFCE9E9);
const t1Red = Color(0XFFF10202);
const t1Blue = Color(0XFF1D36C0);
const t1EditTextBackground = Color(0XFFE8E8E8);
const t1Shadow = Color(0X70E2E2E5);

var t1TextColorPrimary = materialColor(0XFF212121);
const shadowColor = Color(0X95E9EBF0);
const t1BgBottomSheet = Color(0XFFFFF1F1);

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
