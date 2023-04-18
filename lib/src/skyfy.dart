import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:provider/provider.dart';
import 'package:skyfy/src/data/providers/airport_lookup_provider.dart';
import 'package:skyfy/src/data/services/flight_details_bloc.dart';
import 'package:skyfy/src/tools/search/airport_lookup.dart';
import 'package:skyfy/src/ui/routes/app_routes.dart';
import 'package:skyfy/src/ui/routes/routes.dart';
import 'package:skyfy/src/ui/utils/palette.dart';

class SkyFy extends StatelessWidget {
  final AirportLookup airportLookup;
  const SkyFy({super.key, required this.airportLookup});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<FlightDetailsBloc>(
          create: (context) => FlightDetailsBloc(),
          dispose: (context, bloc) => bloc.dispose(),
        ),
        ChangeNotifierProvider<AirportLookupProvider>(
          create: (context) =>
              AirportLookupProvider(airportLookup: airportLookup),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData.light().copyWith(
            appBarTheme: AppBarTheme(elevation: 0, color: Palette.blueSkyFy)),
        title: 'SkyFy',
        debugShowCheckedModeBanner: false,
        navigatorKey: router.navigatorKey,
        initialRoute: Routes.splash,
        navigatorObservers: [
          router.observer,
        ],
        routes: appRoutes,
      ),
    );
  }
}
