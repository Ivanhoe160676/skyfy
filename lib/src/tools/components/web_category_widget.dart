// ignore_for_file: must_be_immutable, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:skyfy/src/tools/app_colors.dart';
import 'package:skyfy/src/ui/screens/settings/widgets/settings_widgets.dart';

int webSelectedDrawerItem = 8;

class WebCategoryWidget extends StatelessWidget {
  int id;
  Color? color;
  String? img;
  String? name;
  bool? isNew;
  String? type;
  Function(int)? onTap;

  bool? isHover;

  WebCategoryWidget(this.id, this.color, this.img, this.name,
      {super.key,
      this.isNew = false,
      this.type = "N",
      this.onTap,
      this.isHover});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap!(id),
      child: Container(
        width: context.width(),
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: color!.withOpacity(0.2),
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(0),
            bottomLeft: const Radius.circular(0),
            topRight: Radius.circular(defaultRadius),
            bottomRight: Radius.circular(defaultRadius),
          ),
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.only(left: 16),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      border: Border.all(color: color!),
                      shape: BoxShape.circle,
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration:
                          BoxDecoration(shape: BoxShape.circle, color: color),
                      child: SvgPicture.asset(
                        img.validate(),
                        height: 24,
                        width: 24,
                        color: white,
                      ),
                    ),
                  ),
                  8.width,
                  AnimatedContainer(
                    duration: 1000.milliseconds,
                    curve: Curves.linearToEaseOut,
                    child: isHover.validate()
                        ? Text(name.validate(), style: boldTextStyle())
                        : const Offstage(),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: isNew.validate() ? 12 : 20,
              right: 16,
              child: webSelectedDrawerItem == id
                  ? Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.green),
                    )
                  : const Offstage(),
            ),
            Positioned(
              right: -5,
              top: -5,
              child: Container(
                alignment: Alignment.centerRight,
                margin: const EdgeInsets.only(right: 8, top: 8),
                padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
                decoration: boxDecoration(bgColor: appDarkRed, radius: 4),
                child: text(type.validate(),
                    fontSize: 8.0, textColor: Colors.white),
              ).visible(isNew.validate()),
            ),
          ],
        ),
      ),
    );
  }
}
