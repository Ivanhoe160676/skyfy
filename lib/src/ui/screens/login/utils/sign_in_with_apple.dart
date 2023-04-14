// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:skyfy/src/ui/global/widgets/dialogs/dialogs.dart';
import 'package:skyfy/src/ui/global/widgets/dialogs/progress_dialog.dart';
import '../login_screen.dart';
import 'handle_login_response.dart';

void signInWithApple(BuildContext context) async {
  ProgressDialog.show(context);
  final controller = loginProvider.read;
  if (await controller.isAppleSignInAvailable) {
    final response = await controller.signInWithApple();
    Navigator.pop(context);
    handleLoginResponse(context, response);
  } else {
    Navigator.pop(context);
    Dialogs.alert(
      context,
      title: "Apple sign in not available",
    );
  }
}
