// ignore_for_file: library_private_types_in_public_api, must_be_immutable

import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:skyfy/main.dart';
import 'package:skyfy/src/domain/models/app_model.dart';
import 'package:skyfy/src/ui/screens/home/home2.dart';
import 'package:skyfy/src/tools/app_colors.dart';
import 'package:skyfy/src/tools/app_icons.dart';
import 'package:skyfy/src/tools/app_strings.dart';
import 'package:skyfy/src/tools/components/web_category_widget.dart';

class AppCategoryComponent extends StatefulWidget {
  final bool? isHover;
  AppTheme appTheme = AppTheme();

  AppCategoryComponent({super.key, this.isHover, required this.appTheme});

  @override
  _AppCategoryComponentState createState() => _AppCategoryComponentState();
}

class _AppCategoryComponentState extends State<AppCategoryComponent> {
  int selectedIndex = 8;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    afterBuildCreated(() {
      appStore.setWebListing(widget.appTheme.webApps!.subKits!);
    });
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 8,
      spacing: 16,
      children: [
        WebCategoryWidget(
          1,
          appCat5,
          appIcPhone,
          widget.appTheme.defaultTheme!.name,
          isHover: widget.isHover,
          type: widget.appTheme.defaultTheme!.type,
          onTap: (id) {
            webSelectedDrawerItem = id;

            push(const HomeScreen2(),
                pageRouteAnimation: PageRouteAnimation.Slide,
                duration: 300.milliseconds);
          },
        ),
        WebCategoryWidget(
          2,
          appCat4,
          appIcPhone,
          widget.appTheme.widgets!.name,
          isHover: widget.isHover,
          type: widget.appTheme.widgets!.type,
          onTap: (id) {
            webSelectedDrawerItem = id;

            appStore.setWebListing(widget.appTheme.widgets!.subKits!);
          },
        ),
        WebCategoryWidget(
          3,
          appCat1,
          appIcPhone,
          appLblFullApps,
          isHover: widget.isHover,
          type: widget.appTheme.fullApp!.type,
          onTap: (id) {
            webSelectedDrawerItem = id;

            appStore.setWebListing(widget.appTheme.fullApp!.subKits!);
          },
        ),
        WebCategoryWidget(
          4,
          appCat2,
          appDashboard,
          appLblDashboard,
          isHover: widget.isHover,
          type: widget.appTheme.dashboard!.type,
          onTap: (id) {
            webSelectedDrawerItem = id;

            appStore.setWebListing(widget.appTheme.dashboard!.subKits!);
          },
        ),
        WebCategoryWidget(
          5,
          appCat3,
          appIcPhone,
          appLblIntegrations,
          isNew: true,
          isHover: widget.isHover,
          onTap: (id) {
            webSelectedDrawerItem = id;

            appStore.setWebListing(widget.appTheme.integrations!.subKits!);
          },
        ),
        WebCategoryWidget(
          6,
          appCat1,
          appIcPhone,
          appLblThemeList,
          isHover: widget.isHover,
          onTap: (id) {
            webSelectedDrawerItem = id;

            appStore.setWebListing(widget.appTheme.themes!);
          },
        ),
        WebCategoryWidget(
          7,
          appCat4,
          appIcPhone,
          appLblScreenList,
          isHover: widget.isHover,
          onTap: (id) {
            webSelectedDrawerItem = id;

            appStore.setWebListing(widget.appTheme.screenList!);
          },
        ),
        WebCategoryWidget(
          8,
          appCat2,
          appIcPhone,
          appLblWeb,
          isHover: widget.isHover,
          isNew: true,
          onTap: (id) {
            webSelectedDrawerItem = id;

            appStore.setWebListing(widget.appTheme.webApps!.subKits!);
          },
        ),
      ],
    ).paddingTop(16);
  }
}
