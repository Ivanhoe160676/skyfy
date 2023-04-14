// ignore_for_file: deprecated_member_use, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:skyfy/main.dart';
import 'package:skyfy/src/tools/app_colors.dart';
import 'package:skyfy/src/tools/constants.dart';
import 'package:skyfy/src/ui/screens/settings/widgets/settings_colors.dart';
import 'package:skyfy/src/ui/utils/palette.dart';

Widget text(
  String? text, {
  var fontSize = textSizeLargeMedium,
  Color? textColor,
  var fontFamily,
  var isCentered = false,
  var maxLine = 1,
  var latterSpacing = 0.5,
  bool textAllCaps = false,
  var isLongText = false,
  bool lineThrough = false,
}) {
  return Text(
    textAllCaps ? text!.toUpperCase() : text!,
    textAlign: isCentered ? TextAlign.center : TextAlign.start,
    maxLines: isLongText ? null : maxLine,
    overflow: TextOverflow.ellipsis,
    style: TextStyle(
      fontFamily: fontFamily,
      fontSize: fontSize,
      color: textColor ?? appStore.textSecondaryColor,
      height: 1.5,
      letterSpacing: latterSpacing,
      decoration:
          lineThrough ? TextDecoration.lineThrough : TextDecoration.none,
    ),
  );
}

Padding settingText(
  var text,
) {
  return Padding(
    padding: const EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 8),
    child: Text(
      text,
      style: TextStyle(
        fontFamily: fontRegular,
        color: appStore.textPrimaryColor,
        fontSize: textSizeMedium,
      ),
    ),
  );
}

AppBar appBar(BuildContext context, String title,
    {final bool isDashboard = false,
    List<Widget>? actions,
    bool showBack = true,
    Color? color,
    Color? iconColor,
    Color? textColor,
    double? elevation}) {
  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: color ?? Palette.blueSkyFy,
    leading: showBack
        ? IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back, color: Colors.white),
          )
        : null,
    title:
        appBarTitleWidget(context, title, textColor: textColor, color: color),
    actions: actions,
    elevation: elevation ?? 0.5,
  );
}

Widget appBarTitleWidget(context, String title,
    {Color? color, Color? textColor}) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 60,
    color: color ?? appStore.appBarColor,
    child: Row(
      children: <Widget>[
        Text(
          title,
          style: boldTextStyle(color: Colors.white, size: 20),
          maxLines: 1,
        ).expand(),
      ],
    ),
  );
}

void changeStatusColor(Color color) async {
  setStatusBarColor(color);
}

BoxDecoration boxDecoration(
    {double radius = 2,
    Color color = Colors.transparent,
    Color? bgColor,
    var showShadow = false}) {
  return BoxDecoration(
    color: bgColor ?? appStore.scaffoldBackground,
    boxShadow: showShadow
        ? defaultBoxShadow(shadowColor: shadowColorGlobal)
        : [const BoxShadow(color: Colors.transparent)],
    border: Border.all(color: color),
    borderRadius: BorderRadius.all(Radius.circular(radius)),
  );
}

class CustomTheme extends StatelessWidget {
  final Widget? child;

  const CustomTheme({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: appStore.isDarkModeOn
          ? ThemeData.dark().copyWith(
              accentColor: appColorPrimary,
              backgroundColor: context.scaffoldBackgroundColor,
            )
          : ThemeData.light(),
      child: child!,
    );
  }
}

TextFormField d8EditTextStyle(var hintText, {isPassword = true}) {
  return TextFormField(
    style: TextStyle(
        color: appStore.textPrimaryColor,
        fontSize: textSizeMedium,
        fontFamily: fontRegular),
    obscureText: isPassword,
    cursorColor: appStore.textPrimaryColor,
    decoration: InputDecoration(
      contentPadding: const EdgeInsets.fromLTRB(16, 22, 16, 22),
      hintText: hintText,
      border: InputBorder.none,
      hintStyle: const TextStyle(color: setTextColorSecondary),
    ),
  );
}

Divider d8Divider() {
  return Divider(
    height: 1,
    color: appStore.textSecondaryColor,
    thickness: 1,
  );
}

// ignore: must_be_immutable
class T8Button extends StatefulWidget {
  var textContent;

  //   var icon;
  VoidCallback onPressed;

  T8Button({
    super.key,
    required this.textContent,
    required this.onPressed,
    //   @required this.icon,
  });

  @override
  T8ButtonState createState() => T8ButtonState();
}

class T8ButtonState extends State<T8Button> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: Container(
          decoration: boxDecoration(bgColor: setColorPrimary, radius: 16),
          padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Center(
                child: text(widget.textContent,
                    textColor: setWhite,
                    fontFamily: fontMedium,
                    textAllCaps: false),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: setColorPrimaryDark),
                  width: 35,
                  height: 35,
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.arrow_forward,
                      color: setWhite,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}

// ignore: must_be_immutable, camel_case_types
class t8TopBar extends StatefulWidget {
  var titleName;

  t8TopBar(var this.titleName, {super.key});

  @override
  State<StatefulWidget> createState() {
    return t8TopBarState();
  }
}

// ignore: camel_case_types
class t8TopBarState extends State<t8TopBar> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 60,
        color: appStore.appBarColor,
        child: Row(
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.arrow_back),
              color: setColorPrimary,
              onPressed: () {
                finish(context);
              },
            ),
            Center(
              child: Text(
                widget.titleName,
                maxLines: 2,
                style: const TextStyle(
                    fontFamily: fontBold,
                    fontSize: 22,
                    color: setTextColorPrimary),
              ),
            )
          ],
        ),
      ),
    );
  }

  State<StatefulWidget>? createState() {
    return null;
  }
}

Container t8HeaderText(var text) {
  return Container(
    margin: const EdgeInsets.only(top: 16),
    child: Text(
      text,
      maxLines: 2,
      style: TextStyle(
          fontFamily: fontBold, fontSize: 22, color: appStore.textPrimaryColor),
    ),
  );
}
