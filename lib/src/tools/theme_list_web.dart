// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:skyfy/src/domain/models/app_model.dart';
import 'package:skyfy/src/tools/app_colors.dart';
import 'package:skyfy/src/tools/app_icons.dart';
import 'package:skyfy/src/tools/app_strings.dart';
import 'package:skyfy/src/tools/components/sub_menu_content_component.dart';
import 'package:skyfy/src/ui/screens/settings/widgets/settings_widgets.dart';

class ThemeListWeb extends StatefulWidget {
  final List<ProTheme> mainList;

  const ThemeListWeb({super.key, required this.mainList});

  @override
  _ThemeListWebState createState() => _ThemeListWebState();
}

class _ThemeListWebState extends State<ThemeListWeb> {
  List<ProTheme> data = [];

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    data.addAll(widget.mainList);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: AnimatedWrap(
        spacing: 16,
        runSpacing: 16,
        crossAxisAlignment: WrapCrossAlignment.start,
        alignment: WrapAlignment.start,
        itemCount: widget.mainList.length,
        itemBuilder: (_, index) {
          ProTheme data = widget.mainList[index];
          bool isNew =
              (data.type.validate().isNotEmpty && data.isWebSupported == true);

          return HoverWidget(
            builder: (_, hovering) => AnimatedContainer(
              duration: 200.milliseconds,
              decoration: boxDecorationDefault(
                  color: hovering ? appColorPrimary : context.cardColor),
              width: 265,
              padding: const EdgeInsets.all(12),
              //margin: EdgeInsets.only(right: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        margin: const EdgeInsets.only(right: 12),
                        padding: const EdgeInsets.all(12),
                        decoration: boxDecorationDefault(
                          color: webColors[index % webColors.length],
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset(icons[index % icons.length],
                            color: Colors.white),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data.name.validate(),
                            style: boldTextStyle(
                                size: 16,
                                color: hovering ? Colors.white : null),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          4.height,
                          Text(
                            data.titleName.validate(),
                            style: secondaryTextStyle(size: 12),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ).visible(data.titleName.isEmptyOrNull),
                        ],
                      ).expand()
                    ],
                  ),
                  8.height,
                  isNew
                      ? Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              alignment: Alignment.centerRight,
                              margin: const EdgeInsets.only(right: 8),
                              padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
                              decoration: data.type.validate().isNotEmpty
                                  ? boxDecoration(
                                      bgColor: appDarkRed, radius: 4)
                                  : const BoxDecoration(),
                              child: text(data.type.validate(),
                                  fontSize: 10.0, textColor: Colors.white),
                            ),
                            8.height,
                            data.isWebSupported.validate()
                                ? TextIcon(
                                    edgeInsets:
                                        const EdgeInsets.fromLTRB(2, 0, 8, 0),
                                    textStyle: boldTextStyle(
                                        size: 10,
                                        color: hovering
                                            ? Colors.white
                                            : Colors.green),
                                    onTap: null,
                                    text: "Web Supported",
                                    spacing: 0,
                                  )
                                : const Offstage(),
                          ],
                        )
                      : const Offstage(),
                ],
              ),
            ),
          ).onTap(() {
            if (data.subKits == null || data.subKits!.isEmpty) {
              //
              if (data.widget != null) {
                //
                if (data.isWebSupported.validate()) {
                  push(data.widget!,
                      pageRouteAnimation: PageRouteAnimation.Slide,
                      duration: 300.milliseconds);
                } else {
                  toasty(context, appComingSoon);
                }
              } else {
                toasty(context, appComingSoon);
              }
            } else {
              push(SubMenuContentComponent(proTheme: data),
                  pageRouteAnimation: PageRouteAnimation.Fade,
                  duration: 300.milliseconds);
            }
          }, borderRadius: radius(defaultRadius));
        },
      ),
    );
  }
}
