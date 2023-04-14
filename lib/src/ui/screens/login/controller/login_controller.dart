// ignore_for_file: non_constant_identifier_names

import 'package:flutter/widgets.dart' show FormState, GlobalKey;
import 'package:flutter_meedu/meedu.dart';
import 'package:skyfy/src/domain/repositories/auth_repository.dart';
import 'package:skyfy/src/domain/responses/sign_in_response.dart';
import 'package:skyfy/src/ui/global/controllers/session_controller.dart';

class LoginController extends SimpleNotifier {
  final SessionController _sessionController;

  String _email = '', _password = '';
  final AuthRepository _AuthRepository = Get.find();

  final GlobalKey<FormState> formKey = GlobalKey();

  LoginController(this._sessionController);

  void onEmailChanged(String text) {
    _email = text;
  }

  void onPasswordChanged(String text) {
    _password = text;
  }

  Future<bool> get isAppleSignInAvailable =>
      _AuthRepository.isAppleSignInAvailable;

  Future<SignInResponse> signInWithEmailAndPassword() async {
    final response = await _AuthRepository.signInWithEmailAndPassword(
      _email,
      _password,
    );
    return _handleSignInResponse(response);
  }

  Future<SignInResponse> signInWithGoogle() async {
    final response = await _AuthRepository.signInWithGoogle();
    return _handleSignInResponse(response);
  }

  Future<SignInResponse> signInWithApple() async {
    final response = await _AuthRepository.signInWithApple();
    return _handleSignInResponse(response);
  }

  SignInResponse _handleSignInResponse(SignInResponse response) {
    if (response.error == null) {
      _sessionController.setUser(response.user!);
    }
    return response;
  }
}
