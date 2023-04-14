// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:skyfy/src/tools/constants.dart';
import 'package:skyfy/src/tools/profile/profile_colors.dart';
import 'package:skyfy/src/ui/screens/settings/widgets/settings_widgets.dart';

import '../../../../../main.dart';

//-------------------------------------------Form-------------------------------------------------------------------------
// EditText rounded Style
Padding editTextStyle(var hintText,
    {isPassword = true, TextEditingController? controller}) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
    child: TextFormField(
      style: const TextStyle(
          fontSize: textSizeLargeMedium, fontFamily: fontRegular),
      obscureText: isPassword,
      controller: controller,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(24, 18, 24, 18),
        hintText: hintText,
        filled: true,
        fillColor: appStore.isDarkModeOn ? cardDarkColor : white,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide:
                const BorderSide(color: profEditTextBackground, width: 0.0)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide:
              const BorderSide(color: profEditTextBackground, width: 0.0),
        ),
      ),
    ),
  );
}

// EditText
Padding editTextCard(var hintText) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
    child: TextFormField(
      style: const TextStyle(fontSize: 18),
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(24, 10, 24, 10),
          hintText: hintText),
    ),
  );
}

// Login/SignUp HeadingElement
Text formHeading(var label) {
  return Text(label,
      style: TextStyle(
          color: appStore.textPrimaryColor, fontSize: 30, fontFamily: 'Bold'),
      textAlign: TextAlign.center);
}

Text formSubHeadingForm(var label) {
  return Text(label,
      style: TextStyle(
          color: appStore.textSecondaryColor, fontSize: 20, fontFamily: 'Bold'),
      textAlign: TextAlign.center);
}

// Other Text
Text formLink(var label) {
  return Text(label,
      style: const TextStyle(color: profBlue, fontSize: 18),
      textAlign: TextAlign.center);
}

//-------------------------------------------Button-------------------------------------------------------------------------

SizedBox buttonStyle(var text) {
  return SizedBox(
    width: double.infinity,
    height: 60,
    child: MaterialButton(
      textColor: profWhite,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
      color: profColorPrimary,
      onPressed: () => {},
      child: Text(text, style: const TextStyle(fontSize: 18)),
    ),
  );
}

Widget shadowButton(String name) {
  return MaterialButton(
    height: 60,
    minWidth: double.infinity,
    textColor: profWhite,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
    color: profColorPrimary,
    onPressed: () => {},
    child: text(name,
        fontSize: textSizeLargeMedium,
        textColor: profWhite,
        fontFamily: fontMedium),
  );
}

//-------------------------------------------Other-------------------------------------------------------------------------
Row rowHeading(var label) {
  return Row(
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Text(label,
            style: TextStyle(
                color: appStore.textPrimaryColor,
                fontSize: 18,
                fontFamily: 'Bold'),
            textAlign: TextAlign.left),
      ),
    ],
  );
}

// ignore: non_constant_identifier_names
Text Heading(var label) {
  return Text(label,
      style: TextStyle(
          color: appStore.textPrimaryColor, fontSize: 18, fontFamily: 'Bold'),
      textAlign: TextAlign.left);
}

Row profileText(var label, {var maxline = 1}) {
  return Row(
    children: <Widget>[
      Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
          child: text(label,
              fontSize: textSizeLargeMedium,
              textColor: appStore.textPrimaryColor,
              maxLine: maxline)),
    ],
  );
}

Text profile(var label) {
  return Text(label,
      style: const TextStyle(
          color: profColorPrimary, fontSize: 18, fontFamily: 'Medium'),
      textAlign: TextAlign.center);
}

//-------------------------------------------View-------------------------------------------------------------------------
Divider view() {
  return const Divider(color: profViewColor, height: 0.5);
}
//-----------------------------------------------List------------------------------------------------------------

Text listHeading(var label) {
  return Text(label,
      style: TextStyle(
          color: appStore.textPrimaryColor, fontSize: 20, fontFamily: 'Bold'),
      textAlign: TextAlign.left);
}

Text listDesignationHeading(var label) {
  return Text(label,
      style: TextStyle(
          color: appStore.textPrimaryColor, fontSize: 16, fontFamily: 'Medium'),
      textAlign: TextAlign.left);
}

Text listOther(var label) {
  return Text(
    label,
    style: TextStyle(color: appStore.textSecondaryColor, fontSize: 16),
    textAlign: TextAlign.left,
  );
}

Text headerText(var text) {
  return Text(
    text,
    maxLines: 2,
    style: TextStyle(
        fontFamily: fontBold, fontSize: 22, color: appStore.textPrimaryColor),
  );
}

Text subHeadingText(var text) {
  return Text(text,
      style: TextStyle(
          fontFamily: fontBold,
          fontSize: 17.5,
          color: appStore.textSecondaryColor));
}

// ignore: must_be_immutable
class AppButton extends StatefulWidget {
  var textContent;
  VoidCallback onPressed;

  AppButton({super.key, required this.textContent, required this.onPressed});

  @override
  State<StatefulWidget> createState() {
    return AppButtonState();
  }
}

class AppButtonState extends State<AppButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        textStyle: const TextStyle(color: profWhite),
        elevation: 4,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
        padding: const EdgeInsets.all(0.0),
      ),
      onPressed: widget.onPressed,
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: <Color>[profColorPrimary, profColorPrimaryDark]),
          borderRadius: BorderRadius.all(Radius.circular(80.0)),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              widget.textContent,
              style: const TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class TopBar extends StatefulWidget {
  var titleName;

  TopBar(var this.titleName, {super.key});

  @override
  State<StatefulWidget> createState() {
    return TopBarState();
  }
}

class TopBarState extends State<TopBar> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 60,
        child: Row(
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                finish(context);
              },
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: Center(
                child: headerText(widget.titleName),
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget ring(String description) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(150.0),
          border: Border.all(width: 16.0, color: profColorPrimary),
        ),
      ),
      const SizedBox(height: 16),
      text(description,
          textColor: appStore.textPrimaryColor,
          fontSize: textSizeNormal,
          fontFamily: fontSemibold,
          isCentered: true,
          maxLine: 2)
    ],
  );
}

Widget shareIcon(String iconPath) {
  return Padding(
    padding: const EdgeInsets.only(left: 20, right: 20),
    child: Image.asset(iconPath, width: 28, height: 28, fit: BoxFit.fill),
  );
}
