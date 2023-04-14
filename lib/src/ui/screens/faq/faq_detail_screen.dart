// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:skyfy/src/tools/app_colors.dart';
import 'package:skyfy/src/tools/constants.dart';
import 'package:skyfy/src/ui/global/widgets/app_widget.dart';
import 'package:skyfy/src/ui/global/widgets/drawer_widget.dart';
import 'package:skyfy/src/ui/screens/settings/widgets/settings_widgets.dart';

class FAQDetailScreen extends StatefulWidget {
  static String tag = '/FAQDetailScreen';

  const FAQDetailScreen({super.key});

  @override
  _FAQDetailScreenState createState() => _FAQDetailScreenState();
}

class _FAQDetailScreenState extends State<FAQDetailScreen> {
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
    return SafeArea(
      child: Scaffold(
        appBar: appBar(context, 'Question # 2?'),
        drawer: const DrawerWidget(),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Hosting',
                  style: secondaryTextStyle(color: appColorPrimary, size: 12)),
              4.height,
              Text('Question # 1 ?',
                  style: boldTextStyle(size: 24), maxLines: 2),
              8.height,
              Text(skyFyShortText, style: primaryTextStyle(size: 14)),
              16.height,
              FadeInImage(
                placeholder: Image.asset('assets/images/placeholder.jpg',
                        fit: BoxFit.cover)
                    .image,
                image: Image.asset(sampleImageUrl3).image,
                height: isMobile ? 200 : 300,
                width: context.width(),
                fit: BoxFit.cover,
              ).cornerRadiusWithClipRRect(5),
              16.height,
              Text(skyFyShortText, style: primaryTextStyle(size: 14)),
              20.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  dot(),
                  16.width,
                  dot(),
                  16.width,
                  dot(),
                ],
              ),
              20.height,
              Text('was this answer helpful ?', style: secondaryTextStyle()),
              8.height,
              Row(
                children: [
                  Container(
                    width: 100,
                    padding: const EdgeInsets.only(
                        top: 6, bottom: 6, left: 16, right: 16),
                    decoration: BoxDecoration(
                        color: Colors.green.withOpacity(0.7),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(30)),
                        border: Border.all(color: Colors.black12, width: 0.5)),
                    child: Text('Yes',
                        style: primaryTextStyle(size: 14, color: white),
                        textAlign: TextAlign.center),
                  ),
                  8.width,
                  Container(
                    width: 100,
                    padding: const EdgeInsets.only(
                        top: 6, bottom: 6, left: 16, right: 16),
                    decoration: BoxDecoration(
                        color: redColor.withOpacity(0.7),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(30)),
                        border: Border.all(color: Colors.black12, width: 0.5)),
                    child: Text('No',
                        style: primaryTextStyle(size: 14, color: white),
                        textAlign: TextAlign.center),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
