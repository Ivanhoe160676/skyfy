import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skyfy/src/ui/utils/ui.dart';
import 'package:intl/intl.dart';

class TimeSelector extends StatefulWidget {
  const TimeSelector({super.key});

  @override
  State<TimeSelector> createState() => _TimeSelectorState();
}

class _TimeSelectorState extends State<TimeSelector> {
  final DateTime now = DateTime.now();
  final DateFormat formatter = DateFormat('jm');
  Duration duration = const Duration(hours: 1, minutes: 6);
  bool autoValidate = true;
  bool readOnly = false;
  bool showSegmentedControl = true;
  final formKey = GlobalKey<FormBuilderState>();

  String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    return '$hours:$minutes';
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        ),
        onPressed: () => Utils.showSheet(
          context,
          child: _selectTime(),
          onClicked: () {
            final value = formatDuration(duration);
            Utils.showSnackBar(context, 'Booking Time "$value"');
            Navigator.pop(context);
          },
        ),
        child: buildTimeSelector('TIME', DateTime.now()),
      ),
    );
  }

  _selectTime() => SizedBox(
        height: 180,
        child: CupertinoTimerPicker(
          initialTimerDuration: duration,
          mode: CupertinoTimerPickerMode.hm,
          minuteInterval: 3,
          secondInterval: 1,
          onTimerDurationChanged: (duration) =>
              setState(() => this.duration = duration),
        ),
      );

  Widget buildTimeSelector(String title, DateTime dateTime) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: GoogleFonts.overpass(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(
              width: 10,
            ),
            const Icon(
              Icons.watch_later_outlined,
              color: Colors.grey,
              size: 18,
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              formatDuration(duration),
              style: GoogleFonts.overpass(fontSize: 20),
            ),
          ],
        ),
      ],
    );
  }
}
