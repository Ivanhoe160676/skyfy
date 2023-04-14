// ignore_for_file: overridden_fields, avoid_print
import 'package:skyfy/src/data/services/airport_service.dart';
import 'package:flutter/material.dart';

class AirportSearch extends SearchDelegate {
  @override
  final String searchFieldLabel;
  final List history;

  AirportSearch(this.searchFieldLabel, this.history);

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            if (query.isEmpty) {
              close(context, null);
            } else {
              query = '';
            }
          })
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        icon: const Icon(Icons.arrow_back_ios),
        onPressed: () => close(context, null));
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.trim().isEmpty) {
      return const Text('No results');
    }

    final countryService = AirportService();
    // query!
    return FutureBuilder(
      future: countryService.getAirportsByName(),
      builder: (_, AsyncSnapshot snapshot) {
        if (snapshot.hasError) {
          return const ListTile(title: Text('There is nothing with that term'));
        }

        if (snapshot.hasData) {
          // crear la lista
          return _showAirports(snapshot.data);
        } else {
          // Loading
          return const Center(child: CircularProgressIndicator(strokeWidth: 4));
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return _showAirports(history);
  }

  Widget _showAirports(List airports) {
    return ListView.builder(
      itemCount: airports.length,
      itemBuilder: (context, i) {
        final airport = airports[i];

        return ListTile(
          leading: Text(airport.icao),
          title: Text(airport.name),
          subtitle: Text(airport.city),
          trailing: Text(airport.country),
          onTap: () {
            // print( airport );
            close(context, airport);
          },
        );
      },
    );
  }
}
