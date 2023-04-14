// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:skyfy/main.dart';
import 'package:skyfy/src/domain/models/app_model.dart';
import 'package:skyfy/src/tools/app_colors.dart';
import 'package:skyfy/src/tools/theme_list_web.dart';

class SubMenuContentComponent extends StatelessWidget {
  ProTheme proTheme;

  SubMenuContentComponent({super.key, required this.proTheme});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(proTheme.name.validate(), style: boldTextStyle()),
        iconTheme: IconThemeData(color: context.iconColor),
        actions: [
          Switch(
            activeColor: appColorPrimary,
            value: appStore.isDarkModeOn,
            onChanged: (s) {
              appStore.toggleDarkMode(value: s);
            },
          ).withHeight(24)
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: ThemeListWeb(mainList: proTheme.subKits!),
      ),
    );
  }
}
