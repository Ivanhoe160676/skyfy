import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:skyfy/main.dart';
import 'package:skyfy/src/domain/models/app_model.dart';
import 'package:skyfy/src/tools/app_colors.dart';
import 'package:skyfy/src/tools/app_icons.dart';
import 'package:skyfy/src/tools/theme_list.dart';
import 'package:skyfy/src/ui/screens/settings/widgets/settings_widgets.dart';

class SkyFyScreenListing extends StatefulWidget {
  static String tag = "/SkyFyScreenListing";
  final ProTheme? proTheme;

  const SkyFyScreenListing(this.proTheme, {super.key});

  @override
  SkyFyScreenListingState createState() => SkyFyScreenListingState();
}

class SkyFyScreenListingState extends State<SkyFyScreenListing> {
  var selectedTab = 0;
  List<ProTheme> list = [];

  @override
  void initState() {
    super.initState();
    if (widget.proTheme!.subKits != null) {
      list.addAll(widget.proTheme!.subKits!);
    }

    afterBuildCreated(() {
      changeStatusColor(appStore.scaffoldBackground!);
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Scaffold(
        appBar: appBar(
          context,
          widget.proTheme!.name ?? widget.proTheme!.name!,
          iconColor: Theme.of(context).iconTheme.color,
          actions: [
            Tooltip(
              message: 'Dark Mode',
              child: Switch(
                value: appStore.isDarkModeOn,
                activeColor: appColorPrimary,
                onChanged: (s) {
                  appStore.toggleDarkMode(value: s);
                  setState(() {});
                },
              ),
            ),
          ],
        ),
        body: Stack(
          alignment: Alignment.center,
          fit: StackFit.expand,
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: 80),
              child: Column(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.all(16),
                    child: widget.proTheme!.showCover!
                        ? Image.asset(appBgCoverImage,
                            height: context.height() / 4)
                        : null,
                  ),
                  ThemeList(list),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
