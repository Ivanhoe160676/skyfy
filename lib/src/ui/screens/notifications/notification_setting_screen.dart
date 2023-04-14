import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:skyfy/src/tools/app_colors.dart';
import 'package:skyfy/src/ui/global/widgets/app_widget.dart';
import 'package:skyfy/src/ui/screens/settings/widgets/settings_widgets.dart';

class NotificationSettingScreen extends StatefulWidget {
  static String tag = '/NotificationSettingScreen';

  const NotificationSettingScreen({super.key});

  @override
  NotificationSettingScreenState createState() =>
      NotificationSettingScreenState();
}

class NotificationSettingScreenState extends State<NotificationSettingScreen> {
  bool pushNotifications = true;
  bool emailFeedback = true;
  bool supportEmails = true;
  bool followerRequests = true;
  bool chatMessage = true;

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
      appBar: appBar(context, 'Notifications'),
      body: Column(
        children: [
          settingItem(
            context,
            'Push Notifications',
            detail: Switch(
              activeColor: appColorPrimary,
              value: pushNotifications,
              onChanged: (s) {
                pushNotifications = s;
                setState(() {});
              },
            ).withHeight(30),
            onTap: () {
              pushNotifications = !pushNotifications;
              setState(() {});
            },
          ),
          settingItem(
            context,
            'Email Feedback',
            detail: Switch(
              activeColor: appColorPrimary,
              value: emailFeedback,
              onChanged: (s) {
                emailFeedback = s;
                setState(() {});
              },
            ).withHeight(30),
            onTap: () {
              emailFeedback = !emailFeedback;
              setState(() {});
            },
          ),
          settingItem(
            context,
            'Support Emails',
            detail: Switch(
              activeColor: appColorPrimary,
              value: supportEmails,
              onChanged: (s) {
                supportEmails = s;
                setState(() {});
              },
            ).withHeight(30),
            onTap: () {
              supportEmails = !supportEmails;
              setState(() {});
            },
          ),
          settingItem(
            context,
            'Follower Requests',
            detail: Switch(
              activeColor: appColorPrimary,
              value: followerRequests,
              onChanged: (s) {
                followerRequests = s;
                setState(() {});
              },
            ).withHeight(30),
            onTap: () {
              followerRequests = !followerRequests;
              setState(() {});
            },
          ),
          settingItem(
            context,
            'Chat Messages',
            detail: Switch(
              activeColor: appColorPrimary,
              value: chatMessage,
              onChanged: (s) {
                chatMessage = s;
                setState(() {});
              },
            ).withHeight(30),
            onTap: () {
              chatMessage = !chatMessage;
              setState(() {});
            },
          ),
        ],
      ),
    );
  }
}
