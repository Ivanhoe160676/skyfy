// ignore_for_file: library_private_types_in_public_api
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skyfy/src/data/providers/airport_lookup_provider.dart';
import 'package:skyfy/src/data/services/flight_details_bloc.dart';
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
  const HomeScreen({Key? key}) : super(key: key);

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
  String aircraftImageUrl = '';
  String aircraftName = '';
  String aircraftModel = '';
  String aircraftCapacity = '';
  TripType _selectedTrip = TripType.oneway;
  bool _isReturnVisible = false;
  bool _isMulticityVisible = false;

  Future<void> getRandomAircraftData() async {
    final random = Random();
    final querySnapshot =
        await FirebaseFirestore.instance.collection('Aircrafts').get();
    final randomIndex = random.nextInt(querySnapshot.docs.length);
    final aircraftData = querySnapshot.docs[randomIndex].data();
    setState(() {
      aircraftImageUrl = aircraftData['picture'];
      aircraftName = aircraftData['name'];
      aircraftModel = aircraftData['model'];
      aircraftCapacity = aircraftData['passengerCapacity'];
    });
  }

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
                          airportLookup:
                              Provider.of<AirportLookupProvider>(context)
                                  .getAirportLookup(),
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
                                  airportLookup:
                                      Provider.of<AirportLookupProvider>(
                                              context)
                                          .getAirportLookup(),
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
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Palette.blueSkyFy,
                              shape: const CircleBorder(),
                              padding: const EdgeInsets.all(20),
                            ),
                            onPressed: getRandomAircraftData,
                            child: const Text('Search'),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 20),
                        FlightSearchResult(
                          aircraftImageUrl: aircraftImageUrl,
                          aircraftName: aircraftName,
                          aircraftModel: aircraftModel,
                          aircraftCapacity: aircraftCapacity,
                        )
                      ],
                    ),
                  ),
                  // const AircraftPictureCard(),
                ],
              ),
            ),
          );
        });
  }
}

class FlightSearchResult extends StatelessWidget {
  const FlightSearchResult({
    Key? key,
    required this.aircraftImageUrl,
    required this.aircraftName,
    required this.aircraftModel,
    required this.aircraftCapacity,
  }) : super(key: key);

  final String aircraftImageUrl;
  final String aircraftName;
  final String aircraftModel;
  final String aircraftCapacity;

  @override
  Widget build(BuildContext context) {
    return searchResults(context);
  }

  Center searchResults(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          aircraftImageUrl.isNotEmpty
              ? GestureDetector(
                  onTap: () {
                    createReservation();
                  },
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.network(aircraftImageUrl, height: 150)),
                )
              : const SizedBox(),
          const SizedBox(height: 10),
          Text(
            'Name: $aircraftName',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Text(
            'Model: $aircraftModel',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Text(
            'Capacity: $aircraftCapacity',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ],
      ),
    );
  }

  void createReservation() {}
}
