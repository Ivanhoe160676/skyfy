import 'package:flutter/material.dart';

class DrawerListModel {
  Widget? leading;
  String? title;
  String? subTitle;
  Widget? trailing;
  IconData? icon;
  IconData? alternateIcon;
  Function? onTap;
  Color? colors;
  Widget? launchWidget;

  DrawerListModel(
      {this.leading,
      this.title,
      this.subTitle,
      this.colors,
      this.icon,
      this.alternateIcon,
      this.trailing,
      this.onTap,
      this.launchWidget});
}
