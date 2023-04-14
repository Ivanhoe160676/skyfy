// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:skyfy/src/ui/global/widgets/dialogs/progress_dialog.dart';
import 'package:skyfy/src/ui/screens/login/login_screen.dart';

import 'handle_login_response.dart';

void signInWithGoogle(BuildContext context) async {
  ProgressDialog.show(context);
  final controller = loginProvider.read;
  final response = await controller.signInWithGoogle();
  Navigator.pop(context);
  handleLoginResponse(context, response);
}
