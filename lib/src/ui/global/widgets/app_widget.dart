import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:skyfy/main.dart';

const applicationMaxWidth = 500.0;
Widget settingItem(context, String text,
    {Function? onTap,
    Widget? detail,
    Widget? leading,
    Color? textColor,
    int? textSize,
    double? padding}) {
  return InkWell(
    onTap: onTap as void Function()?,
    child: Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: padding ?? 8, bottom: padding ?? 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                  width: 30,
                  alignment: Alignment.center,
                  child: leading ?? const SizedBox()),
              leading != null ? 10.width : const SizedBox(),
              Text(text,
                      style: primaryTextStyle(
                          size: textSize ?? 18,
                          color: textColor ?? appStore.textPrimaryColor))
                  .expand(),
            ],
          ).expand(),
          detail ??
              Icon(Icons.arrow_forward_ios,
                  size: 16, color: appStore.textSecondaryColor),
        ],
      ).paddingOnly(left: 16, right: 16, top: 8, bottom: 8),
    ),
  );
}

BoxConstraints dynamicBoxConstraints({double? maxWidth}) {
  return BoxConstraints(maxWidth: maxWidth ?? applicationMaxWidth);
}

class ContainerX extends StatelessWidget {
  final Widget? mobile;
  final Widget? web;
  final bool? useFullWidth;

  const ContainerX({super.key, this.mobile, this.web, this.useFullWidth});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        if (constraints.device == DeviceSize.mobile) {
          return mobile ?? const SizedBox();
        } else {
          return Container(
            alignment: Alignment.topCenter,
            child: Container(
              constraints: useFullWidth.validate()
                  ? null
                  : dynamicBoxConstraints(maxWidth: context.width() * 0.9),
              child: web ?? const SizedBox(),
            ),
          );
        }
      },
    );
  }
}

double dynamicWidth(BuildContext context) {
  return isMobile ? context.width() : applicationMaxWidth;
}

Gradient defaultThemeGradient() {
  return const LinearGradient(
    colors: [
      Color(0xff5352fa),
      Color(0xff1b1c1c),
    ],
    tileMode: TileMode.mirror,
    begin: Alignment.topCenter,
    end: Alignment.bottomLeft,
  );
}

Widget dot() {
  return Container(
    height: 7,
    width: 7,
    decoration:
        const BoxDecoration(color: Colors.black12, shape: BoxShape.circle),
  );
}
