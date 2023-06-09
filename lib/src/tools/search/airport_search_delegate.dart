import 'package:flutter/material.dart';
import 'package:skyfy/src/domain/models/airports.models.dart';
import 'package:skyfy/src/tools/search/airport_lookup.dart';

class AirportSearchDelegate extends SearchDelegate<Airport> {
  AirportSearchDelegate({required this.airportLookup});
  final AirportLookup airportLookup;

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      tooltip: 'Back',
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return buildMatchingSuggestions(context);
  }

  @override
  Widget buildResults(BuildContext context) {
    return buildMatchingSuggestions(context);
  }

  Widget buildMatchingSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return Container();
    }
    final searched = airportLookup.searchString(query);
    if (searched.isEmpty) {
      return const AirportSearchPlaceholder(title: 'No results');
    }

    return ListView.builder(
      itemCount: searched.length,
      itemBuilder: (context, index) {
        return AirportSearchResultTile(
          airport: searched[index],
          searchDelegate: this,
        );
      },
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return query.isEmpty
        ? []
        : <Widget>[
            IconButton(
              tooltip: 'Clear',
              icon: const Icon(Icons.clear),
              onPressed: () {
                query = '';
                showSuggestions(context);
              },
            )
          ];
  }
}

class AirportSearchPlaceholder extends StatelessWidget {
  const AirportSearchPlaceholder({Key? key, required this.title})
      : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Center(
      child: Text(
        title,
        style: theme.textTheme.displayLarge,
        textAlign: TextAlign.center,
      ),
    );
  }
}

class AirportSearchResultTile extends StatelessWidget {
  const AirportSearchResultTile(
      {Key? key, required this.airport, required this.searchDelegate})
      : super(key: key);

  final Airport airport;
  final SearchDelegate<Airport> searchDelegate;

  @override
  Widget build(BuildContext context) {
    final title = '${airport.name} (${airport.icao})';
    final subtitle = '${airport.city}, ${airport.country}';
    final ThemeData theme = Theme.of(context);
    return ListTile(
      dense: true,
      title: Text(
        title,
        style: theme.textTheme.bodyMedium,
        textAlign: TextAlign.start,
      ),
      subtitle: Text(
        subtitle,
        style: theme.textTheme.bodyLarge,
        textAlign: TextAlign.start,
      ),
      onTap: () => searchDelegate.close(context, airport),
    );
  }
}
