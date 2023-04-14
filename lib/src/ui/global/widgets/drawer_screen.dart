// ignore_for_file: library_private_types_in_public_api

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:skyfy/src/ui/utils/palette.dart';

class DrawerScreen extends StatefulWidget {
  static String tag = '/drawer_screen';

  const DrawerScreen({super.key});

  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    await Future.delayed(const Duration(seconds: 1));
    scaffoldKey.currentState!.openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Palette.lightSkyfy,
        title: const Text('With Custom Shape',
            style: TextStyle(color: Colors.white, fontSize: 22)),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.white),
          onPressed: () {
            scaffoldKey.currentState!.openDrawer();
          },
        ),
      ),
      drawer: ClipPath(
        clipper: OvalRightBorderClipper(),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Drawer(
          child: Container(
            padding: const EdgeInsets.only(left: 16.0, right: 40),
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerRight,
                    colors: <Color>[
                  Color(0xff5352fa),
                  Color(0xff1b1c1c),
                ])),
            width: 300,
            child: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.all(8),
                      child: IconButton(
                        icon: const Icon(
                          Icons.power_settings_new,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          scaffoldKey.currentState!.openEndDrawer();
                        },
                      ),
                    ),
                    Container(
                      height: 90,
                      width: 90,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(width: 2, color: Colors.orange),
                        image: const DecorationImage(
                            image: CachedNetworkImageProvider(
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTD8u1Nmrk78DSX0v2i_wTgS6tW5yvHSD7o6g&usqp=CAU')),
                      ),
                    ),
                    const SizedBox(height: 5.0),
                    const Text(
                      "John Dow",
                      style: TextStyle(
                          color: Colors.amber,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600),
                    ),
                    const Text("JohnDoe@gmail.com",
                        style: TextStyle(color: Colors.amber, fontSize: 16.0)),
                    30.height,
                    itemList(const Icon(Icons.home, color: Colors.red), "Home"),
                    const Divider(),
                    15.height,
                    itemList(const Icon(Icons.person_pin, color: Colors.amber),
                        "My profile"),
                    const Divider(),
                    15.height,
                    itemList(const Icon(Icons.message, color: Colors.amber),
                        "Messages"),
                    const Divider(),
                    15.height,
                    itemList(
                        const Icon(Icons.notifications, color: Colors.amber),
                        "Notifications"),
                    const Divider(),
                    15.height,
                    itemList(const Icon(Icons.settings, color: Colors.amber),
                        "Settings"),
                    const Divider(),
                    15.height,
                    itemList(const Icon(Icons.email, color: Colors.amber),
                        "Contact us"),
                    const Divider(),
                    15.height,
                    itemList(
                        const Icon(Icons.info_outline, color: Colors.amber),
                        "Help"),
                    const Divider(),
                    15.height,
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      body: MaterialButton(
        onPressed: () {
          scaffoldKey.currentState!.openDrawer();
        },
        padding: const EdgeInsets.all(16),
        color: Palette.blueSkyLighter,
        child: Text('Open Drawer', style: primaryTextStyle(color: whiteColor)),
      ).center(),
    );
  }

  Widget itemList(Widget icon, String title) {
    return Row(
      children: [
        icon,
        10.width,
        Text(title, style: const TextStyle(color: Colors.white)),
      ],
    ).onTap(() {
      scaffoldKey.currentState!.openEndDrawer();
      toasty(context, title);
    });
  }
}

class OvalRightBorderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, 0);
    path.lineTo(size.width - 50, 0);
    path.quadraticBezierTo(
        size.width, size.height / 4, size.width, size.height / 2);
    path.quadraticBezierTo(size.width, size.height - (size.height / 4),
        size.width - 40, size.height);
    path.lineTo(0, size.height);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
