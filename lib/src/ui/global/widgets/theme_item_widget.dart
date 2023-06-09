import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:skyfy/main.dart';
import 'package:skyfy/src/domain/models/app_model.dart';
import 'package:skyfy/src/tools/app_colors.dart';
import 'package:skyfy/src/tools/app_icons.dart';
import 'package:skyfy/src/tools/app_strings.dart';
import 'package:skyfy/src/tools/skyfy_screen_listing.dart';

List<Color> colors = [appCat1, appCat2, appCat3];

class ThemeItemWidget extends StatelessWidget {
  final int index;
  final ProTheme data;

  const ThemeItemWidget(this.index, this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (appStore.isDarkModeOn) {
          appStore.toggleDarkMode(value: data.darkThemeSupported.validate());
        }

        if (data.subKits == null || data.subKits!.isEmpty) {
          if (data.widget != null) {
            log('Tag ${data.widget!.key}');

            data.widget.launch(context);
          } else {
            toasty(context, appComingSoon);
          }
        } else {
          SkyFyScreenListing(data).launch(context);
        }
      },
      child: Container(
        margin: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
        child: Row(
          children: <Widget>[
            Container(
              width: 80,
              height: 80,
              margin: const EdgeInsets.only(right: 12),
              padding: const EdgeInsets.all(16),
              decoration:
                  boxDecorationDefault(color: colors[index % colors.length]),
              child:
                  Image.asset(icons[index % icons.length], color: Colors.white),
            ),
            Expanded(
              child: Stack(
                alignment: Alignment.centerRight,
                children: <Widget>[
                  Container(
                    width: context.width(),
                    height: 80,
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    margin: EdgeInsets.only(right: context.width() / 28),
                    decoration: boxDecorationDefault(color: context.cardColor),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(data.name.validate(),
                                style: boldTextStyle(), maxLines: 2),
                            Text(
                              data.titleName.validate(),
                              style: secondaryTextStyle(),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ).visible(data.titleName.validate().isNotEmpty),
                          ],
                        ).expand(),
                        Container(
                          //height: 25,
                          margin: const EdgeInsets.only(right: 8),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 2),
                          decoration: data.tag.validate().isNotEmpty
                              ? boxDecorationDefault(color: appDarkRed)
                              : const BoxDecoration(),
                          child: Text(data.tag.validate(),
                              style: primaryTextStyle(color: white, size: 12)),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 30,
                    height: 30,
                    decoration: boxDecorationDefault(
                        color: colors[index % colors.length],
                        shape: BoxShape.circle),
                    child: const Icon(Icons.keyboard_arrow_right,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
