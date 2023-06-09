import 'package:flutter/widgets.dart';
import 'package:skyfy/src/domain/repositories/sign_up_repository.dart';
import 'package:skyfy/src/domain/responses/sign_up_response.dart';
import 'package:skyfy/src/ui/global/controllers/session_controller.dart';
import 'package:skyfy/src/ui/utils/inputs/sign_up.dart';

import 'register_state.dart';
import 'package:flutter_meedu/meedu.dart';

class RegisterController extends StateNotifier<RegisterState> {
  final SessionController _sessionController;
  RegisterController(this._sessionController)
      : super(RegisterState.initialState);
  final GlobalKey<FormState> formKey = GlobalKey();
  final SignUpRepository _signUpRepository = Get.find();

  Future<SignUpResponse> submit() async {
    final response = await _signUpRepository.register(
      SignUpData(
        name: state.name,
        lastname: state.lastname,
        email: state.email,
        password: state.password,
      ),
    );
    if (response.error == null) {
      _sessionController.setUser(response.user!);
    }

    return response;
  }

  void onNameChanged(String text) {
    state = state.copyWith(name: text);
  }

  void onLastNameChanged(String text) {
    state = state.copyWith(lastname: text);
  }

  void onEmailChanged(String text) {
    state = state.copyWith(email: text);
  }

  void onPasswordChanged(String text) {
    state = state.copyWith(password: text);
  }

  void onVPasswordChanged(String text) {
    state = state.copyWith(vPassword: text);
  }
}
