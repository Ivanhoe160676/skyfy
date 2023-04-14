import 'package:flutter/material.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:skyfy/src/ui/global/controllers/session_controller.dart';
import 'package:skyfy/src/ui/utils/colors.dart';
import 'controller/login_controller.dart';
import 'widgets/login_form.dart';

final loginProvider = SimpleProvider(
  (_) => LoginController(sessionProvider.read),
);

class LoginScreen extends StatelessWidget {
  const LoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderListener<LoginController>(
      provider: loginProvider,
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
            body: OrientationBuilder(
              builder: (_, orientation) {
                if (orientation == Orientation.portrait) {
                  return LoginForm();
                }
                return Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(
                        color: primaryLightColor,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: LoginForm(),
                    ),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}
