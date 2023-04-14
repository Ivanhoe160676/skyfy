// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:skyfy/src/data/services/flight_details_bloc.dart';
import 'package:skyfy/src/tools/search/airport_lookup.dart';
import 'package:skyfy/src/ui/screens/home/widgets/card_swiper.dart';
import 'package:skyfy/src/ui/screens/home/widgets/class_selector.dart';
import 'package:skyfy/src/ui/screens/home/widgets/date_selector.dart';
import 'package:skyfy/src/ui/screens/home/widgets/flight_calculation_card.dart';
import 'package:skyfy/src/ui/screens/home/widgets/flight_details_card.dart';
import 'package:skyfy/src/ui/screens/home/widgets/return_selector.dart';
import 'package:skyfy/src/ui/screens/home/widgets/time_selector.dart';
import 'package:skyfy/src/ui/screens/home/widgets/travelers_selector.dart';
import 'package:skyfy/src/ui/utils/palette.dart';

class HomeScreen extends StatefulWidget {
  final AirportLookup airportLookup;
  const HomeScreen({Key? key, required this.airportLookup}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

enum TripType { oneway, roundtrip, multicity }

Map<TripType, String> _tripTypes = {
  TripType.oneway: 'ONE WAY',
  TripType.roundtrip: 'ROUNDTRIP',
  TripType.multicity: 'MULTICITY',
};

class _HomeScreenState extends State<HomeScreen> {
  TripType _selectedTrip = TripType.oneway;
  bool _isReturnVisible = false;
  bool _isMulticityVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///
      //! AppBar

      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient:
                  LinearGradient(begin: Alignment.centerLeft, colors: <Color>[
            Color(0xff5352fa),
            Color(0xff1b1c1c),
          ])),
        ),
        title: Image.asset(
          'assets/logos/logo9.png',
          width: MediaQuery.of(context).size.width * 0.6,
          height: MediaQuery.of(context).size.height * 0.6,
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(170),
          child: Column(
            children: <Widget>[
              const CardSwiperEmptyLegs(),
              Column(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                        color: Palette.lightSkyfy,
                        borderRadius: BorderRadius.circular(24),
                        // ignore: prefer_const_literals_to_create_immutables
                        boxShadow: [
                          const BoxShadow(
                              color: Colors.black26,
                              offset: Offset(0, 6),
                              blurRadius: 6),
                        ]),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(_tripTypes.length, (index) {
                        return buildTripTypeSelector(
                            _tripTypes.keys.elementAt(index));
                      }),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),

      body: _buildContext(context),
    );
  }

  Widget buildTripTypeSelector(TripType tripType) {
    var isSelected = _selectedTrip == tripType;
    return Row(
      children: <Widget>[
        TextButton(
          style: TextButton.styleFrom(
            padding: const EdgeInsets.only(left: 4, right: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            backgroundColor:
                isSelected ? Palette.blueSkyFy : Colors.transparent,
          ),
          child: Row(
            children: <Widget>[
              if (isSelected)
                const Icon(
                  Icons.check_circle,
                  color: Colors.white,
                ),
              Text(
                _tripTypes[tripType] ?? 'default',
                style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
          onPressed: () {
            setState(() {
              _selectedTrip = tripType;
              _isReturnVisible = _selectedTrip == TripType.roundtrip;
              _isMulticityVisible = _selectedTrip == TripType.multicity;
            });
          },
        ),
      ],
    );
  }

  Widget _buildContext(BuildContext context) {
    final flightDetailsBloc = Provider.of<FlightDetailsBloc>(context);
    return StreamBuilder<Flight>(
        stream: flightDetailsBloc.flightStream,
        initialData: Flight.initialData(),
        builder: (context, snapshot) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    color: Colors.white,
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: const [
                            Text('From:'),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: const [
                            Text('To:'),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SafeArea(
                    child: Column(
                      children: <Widget>[
                        FlightDetailsCard(
                          airportLookup: widget.airportLookup,
                          flightDetails: snapshot.data!.details,
                          flightDetailsBloc: flightDetailsBloc,
                        ),
                        Row(
                          children: const <Widget>[
                            DateSelector(),
                            TimeSelector(),
                            TravelersSelector()
                          ],
                        ),
                        Container(height: 1, color: Colors.black26),
                        Row(
                          children: <Widget>[
                            Visibility(
                              visible: _isReturnVisible,
                              child: const ReturnSelector(),
                            ),
                            Expanded(
                              child: FlightCalculationCard(
                                flightCalculationData: snapshot.data!.data,
                              ),
                            ),
                            Visibility(
                                visible: _isMulticityVisible,
                                child: AddLeg(
                                  airportLookup: widget.airportLookup,
                                  flightDetails: snapshot.data!.details,
                                  flightDetailsBloc: flightDetailsBloc,
                                )),
                          ],
                        ),
                        Container(height: 1, color: Colors.black26),
                      ],
                    ),
                  ),
                  // AirportSelector(),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[ClassSelector()],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  //Parte baja
                  Stack(
                    children: <Widget>[
                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          // ignore: prefer_const_literals_to_create_immutables
                          boxShadow: [
                            const BoxShadow(
                              color: Colors.black26,
                              offset: Offset(0, 12),
                              blurRadius: 12,
                            ),
                          ],
                          borderRadius: BorderRadius.vertical(
                              bottom: Radius.elliptical(
                                  MediaQuery.of(context).size.width * 2, 100)),
                        ),
                      ),
                      Center(
                        child: Material(
                          color: Palette.blueSkyFy,
                          shape: const CircleBorder(),
                          clipBehavior: Clip.antiAlias,
                          elevation: 10,
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).pushNamed('/dashboard');
                            },
                            splashColor: Colors.orange,
                            child: Container(
                              width: 80,
                              height: 80,
                              alignment: Alignment.center,
                              child: Text(
                                'SEARCH',
                                style: GoogleFonts.overpass(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  // const AircraftPictureCard(),
                ],
              ),
            ),
          );
        });
  }
}
