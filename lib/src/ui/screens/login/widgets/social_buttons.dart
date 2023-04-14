import 'dart:io';
import 'package:flutter/material.dart';
import 'package:skyfy/src/ui/icons/skyfy_icons.dart';
import 'package:skyfy/src/ui/screens/login/utils/sign_in_with_apple.dart';
import 'package:skyfy/src/ui/screens/login/utils/sign_in_with_google.dart';
import 'package:skyfy/src/ui/routes/routes.dart';

import 'package:flutter_meedu/ui.dart';

class SocialButtons extends StatelessWidget {
  const SocialButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(width: 15),
        SocialButton(
          color: Colors.redAccent,
          onPressed: () => signInWithGoogle(context),
          iconData: SkyFyIcons.google,
        ),
        if (Platform.isIOS) ...[
          const SizedBox(width: 15),
          SocialButton(
            color: Colors.grey,
            onPressed: () => signInWithApple(context),
            iconData: SkyFyIcons.apple,
          ),
        ],
        const SizedBox(width: 15),
        SocialButton(
          color: Colors.indigo,
          onPressed: () => router.pushNamed(Routes.phoneAuth),
          iconData: SkyFyIcons.smartphone,
        ),
      ],
    );
  }
}

class SocialButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final IconData iconData;
  final Color color;

  const SocialButton({
    Key? key,
    this.onPressed,
    required this.iconData,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          color,
        ),
        padding: MaterialStateProperty.all(
          EdgeInsets.zero,
        ),
        elevation: MaterialStateProperty.all(5),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        minimumSize: MaterialStateProperty.all(
          const Size(50, 50),
        ),
      ),
      child: SizedBox(
        width: 40,
        height: 40,
        child: Icon(iconData),
      ),
    );
  }
}
