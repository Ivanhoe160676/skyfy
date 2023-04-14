import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skyfy/src/data/providers/apple_sign_in.dart';
import 'package:skyfy/src/data/repositories_imp/account_repository_imp.dart';
import 'package:skyfy/src/data/repositories_imp/auth_repository_imp.dart';
import 'package:skyfy/src/data/repositories_imp/preferences_repository_imp.dart';
import 'package:skyfy/src/data/repositories_imp/sign_up_repository_imp.dart';
import 'package:skyfy/src/data/services/flight_details_bloc.dart';
import 'package:skyfy/src/domain/repositories/account_repository.dart';
import 'package:skyfy/src/domain/repositories/auth_repository.dart';
import 'package:skyfy/src/domain/repositories/preferences_repository.dart';
import 'package:skyfy/src/domain/repositories/sign_up_repository.dart';
import 'package:skyfy/src/tools/search/airport_lookup.dart';

Future<void> injectDependencies() async {
  final preferences = await SharedPreferences.getInstance();

  Get.lazyPut<AuthRepository>(
    () => AuthRepositoryImp(
      firebaseAuth: FirebaseAuth.instance,
      googleSignIn: GoogleSignIn(),
      appleSignIn: AppleSignIn(
        clientId: 'app.meedu.flutterFirebaseAuth.web',
        redirectURL:
            'https://us-central1-flutter-firebase-auth-cf2e4.cloudfunctions.net/handleAppleSignInOnAndroid',
      ),
    ),
  );
  Get.lazyPut<SignUpRepository>(
    () => SignUpRepositoryImp(
      FirebaseAuth.instance,
    ),
  );
  Get.lazyPut<AccountRepository>(
    () => AccountRepositoryImp(
      FirebaseAuth.instance,
    ),
  );
  Get.lazyPut<PreferencesRepository>(
    () => PreferencesRepositoryImp(preferences),
  );
  Get.lazyPut<AirportLookup>(() {
    return AirportLookup(airports: []);
  });
  Get.put<FlightDetailsBloc>(
    FlightDetailsBloc(),
  );

  // Get.lazyPut<PhoneAuthRepository>(
  //   () => PhoneAuthRepositoryImp(
  //     FirebaseAuth.instance,
  //     PhoneNumberUtil(),
  //   ),
  //   autoRemove: true,
  // );
}
