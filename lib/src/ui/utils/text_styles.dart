import 'package:flutter/material.dart';

class TextStyles {
  static TextStyle caption =
      const TextStyle(fontSize: 13.0, color: Colors.black54);
}

const kHintTextStyle = TextStyle(
  color: Colors.white54,
  fontFamily: 'OpenSans',
);

const kLabelStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontFamily: 'OpenSans',
);

final kBoxDecorationStyle = BoxDecoration(
  color: const Color.fromRGBO(171, 146, 120, 120),
  borderRadius: BorderRadius.circular(10.0),
  // ignore: prefer_const_literals_to_create_immutables
  boxShadow: [
    const BoxShadow(
      color: Colors.black12,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);
