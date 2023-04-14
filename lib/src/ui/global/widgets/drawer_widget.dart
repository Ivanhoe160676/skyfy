import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:skyfy/main.dart';
import 'package:skyfy/src/domain/models/list_model.dart';
import 'package:skyfy/src/tools/app_colors.dart';
import 'package:skyfy/src/ui/global/widgets/data_provider.dart';
import 'package:skyfy/src/ui/global/widgets/drawer_screen.dart';

class DrawerWidget extends StatefulWidget {
  static String tag = '/DrawerWidget';

  const DrawerWidget({super.key});

  @override
  DrawerWidgetState createState() => DrawerWidgetState();
}

class DrawerWidgetState extends State<DrawerWidget> {
  List<ListModel> drawerItems = getDrawerItems();
  var scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    if (appStore.selectedDrawerItem > 7) {
      await Future.delayed(const Duration(milliseconds: 300));
      scrollController.jumpTo(appStore.selectedDrawerItem * 27.0);

      setState(() {});
    }
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ClipPath(
        clipper: OvalRightBorderClipper(),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Drawer(
          child: Container(
            decoration: const BoxDecoration(
                gradient:
                    LinearGradient(begin: Alignment.centerLeft, colors: <Color>[
              Color(0xff5352fa),
              Color(0xff1b1c1c),
            ])),
            child: SingleChildScrollView(
              controller: scrollController,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  16.height,
                  Container(
                      padding:
                          const EdgeInsets.only(top: 20, right: 50, bottom: 20),
                      child: const Image(
                          image: AssetImage('assets/logos/logo9.png'))
                      //Text('Home', style: boldTextStyle(color: Colors.white)),
                      ),
                  const Divider(height: 16, color: viewLineColor),
                  ListView.builder(
                    itemBuilder: (context, index) {
                      return Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: appStore.selectedDrawerItem == index
                              ? appColorPrimary.withOpacity(0.3)
                              : context.scaffoldBackgroundColor,
                        ),
                        child: Text(
                          drawerItems[index].name!,
                          style: boldTextStyle(
                              color: appStore.selectedDrawerItem == index
                                  ? Colors.white
                                  : appStore.textPrimaryColor),
                        ),
                      ).onTap(() {
                        finish(context);
                        appStore.setDrawerItemIndex(index);

                        drawerItems[index].widget.launch(context);
                      });
                    },
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.only(top: 8, bottom: 8),
                    itemCount: drawerItems.length,
                    shrinkWrap: true,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
