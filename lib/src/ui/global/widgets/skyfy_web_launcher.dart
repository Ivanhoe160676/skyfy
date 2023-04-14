import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:skyfy/src/domain/models/app_model.dart';
import 'package:skyfy/src/tools/components/web_component.dart';

class SkyFyWebLauncher extends StatefulWidget {
  static String tag = '/SkyFyWebLauncher';

  const SkyFyWebLauncher({super.key});

  @override
  SkyFyWebLauncherState createState() => SkyFyWebLauncherState();
}

class SkyFyWebLauncherState extends State<SkyFyWebLauncher> {
  bool isHover = false;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<AppTheme>(
        builder: (_, snap) {
          if (snap.hasData) {
            return WebComponent(appTheme: snap.data!);
          }
          return snapWidgetHelper(snap);
        },
      ),
    );
  }
}
