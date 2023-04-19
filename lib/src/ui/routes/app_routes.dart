import 'package:flutter/widgets.dart' show BuildContext, Widget;
import 'package:skyfy/src/ui/screens/home/widgets/search_flight.dart';
import 'package:skyfy/src/ui/screens/screens.dart';

import 'routes.dart';

Map<String, Widget Function(BuildContext context)> get appRoutes => {
      Routes.splash: (_) => const SplashScreen(),
      Routes.login: (_) => const LoginScreen(),
      Routes.register: (_) => const RegisterScreen(),
      Routes.resetPassword: (_) => const ResetPasswordScreen(),
      Routes.dashboard: (_) => const DashboardScreen(),
      Routes.skyfybnb: (_) => const SkyFyBottomNavigation(),
      Routes.home: (_) => const HomeScreen(),
      Routes.addAircraft: (_) => const AddAircraftScreen(),
      Routes.searchFlight: (_) => const SearchFlight()
    };
