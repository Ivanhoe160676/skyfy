// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ClassSelector extends StatefulWidget {
  const ClassSelector({super.key});

  @override
  State<ClassSelector> createState() => _ClassSelectorState();
}

class _ClassSelectorState extends State<ClassSelector> {
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text('Select Class', style: (TextStyle(fontSize: 18))),
        Row(
          children: [buttonBronze(), buttonSilver(), buttonGold()],
        )
      ],
    );
  }

  Widget buildClassBtn(Function onTap, AssetImage logo) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 30.0,
        width: 30.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          // ignore: prefer_const_literals_to_create_immutables
          boxShadow: [
            const BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 2),
              blurRadius: 6.0,
            ),
          ],
          image: DecorationImage(
            image: logo,
          ),
        ),
      ),
    );
  }

  Widget buttonBronze() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      width: 120,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            elevation: 5.0,
            padding: const EdgeInsets.all(4.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            )),
        onPressed: () => print('Bronze'),
        child: Row(
          children: [
            const SizedBox(width: 5),
            Container(
              height: 30.0,
              width: 30.0,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                // ignore: prefer_const_literals_to_create_immutables
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0, 2),
                    blurRadius: 6.0,
                  ),
                ],
                image: DecorationImage(
                  image: AssetImage('assets/images/bronze.png'),
                ),
              ),
            ),
            const SizedBox(width: 10),
            const Text(
              'Bronze',
              style: TextStyle(
                color: Color(0xfff7a776),
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'OpenSans',
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buttonSilver() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      width: 120,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            elevation: 5.0,
            padding: const EdgeInsets.all(4.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            )),
        onPressed: () => print('Silver'),
        child: Row(
          children: [
            const SizedBox(width: 5),
            Container(
              height: 30.0,
              width: 30.0,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                // ignore: prefer_const_literals_to_create_immutables
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0, 2),
                    blurRadius: 6.0,
                  ),
                ],
                image: DecorationImage(
                  image: AssetImage('assets/images/silver.png'),
                ),
              ),
            ),
            const SizedBox(width: 10),
            const Text(
              'Silver',
              style: TextStyle(
                color: Color(0xffa5a5a5),
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'OpenSans',
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buttonGold() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      width: 120,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            elevation: 5.0,
            padding: const EdgeInsets.all(4.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            )),
        onPressed: () => print('Gold'),
        child: Row(
          children: [
            const SizedBox(width: 5),
            Container(
              height: 30.0,
              width: 30.0,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                // ignore: prefer_const_literals_to_create_immutables
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0, 2),
                    blurRadius: 6.0,
                  ),
                ],
                image: DecorationImage(
                  image: AssetImage('assets/images/gold.png'),
                ),
              ),
            ),
            const SizedBox(width: 10),
            const Text(
              'Gold',
              style: TextStyle(
                color: Color(0xfff5d487),
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'OpenSans',
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget classBronze() {
    return Visibility(
      visible: isVisible,
      child: Column(
        children: [
          Container(height: 10),
          Text('Class Bronze',
              style: GoogleFonts.overpass(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 30)),
          Container(height: 10),
          Row(
            children: <Widget>[
              Expanded(
                child: TextButton(
                  child: Image.asset('assets/images/Baron.gif'),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget classSilver() {
    return Visibility(
      visible: isVisible,
      child: Column(
        children: [
          Container(height: 10),
          Text('Class Silver',
              style: GoogleFonts.overpass(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 30)),
          Container(height: 10),
          Row(
            children: <Widget>[
              Expanded(
                child: TextButton(
                  child: Image.asset('assets/images/Bonanza360.gif'),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget classGold() {
    return Visibility(
      visible: isVisible,
      child: Column(
        children: [
          Container(height: 10),
          Text('Class Gold',
              style: GoogleFonts.overpass(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 30)),
          Container(height: 10),
          Row(
            children: <Widget>[
              Expanded(
                child: TextButton(
                  child: Image.asset('assets/images/Beechcraft.gif'),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
