// ignore_for_file: unnecessary_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:skyfy/src/tools/email_validator.dart';
import 'package:skyfy/src/tools/name_validator.dart';
import 'package:skyfy/src/ui/global/controllers/session_controller.dart';
import 'package:skyfy/src/ui/global/widgets/custom_input_field.dart';
import 'package:skyfy/src/ui/global/widgets/rounded_button.dart';
import 'package:skyfy/src/ui/routes/routes.dart';
import 'package:skyfy/src/ui/screens/register/controller/register_controller.dart';
import 'package:skyfy/src/ui/screens/register/controller/register_state.dart';
import 'package:skyfy/src/ui/screens/register/utils/send_register_form.dart';
import 'package:skyfy/src/ui/utils/ui.dart';

final registerProvider = StateProvider<RegisterController, RegisterState>(
  (_) => RegisterController(sessionProvider.read),
);

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      elevation: 0,
    );
    final padding = context.mediaQueryPadding;
    final height = context.height -
        padding.top -
        padding.bottom -
        appBar.preferredSize.height;

    return ProviderListener<RegisterController>(
      provider: registerProvider,
      builder: (_, controller) {
        return Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient:
                LinearGradient(begin: Alignment.centerLeft, colors: <Color>[
              Color(0xff5352fa),
              Color(0xff1b1c1c),
            ]),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.14),
                  logoSkyfy(context),
                  SizedBox(
                    height: height * 0.8,
                    child: GestureDetector(
                      onTap: () => FocusScope.of(context).unfocus(),
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        color: Colors.transparent,
                        padding: const EdgeInsets.all(15),
                        child: Align(
                          child: Form(
                            key: controller.formKey,
                            child: ConstrainedBox(
                              constraints: const BoxConstraints(
                                maxWidth: 360,
                              ),
                              child: Column(
                                mainAxisAlignment: context.isTablet
                                    ? MainAxisAlignment.center
                                    : MainAxisAlignment.end,
                                children: [
                                  const Text(
                                    "Sign Up",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 15),
                                  CustomInputField(
                                    label: "Name",
                                    onChanged: controller.onNameChanged,
                                    validator: (text) {
                                      return isValidName(text!)
                                          ? null
                                          : "invalid name";
                                    },
                                  ),
                                  const SizedBox(height: 15),
                                  CustomInputField(
                                    label: "Last Name",
                                    onChanged: controller.onLastNameChanged,
                                    validator: (text) {
                                      return isValidName(text!)
                                          ? null
                                          : "invalid last name";
                                    },
                                  ),
                                  const SizedBox(height: 15),
                                  CustomInputField(
                                    label: "E-mail",
                                    inputType: TextInputType.emailAddress,
                                    onChanged: controller.onEmailChanged,
                                    validator: (text) {
                                      return isValidEmail(text!)
                                          ? null
                                          : "invalid email";
                                    },
                                  ),
                                  const SizedBox(height: 15),
                                  CustomInputField(
                                    label: "Password",
                                    onChanged: controller.onPasswordChanged,
                                    isPassword: true,
                                    validator: (text) {
                                      if (text!.trim().length >= 6) {
                                        return null;
                                      }
                                      return "invalid password";
                                    },
                                  ),
                                  const SizedBox(height: 15),
                                  Consumer(
                                    builder: (_, ref, __) {
                                      ref.watch(
                                        registerProvider.select(
                                          (_) => _.password,
                                        ),
                                      );
                                      return CustomInputField(
                                        label: "Verification Password",
                                        onChanged:
                                            controller.onVPasswordChanged,
                                        isPassword: true,
                                        validator: (text) {
                                          if (controller.state.password !=
                                              text) {
                                            return "password don't match";
                                          }
                                          if (text!.trim().length >= 6) {
                                            return null;
                                          }
                                          return "invalid password";
                                        },
                                      );
                                    },
                                  ),
                                  const SizedBox(height: 30),
                                  RoundedButton(
                                    text: "REGISTER",
                                    onPressed: () => sendRegisterForm(context),
                                  ),
                                  const SizedBox(height: 15),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text('Already have an account?',
                                          style:
                                              TextStyle(color: Colors.white)),
                                      const SizedBox(width: 5),
                                      GestureDetector(
                                        onTap: () => router.pushNamed(
                                          Routes.login,
                                        ),
                                        child: const Text('Sign In',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 15),

                                  // if (!context.isTablet)
                                  //   const SizedBox(height: 30),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
