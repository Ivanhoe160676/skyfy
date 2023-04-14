import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:skyfy/src/tools/app_colors.dart';
import 'package:skyfy/src/ui/global/widgets/app_widget.dart';
import 'package:skyfy/src/ui/global/widgets/drawer_widget.dart';
import 'package:skyfy/src/ui/screens/payment/payment_process_screen.dart';
import 'package:skyfy/src/ui/screens/payment/widgets/expiration_text_field.dart';
import 'package:skyfy/src/ui/screens/payment/widgets/flip_card.dart';
import 'package:skyfy/src/ui/screens/settings/widgets/settings_widgets.dart';
import 'package:skyfy/src/ui/utils/palette.dart';

class PaymentScreen extends StatefulWidget {
  static String tag = '/PaymentScreen';

  const PaymentScreen({super.key});

  @override
  PaymentScreenState createState() => PaymentScreenState();
}

class PaymentScreenState extends State<PaymentScreen> {
  GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();

  var cardNumberCont = TextEditingController();
  var cardHolderCont = TextEditingController();
  var expiryDateCont = TextEditingController(text: 'MM/YY');
  var securityCodeCont = TextEditingController();

  var cardHolderFocus = FocusNode();
  var expiryDateFocus = FocusNode();
  var securityCodeFocus = FocusNode();

  var isFocusOnSecurityCode = false;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    securityCodeFocus.addListener(() {
      cardKey.currentState!.toggleCard();

      setState(() {});
    });
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  void dispose() {
    securityCodeFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Scaffold(
        appBar: appBar(context, 'Payment'),
        drawer: const DrawerWidget(),
        body: Align(
          alignment: Alignment.topCenter,
          child: SizedBox(
            width: dynamicWidth(context),
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  SizedBox(
                    height: 200,
                    child: FlipCard(
                      key: cardKey,
                      front: Container(
                        decoration: BoxDecoration(
                            color: appColorPrimary.withOpacity(0.9),
                            borderRadius: BorderRadius.circular(8)),
                        child: Stack(
                          children: [
                            Positioned(
                              height: 40,
                              right: 8,
                              top: 8,
                              child: Image.asset(
                                  'assets/images/ic_mastercard.png'),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FittedBox(
                                  child: Text(
                                    cardNumberCont.text
                                        .padRight(16, '*')
                                        .replaceAllMapped(RegExp(r".{4}"),
                                            (match) => "${match.group(0)} "),
                                    style: boldTextStyle(size: 24),
                                  ),
                                ),
                                30.height,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Card Holder',
                                        style: primaryTextStyle(size: 16)),
                                    Text('Expiry',
                                        style: primaryTextStyle(size: 16)),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      cardHolderCont.text,
                                      style: boldTextStyle(size: 24),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ).expand(),
                                    Text(expiryDateCont.text,
                                        style: boldTextStyle(size: 24)),
                                  ],
                                ),
                              ],
                            ).paddingOnly(left: 16, right: 16),
                          ],
                        ),
                      ),
                      back: Container(
                        decoration: BoxDecoration(
                            color: appColorPrimary.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(8)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(height: 40, color: Colors.black),
                            20.height,
                            Row(
                              children: [
                                Container(
                                    height: 40,
                                    color: Colors.black38,
                                    width: (dynamicWidth(context)) * 0.6),
                                20.width,
                                Text(securityCodeCont.text,
                                    style: boldTextStyle(size: 24)),
                              ],
                            ),
                            20.height,
                            Container(height: 40, color: Colors.black12),
                          ],
                        ),
                      ),
                    ),
                  ),
                  40.height,
                  TextField(
                    controller: cardNumberCont,
                    keyboardType: TextInputType.number,
                    style: primaryTextStyle(),
                    decoration: InputDecoration(
                      labelText: 'Card Number',
                      counterText: '',
                      border: const OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Palette.blueSkyFy)),
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: appColorPrimary)),
                      labelStyle: secondaryTextStyle(),
                    ),
                    maxLength: 16,
                    textInputAction: TextInputAction.next,
                    onChanged: (s) {
                      setState(() {});
                    },
                    onSubmitted: (s) {
                      FocusScope.of(context).requestFocus(expiryDateFocus);
                    },
                  ),
                  16.height,
                  Row(
                    children: [
                      ExpirationFormField(
                        controller: expiryDateCont,
                        style: primaryTextStyle(),
                        focusNode: expiryDateFocus,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          labelText: 'Expiry Date',
                          border: const OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Palette.blueSkyFy)),
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: appColorPrimary)),
                          labelStyle: secondaryTextStyle(),
                          counterText: '',
                        ),
                      ).expand(),
                      /*TextField(
                        controller: expiryDateCont,
                        keyboardType: TextInputType.datetime,
                        style: primaryTextStyle(),
                        focusNode: expiryDateFocus,
                        textInputAction: TextInputAction.next,
                        maxLength: 5,
                        decoration: InputDecoration(
                          labelText: 'Expiry Date',
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: appStore.textSecondaryColor)),
                          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: appColorPrimary)),
                          labelStyle: secondaryTextStyle(),
                          counterText: '',
                        ),
                        onChanged: (s) {
                          setState(() {});
                        },
                        onSubmitted: (s) {
                          FocusScope.of(context).requestFocus(securityCodeFocus);
                        },
                      ).expand(),*/
                      16.width,
                      TextField(
                        controller: securityCodeCont,
                        keyboardType: TextInputType.number,
                        style: primaryTextStyle(),
                        focusNode: securityCodeFocus,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          labelText: 'Security Code',
                          border: const OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Palette.blueSkyFy)),
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: appColorPrimary)),
                          labelStyle: secondaryTextStyle(),
                          counterText: '',
                        ),
                        maxLength: 3,
                        onChanged: (s) {
                          setState(() {});
                        },
                        onSubmitted: (s) {
                          FocusScope.of(context).requestFocus(cardHolderFocus);
                        },
                      ).expand(),
                    ],
                  ),
                  16.height,
                  TextField(
                    controller: cardHolderCont,
                    textCapitalization: TextCapitalization.words,
                    focusNode: cardHolderFocus,
                    style: primaryTextStyle(),
                    decoration: InputDecoration(
                      labelText: 'Card Holder',
                      border: const OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Palette.blueSkyFy)),
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: appColorPrimary)),
                      labelStyle: secondaryTextStyle(),
                    ),
                    onChanged: (s) {
                      setState(() {});
                    },
                  ),
                  20.height,
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(12),
                    decoration: boxDecorationRoundedWithShadow(8,
                        backgroundColor: appColorPrimary),
                    child: Text('Proceed to Pay',
                        style: boldTextStyle(color: white)),
                  ).onTap(() {
                    hideKeyboard(context);

                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Container(
                          padding: const EdgeInsets.all(16),
                          height: 150,
                          constraints: dynamicBoxConstraints(),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Choose one', style: boldTextStyle()),
                              20.height,
                              Row(
                                children: [
                                  Container(
                                    height: 60,
                                    decoration: boxDecorationWithRoundedCorners(
                                        backgroundColor: Colors.green),
                                    alignment: Alignment.center,
                                    child: Text('Success',
                                        style: boldTextStyle(color: white)),
                                  ).onTap(() {
                                    finish(context);
                                    const PaymentProcessScreen(
                                      isSuccessFul: true,
                                    ).launch(context);
                                  }).expand(),
                                  16.width,
                                  Container(
                                    height: 60,
                                    decoration: boxDecorationWithRoundedCorners(
                                        backgroundColor: Colors.red),
                                    alignment: Alignment.center,
                                    child: Text('Fail',
                                        style: boldTextStyle(color: white)),
                                  ).onTap(() {
                                    finish(context);
                                    const PaymentProcessScreen(
                                      isSuccessFul: false,
                                    ).launch(context);
                                  }).expand(),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
