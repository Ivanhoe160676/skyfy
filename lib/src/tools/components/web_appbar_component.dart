import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:skyfy/src/tools/app_colors.dart';

class WebAppBarComponent extends StatelessWidget {
  const WebAppBarComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: 100.milliseconds,
      decoration: boxDecorationDefault(
        color: context.cardColor,
        borderRadius: radius(0),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Row(
        children: [
          Text(
            'SkyFy Web',
            style: boldTextStyle(size: 20),
          ).expand(),
          //SocialMediaWidgetComponent(),
          8.width,
          IconButton(
            icon: const Icon(
              Icons.settings,
              color: appColorPrimary,
            ),
            onPressed: () {
              // WebSettingScreen().launch(context);
            },
          ),
        ],
      ),
    );
  }
}
