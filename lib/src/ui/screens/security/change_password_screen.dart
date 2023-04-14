import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:skyfy/src/tools/app_colors.dart';
import 'package:skyfy/src/ui/global/widgets/app_widget.dart';
import 'package:skyfy/src/ui/screens/settings/widgets/settings_widgets.dart';

class ChangePasswordScreen extends StatefulWidget {
  static String tag = '/ChangePasswordScreen';

  const ChangePasswordScreen({super.key});

  @override
  ChangePasswordScreenState createState() => ChangePasswordScreenState();
}

class ChangePasswordScreenState extends State<ChangePasswordScreen> {
  bool oldPassObscureText = true;
  bool newPassObscureText = true;
  bool confirmPassObscureText = true;

  var passCont = TextEditingController();
  var newPassCont = TextEditingController();
  var confirmPassCont = TextEditingController();

  var newPassFocus = FocusNode();
  var confirmPassFocus = FocusNode();

  var formKey = GlobalKey<FormState>();
  bool autoValidate = false;

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
      appBar: appBar(context, 'Change Password'),
      body: Center(
        child: Container(
          width: dynamicWidth(context),
          padding: const EdgeInsets.all(16),
          alignment: Alignment.center,
          child: Form(
            key: formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Change Password', style: boldTextStyle(size: 24)),
                30.height,
                16.height,
                TextFormField(
                  obscureText: oldPassObscureText,
                  controller: passCont,
                  style: primaryTextStyle(),
                  decoration: InputDecoration(
                    labelText: 'Password',
                    contentPadding: const EdgeInsets.all(16),
                    labelStyle: secondaryTextStyle(),
                    border: const OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(color: appColorPrimary)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(color: Colors.black)),
                    suffix: Icon(!oldPassObscureText
                            ? Icons.visibility
                            : Icons.visibility_off)
                        .onTap(() {
                      oldPassObscureText = !oldPassObscureText;
                      setState(() {});
                    }),
                  ),
                  onFieldSubmitted: (s) =>
                      FocusScope.of(context).requestFocus(newPassFocus),
                  validator: (s) {
                    if (s!.trim().isEmpty) return errorThisFieldRequired;
                    return null;
                  },
                ),
                16.height,
                TextFormField(
                  obscureText: newPassObscureText,
                  focusNode: newPassFocus,
                  controller: newPassCont,
                  style: primaryTextStyle(),
                  decoration: InputDecoration(
                    labelText: 'New Password',
                    contentPadding: const EdgeInsets.all(16),
                    labelStyle: secondaryTextStyle(),
                    border: const OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(color: appColorPrimary)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(color: Colors.black)),
                    suffix: Icon(!newPassObscureText
                            ? Icons.visibility
                            : Icons.visibility_off)
                        .onTap(() {
                      newPassObscureText = !newPassObscureText;
                      setState(() {});
                    }),
                  ),
                  onFieldSubmitted: (s) =>
                      FocusScope.of(context).requestFocus(confirmPassFocus),
                  validator: (s) {
                    if (s!.trim().isEmpty) return errorThisFieldRequired;
                    return null;
                  },
                ),
                16.height,
                TextFormField(
                  obscureText: confirmPassObscureText,
                  focusNode: confirmPassFocus,
                  controller: confirmPassCont,
                  style: primaryTextStyle(),
                  decoration: InputDecoration(
                    labelText: 'Confirm Password',
                    contentPadding: const EdgeInsets.all(16),
                    labelStyle: secondaryTextStyle(),
                    border: const OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(color: appColorPrimary)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(color: Colors.black)),
                    suffix: Icon(!confirmPassObscureText
                            ? Icons.visibility
                            : Icons.visibility_off)
                        .onTap(() {
                      confirmPassObscureText = !confirmPassObscureText;
                      setState(() {});
                    }),
                  ),
                  validator: (s) {
                    if (s!.trim().isEmpty) return errorThisFieldRequired;
                    if (s.trim() != newPassCont.text) {
                      return 'password does not match';
                    }
                    return null;
                  },
                ),
                16.height,
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  decoration: BoxDecoration(
                      color: appColorPrimary,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: defaultBoxShadow()),
                  child: Text('Submit',
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
        ),
      ),
    );
  }
}
