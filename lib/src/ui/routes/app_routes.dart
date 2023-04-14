import 'package:flutter/widgets.dart' show BuildContext, Widget;
import 'package:skyfy/src/tools/search/airport_lookup.dart';
import 'package:skyfy/src/ui/screens/dashboard/dashboard_screen.dart';
import 'package:skyfy/src/ui/screens/home/home_screen.dart';
import 'package:skyfy/src/ui/screens/login/login_screen.dart';
import 'package:skyfy/src/ui/screens/register/register.dart';
import 'package:skyfy/src/ui/screens/reset_password/reset_password_page.dart';
import 'package:skyfy/src/ui/screens/skyfybnb/skyfybnb.dart';
import 'package:skyfy/src/ui/screens/splash/splash_screen.dart';
import 'routes.dart';

Map<String, Widget Function(BuildContext context)> get appRoutes => {
      Routes.splash: (_) => const SplashScreen(),
      Routes.login: (_) => const LoginScreen(),
      Routes.register: (_) => const RegisterScreen(),
      Routes.resetPassword: (_) => const ResetPasswordScreen(),
      Routes.dashboard: (_) => const DashboardScreen(),
      Routes.skyfybnb: (_) => SkyFyBottomNavigation(
            airportLookup: AirportLookup(airports: [AirportLookup]),
          ),
      Routes.home: (_) =>
          HomeScreen(airportLookup: AirportLookup(airports: [AirportLookup])),
    };
