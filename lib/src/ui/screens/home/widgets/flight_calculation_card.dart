import 'package:flutter/material.dart';
import 'package:skyfy/src/data/services/flight_details_bloc.dart';
import 'package:skyfy/src/ui/utils/ui.dart';

class FlightCalculationCard extends StatelessWidget {
  const FlightCalculationCard({Key? key, required this.flightCalculationData})
      : super(key: key);
  final FlightData flightCalculationData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FlightCalculationDataItem(
          title: 'Distance',
          body: flightCalculationData.distanceFormatted,
        ),
      ],
    );
  }
}

class FlightCalculationDataItem extends StatelessWidget {
  const FlightCalculationDataItem(
      {Key? key, required this.title, required this.body})
      : super(key: key);
  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: TextStyles.caption,
        ),
        Text(
          body,
          style: const TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}
