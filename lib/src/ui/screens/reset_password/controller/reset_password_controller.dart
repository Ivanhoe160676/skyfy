// ignore_for_file: non_constant_identifier_names

import 'package:skyfy/src/domain/repositories/auth_repository.dart';
import 'package:skyfy/src/domain/responses/reset_password_response.dart';
import 'package:flutter_meedu/meedu.dart';

class ResetPasswordController extends SimpleNotifier {
  String _email = '';
  String get email => _email;

  final _AuthRepository = Get.find<AuthRepository>();

  void onEmailChanged(String text) {
    _email = text;
  }

  Future<ResetPasswordResponse> submit() {
    return _AuthRepository.sendResetPasswordLink(email);
  }
}
