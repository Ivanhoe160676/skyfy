// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:skyfy/src/ui/screens/settings/widgets/settings_widgets.dart';

class PaymentProcessScreen extends StatefulWidget {
  final bool? isSuccessFul;

  const PaymentProcessScreen({super.key, this.isSuccessFul});

  @override
  _PaymentProcessScreenState createState() => _PaymentProcessScreenState();
}

class _PaymentProcessScreenState extends State<PaymentProcessScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, ''),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              widget.isSuccessFul!
                  ? 'assets/images/successfull.png'
                  : 'assets/images/cancel.png',
              height: 100,
              width: 100,
            ),
            8.height,
            Text(
              widget.isSuccessFul! ? 'Payment Successful' : 'Payment Failed',
              style: boldTextStyle(
                  color: widget.isSuccessFul! ? greenColor : redColor),
            )
          ],
        ),
      ),
    );
  }
}
