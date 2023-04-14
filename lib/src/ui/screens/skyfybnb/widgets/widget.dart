// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:skyfy/main.dart';
import 'package:skyfy/src/tools/circular_percent_indicator.dart';
import 'package:skyfy/src/ui/screens/settings/widgets/settings_widgets.dart';
import 'package:skyfy/src/ui/screens/skyfybnb/widgets/colors.dart';

import 'constant.dart';

// ignore: must_be_immutable
class BnbButton extends StatefulWidget {
  var textContent;
  VoidCallback onPressed;
  var isStroked = false;

  BnbButton({
    super.key,
    required this.textContent,
    required this.onPressed,
    this.isStroked = false,
  });

  @override
  BnbButtonState createState() => BnbButtonState();
}

class BnbButtonState extends State<BnbButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: Container(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
        alignment: Alignment.center,
        decoration: widget.isStroked
            ? boxDecoration(bgColor: Colors.transparent, color: t6colorPrimary)
            : boxDecoration(bgColor: t6colorPrimary, radius: 12),
        child: text(widget.textContent,
            textColor: widget.isStroked ? t6colorPrimary : t6white,
            isCentered: true,
            fontFamily: fontMedium,
            textAllCaps: true),
      ),
    );
  }
}

// ignore: non_constant_identifier_names
Container T6EditTextStyle(var hintText, {isPassword = false}) {
  return Container(
    decoration: boxDecoration(radius: 12, showShadow: true, bgColor: t6white),
    child: TextFormField(
      style: const TextStyle(fontSize: textSizeMedium, fontFamily: fontRegular),
      obscureText: isPassword,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(26, 18, 4, 18),
        hintText: hintText,
        filled: true,
        fillColor: t6white,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: t6white, width: 0.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: t6white, width: 0.0),
        ),
      ),
    ),
  );
}

Column circleProgressDashboard(var text, var text1, var text2, var per) {
  return Column(
    children: <Widget>[
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            text1,
            style: const TextStyle(
                color: t6colorPrimary, fontSize: textSizeSMedium),
          ),
          const SizedBox(
            width: 26,
          ),
          Text(
            text2,
            style: const TextStyle(color: t6white, fontSize: textSizeSMedium),
          ),
        ],
      ),
      const SizedBox(
        height: 8,
      ),
      CircularPercentIndicator(
        radius: 100.0,
        lineWidth: 6.0,
        animation: true,
        percent: per,
        backgroundColor: t6white,
        circularStrokeCap: CircularStrokeCap.round,
        center: Text(
          text,
          style: const TextStyle(fontSize: 20.0),
        ),
        progressColor: t6colorPrimary,
      )
    ],
  );
}

TextFormField editTextStyle(var hintText, {isPassword = true}) {
  return TextFormField(
    style:
        const TextStyle(fontSize: textSizeLargeMedium, fontFamily: fontRegular),
    obscureText: isPassword,
    decoration: InputDecoration(
      contentPadding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
      hintText: hintText,
      hintStyle: const TextStyle(color: t6textColorSecondary),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(color: t6viewColor, width: 0.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(color: t6viewColor, width: 0.0),
      ),
    ),
  );
}

// ignore: must_be_immutable
class TopBar extends StatefulWidget {
  var titleName;

  TopBar({super.key, var this.titleName = ""});

  @override
  State<StatefulWidget> createState() {
    return TopBarState();
  }
}

class TopBarState extends State<TopBar> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: appStore.appBarColor,
        width: MediaQuery.of(context).size.width,
        height: 50,
        child: Stack(
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.keyboard_arrow_left, size: 30),
              onPressed: () {
                finish(context);
              },
            ),
            Center(
                child: text(widget.titleName,
                    textColor: appStore.textPrimaryColor,
                    fontSize: textSizeLargeMedium,
                    fontFamily: fontBold))
          ],
        ),
      ),
    );
  }
}

Widget shareIcon(String iconPath) {
  return Padding(
    padding: const EdgeInsets.only(left: 20, right: 20),
    child: Image.asset(iconPath, width: 28, height: 28, fit: BoxFit.fill),
  );
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
          border: Border.all(
            width: 16.0,
            color: t6colorPrimary,
          ),
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

class Slider extends StatelessWidget {
  final String file;

  const Slider({Key? key, required this.file}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
      child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 0,
        margin: const EdgeInsets.all(0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Image.asset(file, fit: BoxFit.fill),
      ),
    );
  }
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
