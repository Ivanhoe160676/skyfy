// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:skyfy/main.dart';
import 'package:skyfy/src/domain/models/app_model.dart';
import 'package:skyfy/src/tools/app_colors.dart';
import 'package:skyfy/src/tools/app_icons.dart';
import 'package:skyfy/src/tools/app_scroll_behavior.dart';
import 'package:skyfy/src/tools/app_strings.dart';
import 'package:skyfy/src/tools/theme_list.dart';
import 'package:skyfy/src/ui/screens/home/home2.dart';
import 'package:skyfy/src/ui/screens/settings/settings_screen.dart';
import 'package:skyfy/src/ui/screens/settings/widgets/settings_widgets.dart';

class SkyFyLauncher extends StatefulWidget {
  static String tag = '/prokit_launcher';
  static String workingAppsTag = '/working_apps';
  static String integrationTag = '/integrations';
  static String fullAppsTag = '/full_apps';
  static String widgetsTag = '/widgets';
  static String dashboardTag = '/dashboards';
  static String chartsTag = '/charts';
  final String? route;

  const SkyFyLauncher({super.key, this.route});

  @override
  SkyFyLauncherState createState() => SkyFyLauncherState();
}

class SkyFyLauncherState extends State<SkyFyLauncher>
    with TickerProviderStateMixin {
  final PageController _controller =
      PageController(initialPage: 0, keepPage: false);
  var selectedTab = 0;
  Future<AppTheme>? future;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget tabItem(String name, int pos,
        {var isRight = false, bool isNew = false}) {
      return GestureDetector(
        onTap: () {
          setState(() {
            _controller.jumpToPage(pos);
            selectedTab = pos;
          });
        },
        child: Stack(
          children: [
            Container(
              alignment: Alignment.center,
              height: 50,
              decoration: selectedTab == pos
                  ? BoxDecoration(
                      color: appColorPrimary.withOpacity(0.1),
                      borderRadius: isRight
                          ? const BorderRadius.only(
                              topLeft: Radius.circular(16))
                          : const BorderRadius.only(
                              topRight: Radius.circular(16)))
                  : const BoxDecoration(),
              child: Text(name,
                  style: boldTextStyle(
                      color: selectedTab == pos
                          ? appColorPrimary
                          : textSecondaryColorGlobal,
                      size: 18)),
            ),
            Positioned(
              right: 20,
              top: 0,
              bottom: 0,
              child: Container(
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                    color: appDarkRed, shape: BoxShape.circle),
                //decoration: boxDecoration(bgColor: appDarkRed, radius: 4),
              ),
            ).visible(isNew.validate()),
          ],
        ),
      );
    }

    Widget category(Color color, String img, String? name,
        {bool isNew = false,
        String? type = 'New',
        required Function onTap,
        int? appCount}) {
      return Container(
        width: 145,
        height: 100,
        margin: const EdgeInsets.only(right: 16),
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            Container(
              width: 145,
              height: 100,
              decoration: boxDecorationDefault(color: color),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SvgPicture.asset(img,
                      width: 40, height: 40, color: Colors.white),
                  4.height,
                  Text('${appCount != null ? '$appCount ' : ''}$name',
                      style: boldTextStyle(color: Colors.white),
                      maxLines: 2,
                      textAlign: TextAlign.center),
                ],
              ),
            ),
            if (isNew)
              Positioned(
                right: -5,
                top: -5,
                child: Container(
                  alignment: Alignment.centerRight,
                  margin: const EdgeInsets.only(right: 8, top: 8),
                  padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
                  decoration:
                      boxDecorationDefault(color: appDarkRed, boxShadow: []),
                  child: FittedBox(
                      child: text(type.validate(),
                          fontSize: 8.0, textColor: Colors.white)),
                ),
              ),
          ],
        ).onTap(() => onTap(), borderRadius: radius()),
      );
    }

    return Scaffold(
      backgroundColor: context.scaffoldBackgroundColor,
      body: FutureBuilder<AppTheme>(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SafeArea(
              child: NestedScrollView(
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) {
                  return [
                    SliverAppBar(
                      expandedHeight: 230.0,
                      floating: false,
                      backgroundColor: context.scaffoldBackgroundColor,
                      forceElevated: innerBoxIsScrolled,
                      pinned: true,
                      automaticallyImplyLeading: false,
                      elevation: 0.5,
                      actions: [
                        IconButton(
                          icon: Icon(Icons.settings,
                              color: appStore.backgroundColor),
                          onPressed: () {
                            const SettingScreen().launch(context);
                          },
                        )
                      ],
                      title: innerBoxIsScrolled
                          ? Text('SkyFy', style: boldTextStyle(size: 24))
                          : null,
                      bottom: innerBoxIsScrolled
                          ? PreferredSize(
                              preferredSize: Size(context.width(), 80),
                              child: Container(
                                height: 80,
                                padding:
                                    const EdgeInsets.only(left: 16, right: 16),
                                margin: const EdgeInsets.only(left: 8),
                                alignment: Alignment.centerLeft,
                                child: Row(
                                  children: [
                                    Container(
                                      width: 80,
                                      height: 60,
                                      margin: const EdgeInsets.only(right: 12),
                                      padding: const EdgeInsets.all(16),
                                      decoration:
                                          boxDecorationDefault(color: appCat5),
                                      child: Image.asset(icons[0],
                                          color: Colors.white),
                                    ),
                                    Expanded(
                                      child: Stack(
                                        alignment: Alignment.centerRight,
                                        children: <Widget>[
                                          Container(
                                            width: context.width(),
                                            height: 60,
                                            padding: const EdgeInsets.only(
                                                left: 16, right: 16),
                                            margin: EdgeInsets.only(
                                                right: context.width() / 28),
                                            decoration: boxDecorationDefault(
                                                color: context
                                                    .scaffoldBackgroundColor),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    Text('Default Theme',
                                                        style: boldTextStyle(),
                                                        maxLines: 2),
                                                  ],
                                                ).expand(),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            width: 30,
                                            height: 30,
                                            decoration: boxDecorationDefault(
                                                color: appCat5,
                                                shape: BoxShape.circle),
                                            child: const Icon(
                                                Icons.keyboard_arrow_right,
                                                color: Colors.white),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ).onTap(() {
                                const HomeScreen2().launch(context);
                              }),
                            )
                          : null,
                      flexibleSpace: FlexibleSpaceBar(
                        collapseMode: CollapseMode.parallax,
                        background: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('SkyFy', style: boldTextStyle(size: 30))
                                .paddingOnly(top: 16, left: 16, right: 16),
                            const SizedBox(height: 16),
                            ScrollConfiguration(
                              behavior: AppScrollBehavior(),
                              child: SingleChildScrollView(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 8),
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    category(appCat5, appIcPhone,
                                        snapshot.data!.defaultTheme!.name,
                                        type: snapshot.data!.defaultTheme!.tag,
                                        onTap: () {
                                      const HomeScreen2().launch(context);
                                    }),
                                    category(appCat6, appIcPhone,
                                        snapshot.data!.workingApps!.name,
                                        isNew: true,
                                        type: snapshot.data!.workingApps!.tag,
                                        onTap: () {
                                      const HomeScreen2().launch(context);
                                    }),
                                    category(appCat4, appIcPhone,
                                        snapshot.data!.widgets!.name,
                                        isNew: false,
                                        type: snapshot.data!.widgets!.tag,
                                        onTap: () {
                                      const HomeScreen2().launch(context);
                                    }),
                                    category(appCat1, appIcPhone,
                                        snapshot.data!.fullApp!.name,
                                        isNew: true,
                                        type: snapshot.data!.fullApp!.tag,
                                        onTap: () {
                                      const HomeScreen2().launch(context);
                                    },
                                        appCount: snapshot
                                            .data!.fullApp!.subKits!.length),
                                    category(appCat2, appDashboard,
                                        snapshot.data!.dashboard!.name,
                                        isNew: true,
                                        type: snapshot.data!.dashboard!.tag,
                                        onTap: () {
                                      const HomeScreen2().launch(context);
                                    },
                                        appCount: snapshot
                                            .data!.dashboard!.subKits!.length),
                                    category(
                                        appCat3, appIcPhone, appLblIntegrations,
                                        onTap: () {
                                      const HomeScreen2().launch(context);
                                    }, isNew: false),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ];
                },
                body: Container(
                  margin: const EdgeInsets.only(top: 8),
                  width: context.width(),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          tabItem(appLblThemeList, 0, isNew: false).expand(),
                          tabItem(appLblScreenList, 1,
                                  isRight: true, isNew: false)
                              .expand(),
                        ],
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.only(top: 16),
                          height: double.maxFinite,
                          child: PageView(
                            pageSnapping: false,
                            scrollBehavior: AppScrollBehavior(),
                            onPageChanged: (value) {
                              selectedTab = value;
                              setState(() {});
                            },
                            controller: _controller,
                            physics: const NeverScrollableScrollPhysics(),
                            children: <Widget>[
                              if (isMobile)
                                SingleChildScrollView(
                                  physics: const NeverScrollableScrollPhysics(),
                                  child: ThemeList(snapshot.data!.themes!),
                                )
                              else
                                ThemeList(snapshot.data!.themes!),
                              if (isMobile)
                                SingleChildScrollView(
                                  physics: const NeverScrollableScrollPhysics(),
                                  child: ThemeList(snapshot.data!.screenList!),
                                )
                              else
                                ThemeList(snapshot.data!.screenList!),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString(), style: primaryTextStyle());
          }
          return const CircularProgressIndicator().center();
        },
      ),
    );
  }
}
