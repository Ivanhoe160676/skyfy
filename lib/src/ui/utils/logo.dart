import 'package:flutter/material.dart';

Widget logoSkyfy(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    // ignore: prefer_const_literals_to_create_immutables
    children: <Widget>[
      const Center(
        child: Image(
          image: AssetImage("assets/logos/logo9.png"),
          width: 350.0,
          //height: 190.0,
        ),
      ),
    ],
  );
}
