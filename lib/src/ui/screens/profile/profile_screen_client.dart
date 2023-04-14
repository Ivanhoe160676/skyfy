import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:skyfy/src/tools/app_colors.dart';
import 'package:skyfy/src/tools/profile/profile_constant.dart';
import 'package:skyfy/src/ui/global/widgets/app_widget.dart';
import 'package:skyfy/src/ui/global/widgets/drawer_widget.dart';
import 'package:skyfy/src/ui/screens/about/about_screen.dart';
import 'package:skyfy/src/ui/screens/notifications/notification_setting_screen.dart';
import 'package:skyfy/src/ui/screens/payment/payment_screen.dart';
import 'package:skyfy/src/ui/screens/security/security_screen.dart';
import 'package:skyfy/src/ui/screens/settings/widgets/settings_widgets.dart';

import '../../../../main.dart';

class ProfileScreenClient extends StatefulWidget {
  static String tag = '/ProfileScreenClient';

  const ProfileScreenClient({super.key});

  @override
  ProfileScreenClientState createState() => ProfileScreenClientState();
}

class ProfileScreenClientState extends State<ProfileScreenClient> {
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
    return Observer(
      builder: (_) => Scaffold(
        appBar: appBar(context, 'Profile'),
        drawer: const DrawerWidget(),
        body: ContainerX(
          mobile: SingleChildScrollView(
            padding: const EdgeInsets.only(top: 16),
            child: Column(
              children: [
                profileView(),
                const Divider(color: appDividerColor, height: 8)
                    .paddingOnly(top: 4, bottom: 4),
                options(),
              ],
            ),
          ),
          web: Column(
            children: [
              profileView(),
              const Divider(height: 8).paddingOnly(top: 4, bottom: 4),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: options(),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget profileView() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Image.asset(profileImage, height: 70, width: 70, fit: BoxFit.cover)
                .cornerRadiusWithClipRRect(40),
            16.width,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("John", style: primaryTextStyle()),
                2.height,
                Text("John@gmail.com", style: primaryTextStyle()),
              ],
            )
          ],
        ),
        IconButton(
          icon: Icon(AntDesign.edit, color: appStore.iconSecondaryColor),
          onPressed: () {},
        ).visible(true)
      ],
    ).paddingAll(16);
  }

  Widget options() {
    return Column(
      children: [
        settingItem(context, 'Notifications', onTap: () {
          const NotificationSettingScreen().launch(context);
        },
            leading: const Icon(MaterialIcons.notifications_none),
            detail: const SizedBox()),
        settingItem(context, 'Security', onTap: () {
          const SecurityScreen().launch(context);
        },
            leading: const Icon(MaterialCommunityIcons.shield_check_outline),
            detail: const SizedBox()),
        settingItem(context, 'Payments', onTap: () {
          const PaymentScreen().launch(context);
        },
            leading: const Icon(MaterialIcons.credit_card),
            detail: const SizedBox()),
        settingItem(context, 'Help',
            onTap: () {},
            leading: const Icon(MaterialIcons.help_outline),
            detail: const SizedBox()),
        settingItem(context, 'About', onTap: () {
          const AboutScreen().launch(context);
        },
            leading: const Icon(MaterialIcons.info_outline),
            detail: const SizedBox()),
        settingItem(context, 'Theme',
            onTap: () {},
            leading: const Icon(MaterialCommunityIcons.theme_light_dark),
            detail: const SizedBox()),
        settingItem(context, 'Log Out',
            onTap: () {}, detail: const SizedBox(), textColor: appColorPrimary),
      ],
    );
  }
}
