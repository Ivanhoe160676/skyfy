import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skyfy/src/ui/utils/ui.dart';
import 'package:intl/intl.dart';

class ReturnSelector extends StatefulWidget {
  const ReturnSelector({super.key});

  @override
  State<ReturnSelector> createState() => _ReturnSelectorState();
}

class _ReturnSelectorState extends State<ReturnSelector> {
  DateTime date = DateTime.now();
  String formatDate(DateTime date) => DateFormat("dd MMM yyyy").format(date);
  bool autoValidate = true;
  bool readOnly = false;
  bool showSegmentedControl = true;
  final formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: Colors.white,
          padding: const EdgeInsets.only(
            left: 16,
          ),
        ),
        onPressed: () =>
            Utils.showSheet(context, child: _selectDate(), onClicked: () {
          final value = DateFormat('dd/MM/yyyy').format(date);
          Utils.showSnackBar(context, 'Return Date "$value');
          Navigator.pop(context);
        }),
        child: buildReturnSelector('RETURN   ', DateTime.now()),
      ),
    );
  }

  _selectDate() => SizedBox(
        height: 180,
        child: CupertinoDatePicker(
          minimumYear: 2015,
          maximumYear: 2100,
          initialDateTime: date,
          mode: CupertinoDatePickerMode.date,
          onDateTimeChanged: (dateTime) => setState(() => date = dateTime),
        ),
      );

  Widget buildReturnSelector(String title, DateTime dateTime) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Row(
          children: [
            Text(
              title,
              style: GoogleFonts.overpass(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(),
            const Icon(
              Icons.calendar_today_outlined,
              color: Colors.grey,
              size: 16,
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: <Widget>[
            Text(
              formatDate(date),
              style: GoogleFonts.overpass(fontSize: 16),
            ),
          ],
        ),
      ],
    );
  }
}
