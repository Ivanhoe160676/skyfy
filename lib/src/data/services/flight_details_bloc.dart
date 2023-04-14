import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:skyfy/src/data/services/flight_class.dart';
import 'package:skyfy/src/domain/models/airports.models.dart';
import 'package:skyfy/src/tools/tools.dart';

//! Flight type: one way return or multicity
enum FlightType { oneWay, roundTrip, multicity }

class FlightDetails {
  FlightDetails({
    this.departure,
    this.arrival,
    this.flightClass = FlightClass.bronze,
    this.flightType = FlightType.oneWay,
  });
  final Airport? departure;
  final Airport? arrival;
  final FlightClass flightClass;
  final FlightType flightType;

  FlightDetails copyWith(
      {Airport? departure,
      Airport? arrival,
      FlightClass? flightClass,
      FlightType? flightType}) {
    return FlightDetails(
      departure: departure ?? this.departure,
      arrival: arrival ?? this.arrival,
      flightClass: flightClass ?? this.flightClass,
      flightType: flightType ?? this.flightType,
    );
  }
}

//! Model for the FlightCalculationCard
class FlightData {
  FlightData({this.distanceKm});
  final double? distanceKm;

  String get distanceFormatted {
    return distanceKm != null
        ? '${distanceKm!.roundToDouble().toInt()} km'
        : '';
  }

  //! factory method to calculate the distance and co2 from the flight details
  factory FlightData.fromDetails(FlightDetails flightDetails) {
    double? distanceKm;
    Airport? departure = flightDetails.departure;
    Airport? arrival = flightDetails.arrival;
    if (departure != null && arrival != null) {
      double multiplier =
          flightDetails.flightType == FlightType.oneWay ? 1.0 : 2.0;
      distanceKm = DistanceCalculator.distanceInKmBetween(
          departure.location, arrival.location);
      multiplier;
    }
    return FlightData(distanceKm: distanceKm);
  }
}

//! Model for the FlightPage
class Flight {
  Flight({required this.details, required this.data});
  final FlightDetails details;
  final FlightData data;

  //! Initial empty data to be used as the seed value for the stream
  factory Flight.initialData() {
    return Flight(
      details: FlightDetails(),
      data: FlightData(),
    );
  }

  Flight copyWith({
    Airport? departure,
    Airport? arrival,
    FlightClass? flightClass,
    FlightType? flightType,
  }) {
    //! get existing details and update
    FlightDetails flightDetails = details.copyWith(
      departure: departure,
      arrival: arrival,
      flightClass: flightClass,
      flightType: flightType,
    );
    //! calculate corresponding data
    FlightData flightData = FlightData.fromDetails(flightDetails);
    //! return new object
    return Flight(
      details: flightDetails,
      data: flightData,
    );
  }
}

class FlightDetailsBloc {
  final BehaviorSubject _flightSubject =
      BehaviorSubject<Flight>.seeded(Flight.initialData());
  Stream<Flight> get flightStream => _flightSubject.cast();

  void updateWith({
    Airport? departure,
    Airport? arrival,
    FlightClass? flightClass,
    FlightType? flightType,
  }) {
    //! get new value by updating existing one
    Flight newValue = _flightSubject.value.copyWith(
      departure: departure,
      arrival: arrival,
      flightClass: flightClass,
      flightType: flightType,
    );
    //! add back to the stream
    _flightSubject.add(newValue);
  }

  dispose() {
    _flightSubject.close();
  }
}
