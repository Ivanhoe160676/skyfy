import 'dart:async';
import 'package:flutter/material.dart';
import 'package:skyfy/src/data/services/flight_class.dart';
import 'package:skyfy/src/data/services/flight_details_bloc.dart';
import 'package:skyfy/src/domain/models/airports.models.dart';
import 'package:skyfy/src/tools/search/airport_lookup.dart';
import 'package:skyfy/src/tools/search/airport_search_delegate.dart';
import 'package:skyfy/src/ui/utils/ui.dart';
import 'package:auto_size_text/auto_size_text.dart';

List<Airport> history = [];

class FlightDetailsCard extends StatelessWidget {
  const FlightDetailsCard({
    Key? key,
    required this.flightDetails,
    required this.flightDetailsBloc,
    required this.airportLookup,
  }) : super(key: key);
  final FlightDetails? flightDetails;
  final FlightDetailsBloc flightDetailsBloc;
  final AirportLookup airportLookup;

  final Map<FlightClass, Widget> flightClassChildren =
      const <FlightClass, Widget>{
    FlightClass.bronze: Text('Bronze'),
    FlightClass.silver: Text('Silver'),
    FlightClass.gold: Text('Gold'),
  };

  final Map<FlightType, Widget> flightTypeChildren = const <FlightType, Widget>{
    FlightType.oneWay: Text('One Way'),
    FlightType.roundTrip: Text('Round Trip'),
    FlightType.multicity: Text('Multi City'),
  };

  Future<Airport?> _showSearch(BuildContext context) async {
    return await showSearch<Airport>(
        context: context,
        delegate: AirportSearchDelegate(airportLookup: airportLookup));
  }

  void _selectDeparture(BuildContext context) async {
    final departure = await _showSearch(context);
    flightDetailsBloc.updateWith(departure: departure);
  }

  void _selectArrival(BuildContext context) async {
    final arrival = await _showSearch(context);
    flightDetailsBloc.updateWith(arrival: arrival);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: AirportWidget(
                iconData: Icons.flight_takeoff,
                title: Text('Departing From', style: TextStyles.caption),
                airport: flightDetails!.departure,
                onPressed: () => _selectDeparture(context),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: AirportWidget(
                iconData: Icons.flight_land,
                title: Text('Flying to', style: TextStyles.caption),
                airport: flightDetails!.arrival,
                onPressed: () => _selectArrival(context),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Container(height: 1, color: Colors.black26),
      ],
    );
  }
}

class AirportWidget extends StatefulWidget {
  const AirportWidget({
    Key? key,
    required this.iconData,
    required this.title,
    this.airport,
    required this.onPressed,
  }) : super(key: key);

  final IconData iconData;
  final Widget title;
  final Airport? airport;
  final VoidCallback onPressed;

  @override
  AirportWidgetState createState() => AirportWidgetState();
}

class AirportWidgetState extends State<AirportWidget> {
  bool _isAirportSelected = false;
  Airport? _selectedAirport;

  void _onAirportSelected(Airport airport) {
    setState(() {
      _isAirportSelected = true;
      _selectedAirport = airport;
    });
  }

  @override
  Widget build(BuildContext context) {
    final airportDisplayName = _selectedAirport != null
        ? '${_selectedAirport!.citycode}\n${_selectedAirport!.icao},'
        : (_selectedAirport == null && widget.airport != null)
            ? '${widget.airport!.citycode} (${widget.airport!.icao})'
            : 'Select...';

    return InkWell(
        onTap: () {
          widget.onPressed();
          if (widget.airport != null) {
            _onAirportSelected(widget.airport!);
          }
        },
        child: SizedBox(
            width: MediaQuery.of(context).size.width *
                0.45, // establece el ancho del nuevo widget
            height: _isAirportSelected
                ? 80
                : 40, // establece la altura del nuevo widget
            child: Visibility(
              visible:
                  _isAirportSelected, // establece la visibilidad del widget inicial
              replacement: Container(
                width: MediaQuery.of(context).size.width * 0.45,
                decoration: BoxDecoration(color: Colors.grey[350]),
                child: Padding(
                  padding: const EdgeInsets.only(left: 17.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(widget.iconData, color: Palette.blueSky),
                      const SizedBox(width: 16.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            widget.title,
                            const VerticalSpacing(height: 4.0),
                            AutoSizeText(
                              airportDisplayName,
                              style: const TextStyle(fontSize: 16.0),
                              minFontSize: 13.0,
                              maxLines: 4,
                              overflow: TextOverflow.clip,
                            ),
                            if (_selectedAirport != null) ...[
                              CardResults(selectedAirport: _selectedAirport),
                            ],
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              child: CardResults(selectedAirport: _selectedAirport),
            )));
  }
}

class CardResults extends StatelessWidget {
  const CardResults({
    super.key,
    required Airport? selectedAirport,
  }) : _selectedAirport = selectedAirport;

  final Airport? _selectedAirport;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: Colors.grey),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            _selectedAirport!.citycode,
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 2.0),
          Text(
            '${_selectedAirport!.city}, ${_selectedAirport!.country}',
            style: const TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 2.0),
          Text(
            _selectedAirport!.icao!,
            style: const TextStyle(fontSize: 10.0),
          ),
          const SizedBox(height: 2.0),
          Text(
            _selectedAirport!.name,
            style: const TextStyle(
              fontSize: 10.0,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class VerticalSpacing extends SizedBox {
  const VerticalSpacing({Key? key, double height = 16.0})
      : super(key: key, height: height);
}

class AddLeg extends StatelessWidget {
  const AddLeg({
    Key? key,
    required this.flightDetails,
    required this.flightDetailsBloc,
    required this.airportLookup,
  }) : super(key: key);
  final FlightDetails? flightDetails;
  final FlightDetailsBloc flightDetailsBloc;
  final AirportLookup airportLookup;

  Future<Airport?> _showSearch(BuildContext context) async {
    return await showSearch<Airport>(
        context: context,
        delegate: AirportSearchDelegate(airportLookup: airportLookup));
  }

  void _selectLeg(BuildContext context) async {
    final departure = await _showSearch(context);
    flightDetailsBloc.updateWith(departure: departure);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: AirportWidget(
                iconData: Icons.flight_takeoff,
                title: Text('Add Leg', style: TextStyles.caption),
                airport: flightDetails!.departure,
                onPressed: () => _selectLeg(context),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        //Container(height: 1, color: Colors.black26),
      ],
    );
  }
}
