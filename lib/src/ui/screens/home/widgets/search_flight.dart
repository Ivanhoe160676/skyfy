// ignore_for_file: library_private_types_in_public_api

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class SearchFlight extends StatefulWidget {
  const SearchFlight({Key? key}) : super(key: key);

  @override
  _SearchFlightState createState() => _SearchFlightState();
}

class _SearchFlightState extends State<SearchFlight> {
  String aircraftImageUrl = '';
  String aircraftName = '';
  String aircraftModel = '';
  String aircraftCapacity = '';

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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: getRandomAircraftData,
              child: const Text('Search Flight'),
            ),
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
    );
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
              ? Image.network(aircraftImageUrl, height: 150)
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
}
