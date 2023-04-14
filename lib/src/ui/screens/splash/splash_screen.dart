import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:skyfy/src/ui/global/controllers/session_controller.dart';
import 'package:skyfy/src/ui/screens/splash/splash_controller.dart';

final splashProvider = SimpleProvider(
  (_) => SplashController(sessionProvider.read),
);

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderListener<SplashController>(
      provider: splashProvider,
      onAfterFirstLayout: (_, __) {
        if (!context.isTablet) {
          SystemChrome.setPreferredOrientations(
            [
              DeviceOrientation.portraitUp,
              DeviceOrientation.portraitDown,
            ],
          );
        }
      },
      onChange: (_, controller) {
        final routeName = controller.routeName;
        if (routeName != null) {
          router.pushReplacementNamed(routeName);
        }
      },
      builder: (_, __) {
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
