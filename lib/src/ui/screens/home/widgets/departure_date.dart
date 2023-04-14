// ignore_for_file: library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DepartureDate extends StatefulWidget {
  const DepartureDate({Key? key}) : super(key: key);

  @override
  _DepartureDateState createState() => _DepartureDateState();
}

class _DepartureDateState extends State<DepartureDate> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
                onPressed: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                  _selectDate(context);
                },
                child: Row(
                  children: [
                    buildDateSelector('DEPARTURE   ', DateTime.now()),
                  ],
                ),
              ),
            ),
          ],
        ),
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
          ],
        ),
      ],
    );
  }

  _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime(2040),
    );
    if (picked != null) {
      setState(() {
        // _fecha = picked.toString();
      });
    }
  }

  Widget buildTimeSelector(String title, DateTime dateTime) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: GoogleFonts.overpass(fontSize: 18, color: Colors.grey),
        ),
        Row(
          children: <Widget>[
            Text(
              dateTime.hour.toString().padLeft(2, '0'),
              style: GoogleFonts.overpass(fontSize: 38),
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'AM',
                  style: GoogleFonts.overpass(fontSize: 16),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget buildDateSelector(String title, DateTime dateTime) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Row(
          children: [
            Text(
              title,
              style: GoogleFonts.overpass(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(),
            const Icon(
              Icons.calendar_today_outlined,
              color: Colors.grey,
              size: 18,
            )
          ],
        ),
        Row(
          children: <Widget>[
            Text(
              dateTime.day.toString().padLeft(2, '0'),
              style: GoogleFonts.overpass(fontSize: 38),
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Sep 2021',
                  style: GoogleFonts.overpass(fontSize: 13),
                ),
                Text(
                  'Wednesday',
                  style: GoogleFonts.overpass(fontSize: 13, color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
