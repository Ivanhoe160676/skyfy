import 'package:flutter/material.dart';
import 'package:skyfy/src/domain/models/company_model.dart';

class CardCompanies extends StatelessWidget {
  final Company company;
  const CardCompanies({super.key, required this.company});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: Card(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
                leading: Image.asset('assets/images/gold.png'),
                title: Text(company.name),
                subtitle: Text(company.address)),
          ],
        ),
      ),
    );
  }
}
