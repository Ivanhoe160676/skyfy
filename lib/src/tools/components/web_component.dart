// ignore_for_file: must_be_immutable, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:skyfy/main.dart';
import 'package:skyfy/src/domain/models/app_model.dart';
import 'package:skyfy/src/tools/components/app_category_component.dart';
import 'package:skyfy/src/tools/theme_list_web.dart';
import 'package:skyfy/src/tools/components/web_appbar_component.dart';

class WebComponent extends StatefulWidget {
  AppTheme appTheme = AppTheme();

  WebComponent({super.key, required this.appTheme});

  @override
  _WebComponentState createState() => _WebComponentState();
}

class _WebComponentState extends State<WebComponent> {
  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Observer(
          builder: (_) => AnimatedContainer(
            padding: const EdgeInsets.only(top: 96, left: 136),
            duration: 500.milliseconds,
            height: context.height(),
            curve: Curves.linearToEaseOut,
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: 40),
              child: ThemeListWeb(mainList: appStore.webListingList),
            ),
          ),
        ),
        Positioned(
          left: 0,
          top: 0,
          child: HoverWidget(
            builder: (context, isHovering) {
              return AnimatedContainer(
                duration: 500.milliseconds,
                width: isHovering ? 240 : 100,
                curve: Curves.linearToEaseOut,
                padding: const EdgeInsets.only(right: 16),
                decoration: boxDecorationDefault(
                    boxShadow: defaultBoxShadow(),
                    color: appStore.isDarkModeOn
                        ? context.scaffoldBackgroundColor
                        : white),
                child: Container(
                  padding: const EdgeInsets.only(top: 60),
                  height: context.height(),
                  child: AppCategoryComponent(
                      isHover: isHovering, appTheme: widget.appTheme),
                ),
              );
            },
          ),
        ),
        const WebAppBarComponent(),
      ],
    );
  }
}
