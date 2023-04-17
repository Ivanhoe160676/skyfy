import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:skyfy/src/ui/screens/settings/widgets/settings_widgets.dart';

class DataTableSkyFy extends StatefulWidget {
  static String tag = '/data_table_screen';

  const DataTableSkyFy({super.key});

  @override
  DataTableSkyFyState createState() => DataTableSkyFyState();
}

class DataTableSkyFyState extends State<DataTableSkyFy> {
  late bool sort;
  List<aircrafts> selectedList = [];
  List<aircrafts> aircraftsdetails1 = [
    aircrafts(
      brand: '1',
      model: 'john',
      register: 'john@gmail.com',
      year: 'Designer',
      company: '12-03-1997',
      status: 'Mumbai',
    ),
    aircrafts(
      brand: '2',
      model: 'Lee',
      register: 'Lee@gmail.com',
      year: 'Designer',
      company: '12-07-1997',
      status: 'Mumbai',
    ),
  ];
  List<aircrafts> aircraftsdetails = [
    aircrafts(
      brand: '1',
      model: 'john',
      register: 'john@gmail.com',
      year: 'Designer',
      company: '12-03-1997',
      status: 'Mumbai',
    ),
    aircrafts(
      brand: '2',
      model: 'Lee',
      register: 'Lee@gmail.com',
      year: 'Designer',
      company: '12-07-1997',
      status: 'Mumbai',
    ),
  ];

  onSelectedRow(bool? selected, aircrafts data) async {
    setState(() {
      if (selected!) {
        selectedList.add(data);
      } else {
        selectedList.remove(data);
      }
    });
  }

  onSortColumn(int columnIndex, bool ascending) {
    if (columnIndex == 1) {
      if (ascending) {
        aircraftsdetails1.sort((a, b) => a.model!.compareTo(b.model!));
      } else {
        aircraftsdetails1.sort((a, b) => b.model!.compareTo(a.model!));
      }
    }
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    sort = false;
    setState(() {});
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    Widget mHeading(var value) {
      return Text(value, style: boldTextStyle());
    }

    return SafeArea(
      child: Scaffold(
        appBar: appBar(context, 'Data Table'),
        body: ListView(
          padding: const EdgeInsets.all(16),
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          children: [
            Text('Simple Data table', style: boldTextStyle()).paddingBottom(5),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: <DataColumn>[
                  DataColumn(label: mHeading('brand'), tooltip: 'brand'),
                  DataColumn(label: mHeading('model')),
                  DataColumn(label: mHeading('register')),
                  DataColumn(label: mHeading('year')),
                  DataColumn(label: mHeading('company')),
                  DataColumn(label: mHeading('status')),
                ],
                rows: aircraftsdetails
                    .map(
                      (data) => DataRow(
                        cells: [
                          DataCell(Text('Cyrrus', style: secondaryTextStyle())),
                          DataCell(Text('Cyrrus', style: secondaryTextStyle())),
                          DataCell(
                              Text('ABCD-123456', style: secondaryTextStyle())),
                          DataCell(Text('2010', style: secondaryTextStyle())),
                          DataCell(Text('online', style: secondaryTextStyle())),
                          DataCell(Text('20', style: secondaryTextStyle())),
                        ],
                      ),
                    )
                    .toList(),
              ).visible(aircraftsdetails.isNotEmpty),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class aircrafts {
  String? brand;
  String? model;
  String? register;
  String? year;
  String? picture;
  String? company;
  String? status;
  String? passengerCapacity;
  String? hours;

  aircrafts(
      {this.brand,
      this.model,
      this.register,
      this.year,
      this.picture,
      this.company,
      this.status,
      this.passengerCapacity,
      this.hours});
}
