// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:skyfy/src/domain/responses/sign_up_response.dart';
import 'package:skyfy/src/ui/global/widgets/dialogs/dialogs.dart';
import 'package:skyfy/src/ui/global/widgets/dialogs/progress_dialog.dart';
import 'package:skyfy/src/ui/routes/routes.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:skyfy/src/ui/screens/register/register.dart';

Future<void> sendRegisterForm(BuildContext context) async {
  final controller = registerProvider.read;
  final isValidForm = controller.formKey.currentState!.validate();

  if (isValidForm) {
    ProgressDialog.show(context);
    final response = await controller.submit();
    router.pop();

    if (response.error != null) {
      late String content;
      switch (response.error) {
        case SignUpError.emailAlreadyInUse:
          content = "email already in use";
          break;
        case SignUpError.weakPassword:
          content = "weak password";
          break;

        case SignUpError.networkRequestFailed:
          content = "network Request Failed";
          break;
        case SignUpError.tooManyRequests:
          content = "too Many Requests";
          break;
        case SignUpError.unknown:
        default:
          content = "unknown error";
          break;
      }

      Dialogs.alert(
        context,
        title: "ERROR",
        content: content,
      );
    } else {
      router.pushNamedAndRemoveUntil(
        Routes.home,
      );
    }
  } else {
    Dialogs.alert(
      context,
      title: "ERROR",
      content: "Invalid fields",
    );
  }
}
