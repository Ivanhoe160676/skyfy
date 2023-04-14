import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:skyfy/src/ui/global/widgets/attendshared/common_widget.dart';
import 'package:skyfy/src/ui/global/widgets/attendshared/strings.dart';
import 'package:skyfy/src/ui/screens/settings/widgets/settings_widgets.dart';

class AboutScreen extends StatefulWidget {
  static String tag = '/AboutScreen';

  const AboutScreen({super.key});

  @override
  AboutScreenState createState() => AboutScreenState();
}

class AboutScreenState extends State<AboutScreen> {
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
      body: Column(
        children: [
          commonAppBar(
            title: Strings.aboutUs,
            backArrow: true,
            context: context,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
          ),
          Container(
            padding: const EdgeInsets.all(16),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: boxDecoration(showShadow: true),
                  child: Image.asset('assets/icon/app_icon.jpg', height: 150),
                ).cornerRadiusWithClipRRect(50),
                20.height,
                FutureBuilder<String>(
                  future: getPackageInfo()
                      .then((value) => value.versionName.validate()),
                  builder: (_, snap) {
                    if (snap.hasData) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Version:', style: secondaryTextStyle()),
                          5.width,
                          Text(snap.data!, style: primaryTextStyle(size: 18)),
                        ],
                      );
                    }
                    return const SizedBox();
                  },
                ),
                10.height,
                Text('Something',
                    style: primaryTextStyle(), textAlign: TextAlign.center),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
