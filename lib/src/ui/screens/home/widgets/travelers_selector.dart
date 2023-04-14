import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skyfy/src/ui/utils/ui.dart';

class TravelersSelector extends StatefulWidget {
  const TravelersSelector({Key? key}) : super(key: key);

  @override
  State<TravelersSelector> createState() => _TravelersSelectorState();
}

class _TravelersSelectorState extends State<TravelersSelector> {
  int index = 0;
  static List<String> values = ['1', '2', '3', '4', '5', '6'];
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: Colors.white,
          padding: const EdgeInsets.only(left: 14),
        ),
        onPressed: () =>
            Utils.showSheet(context, child: _selectTravelers(), onClicked: () {
          Utils.showSnackBar(context, 'You have selected $index passengers');
          Navigator.pop(context);
        }),
        child: buildTravellersView(),
      ),
    );
  }

  _selectTravelers() => SizedBox(
        height: 180,
        child: CupertinoPicker(
            itemExtent: 64,
            onSelectedItemChanged: (index) =>
                setState(() => this.index = index),
            selectionOverlay: CupertinoPickerDefaultSelectionOverlay(
              background: Colors.pink.withOpacity(0.12),
            ),
            children: Utils.modelBuilder<String>(
              values,
              (index, value) {
                final isSelected = this.index == index;
                final color = isSelected ? Colors.pink : Colors.black;
                return Center(
                  child: Text(
                    value,
                    style: TextStyle(color: color, fontSize: 24),
                  ),
                );
              },
            )),
      );

  Widget buildTravellersView() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'TRAVELERS',
              style: GoogleFonts.overpass(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              '01',
              style: GoogleFonts.overpass(fontSize: 20),
            )
          ],
        ),
      ],
    );
  }
}
