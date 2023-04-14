// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:skyfy/src/ui/global/widgets/drawer_widget.dart';
import 'package:skyfy/src/ui/utils/ui.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Observer(
          builder: (context) => Scaffold(
                appBar: AppBar(
                  backgroundColor: Palette.darkSkyfy,
                  iconTheme: const IconThemeData(
                    color: Colors.white,
                  ),
                  title: const Text('Dashboard'),
                ),
                drawer: const DrawerWidget(),
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      Table(
                        children: const [
                          TableRow(children: [
                            _SingleCard(
                              icon: Icons.airplanemode_active_outlined,
                              title: 'Total Flights',
                              subtitle: '2365',
                            )
                          ]),
                          TableRow(children: [
                            _SingleCard(
                              icon: Icons.monetization_on_outlined,
                              title: 'Total Profits',
                              subtitle: '\$ 322365',
                            )
                          ]),
                          TableRow(children: [
                            _SingleCard(
                              icon: Icons.person_3,
                              title: 'Total Clients',
                              subtitle: '9865',
                            )
                          ]),
                          TableRow(children: [
                            _SingleCard(
                              icon: Icons.factory_outlined,
                              title: 'Total Companies',
                              subtitle: '23',
                            )
                          ]),
                          TableRow(children: [
                            _SingleCard(
                              icon: Icons.people_alt,
                              title: 'Total Pilots',
                              subtitle: '123',
                            )
                          ]),
                        ],
                      ),
                      const SizedBox(
                        height: 40,
                      )
                    ],
                  ),
                ),
              )),
    );
  }
}

class _SingleCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const _SingleCard(
      {super.key,
      required this.icon,
      required this.title,
      required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      margin: const EdgeInsets.only(left: 30, right: 30, top: 35, bottom: 10),
      decoration: BoxDecoration(
          color: Palette.lightSkyfy, borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: CircleAvatar(
                    backgroundColor: Palette.darkSkyfy,
                    radius: 30,
                    child: Icon(
                      icon,
                      size: 30,
                      color: Colors.white,
                    )),
              ),
              const SizedBox(
                width: 50,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Palette.blueSkyFy),
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(fontSize: 14, color: Palette.darkSkyfy),
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
