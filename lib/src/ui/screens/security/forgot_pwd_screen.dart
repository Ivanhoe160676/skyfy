// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:skyfy/src/tools/app_colors.dart';
import 'package:skyfy/src/ui/global/widgets/app_widget.dart';
import 'package:skyfy/src/ui/global/widgets/drawer_widget.dart';
import 'package:skyfy/src/ui/screens/settings/widgets/settings_widgets.dart';

class ForgotPwdScreen extends StatefulWidget {
  static String tag = '/ForgotPwdScreen';

  const ForgotPwdScreen({super.key});

  @override
  _ForgotPwdScreenState createState() => _ForgotPwdScreenState();
}

class _ForgotPwdScreenState extends State<ForgotPwdScreen> {
  var emailCont = TextEditingController();
  bool autoValidate = false;
  var formKey = GlobalKey<FormState>();

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
      appBar: appBar(context, 'Forgot Password'),
      drawer: const DrawerWidget(),
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Container(
          padding: const EdgeInsets.only(left: 50, right: 50),
          width: dynamicWidth(context),
          alignment: Alignment.center,
          child: Form(
            key: formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Password Reset', style: boldTextStyle(size: 24)),
                  Text(
                      'To reset your password, enter your email to get reset link.',
                      style: secondaryTextStyle()),
                  30.height,
                  TextFormField(
                    controller: emailCont,
                    style: primaryTextStyle(),
                    decoration: InputDecoration(
                      labelText: 'Email',
                      contentPadding: const EdgeInsets.all(16),
                      labelStyle: secondaryTextStyle(),
                      border: const OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: const BorderSide(color: appColorPrimary)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: const BorderSide(color: Colors.black)),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (s) {
                      if (s!.trim().isEmpty) return errorThisFieldRequired;
                      if (!s.trim().validateEmail()) return 'Email is invalid';
                      return null;
                    },
                    textInputAction: TextInputAction.done,
                  ),
                  20.height,
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                    decoration: BoxDecoration(
                        color: appColorPrimary,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: defaultBoxShadow()),
                    child: Text('Send',
                        style: boldTextStyle(color: white, size: 18)),
                  ).onTap(() {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      finish(context);
                    } else {
                      autoValidate = true;
                    }
                    setState(() {});
                  }),
                ],
              ),
            ),
          ).center(),
        ),
      ),
    );
  }
}
