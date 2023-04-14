import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:skyfy/src/tools/email_validator.dart';
import 'package:skyfy/src/ui/global/widgets/custom_input_field.dart';
import 'package:skyfy/src/ui/global/widgets/rounded_button.dart';
import 'package:skyfy/src/ui/routes/routes.dart';
import 'package:skyfy/src/ui/screens/login/login_screen.dart';
import 'package:skyfy/src/ui/screens/login/utils/send_login_form.dart';
import 'package:skyfy/src/ui/screens/login/widgets/social_buttons.dart';
import 'package:skyfy/src/ui/utils/ui.dart';

class LoginForm extends StatelessWidget {
  LoginForm({
    Key? key,
  }) : super(key: key);

  final _controller = loginProvider.read;

  @override
  Widget build(BuildContext context) {
    //final isDarkMode = context.isDarkMode;
    // MediaQuery.of(context).size;
    // MediaQuery.of(context).padding.bottom;
    final padding = context.mediaQueryPadding;
    final height = context.height - padding.top - padding.bottom;

    return ListView(
      children: [
        SizedBox(
          height: height,
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Container(
              color: Colors.transparent,
              width: double.infinity,
              padding: const EdgeInsets.all(15),
              child: Form(
                key: _controller.formKey,
                child: Align(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxWidth: 360,
                    ),
                    child: Column(
                      mainAxisAlignment: context.isTablet
                          ? MainAxisAlignment.center
                          : MainAxisAlignment.center,
                      children: [
                        AspectRatio(
                            aspectRatio: 16 / 9, child: logoSkyfy(context)),
                        const Text(
                          'Sign In',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'OpenSans',
                            fontSize: 26.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 20),
                        CustomInputField(
                          label: "Email",
                          onChanged: _controller.onEmailChanged,
                          inputType: TextInputType.emailAddress,
                          validator: (text) {
                            if (isValidEmail(text!)) {
                              return null;
                            }
                            return "Invalid email";
                          },
                        ),
                        const SizedBox(height: 20),
                        CustomInputField(
                          label: "Password",
                          onChanged: _controller.onPasswordChanged,
                          isPassword: true,
                          validator: (text) {
                            if (text!.trim().length >= 6) {
                              return null;
                            }
                            return "Invalid password";
                          },
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () =>
                                  router.pushNamed(Routes.resetPassword),
                              child: const Text(
                                "Forgot Password?",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            const SizedBox(width: 10),
                            RoundedButton(
                              backgroundColor: Palette.blueSkyFy,
                              text: "Sign In",
                              onPressed: () => sendLoginForm(context),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Don't have an account?",
                              style: TextStyle(color: Colors.white),
                            ),
                            TextButton(
                              onPressed: () => router.pushNamed(
                                Routes.register,
                              ),
                              child: Text(
                                "Sign Up",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Palette.blueSkyFy),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),
                        const Text(
                          "Or sign in with",
                          style: TextStyle(color: Colors.amber),
                        ),
                        const SizedBox(height: 10),
                        const SocialButtons(),
                        if (!context.isTablet) const SizedBox(height: 30),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
