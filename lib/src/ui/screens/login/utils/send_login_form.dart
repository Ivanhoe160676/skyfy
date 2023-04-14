// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:skyfy/src/ui/global/widgets/dialogs/progress_dialog.dart';
import 'package:skyfy/src/ui/screens/login/utils/handle_login_response.dart';
import '../login_screen.dart' show loginProvider;

Future<void> sendLoginForm(BuildContext context) async {
  final controller = loginProvider.read;
  final isValidForm = controller.formKey.currentState!.validate();
  if (isValidForm) {
    ProgressDialog.show(context);
    final response = await controller.signInWithEmailAndPassword();
    router.pop();
    handleLoginResponse(context, response);
  }
}
