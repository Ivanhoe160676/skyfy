import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:skyfy/src/ui/global/widgets/app_widget.dart';
import 'package:skyfy/src/ui/global/widgets/drawer_widget.dart';
import 'package:skyfy/src/ui/screens/security/change_password_screen.dart';
import 'package:skyfy/src/ui/screens/settings/widgets/settings_widgets.dart';

class SecurityScreen extends StatefulWidget {
  static String tag = '/SecurityScreen';

  const SecurityScreen({super.key});

  @override
  SecurityScreenState createState() => SecurityScreenState();
}

class SecurityScreenState extends State<SecurityScreen> {
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
      appBar: appBar(context, 'Security'),
      drawer: const DrawerWidget(),
      body: Column(
        children: [
          settingItem(context, 'Change Password', onTap: () {
            const ChangePasswordScreen().launch(context);
          }, leading: const Icon(AntDesign.lock), detail: const SizedBox()),
        ],
      ),
    );
  }
}
