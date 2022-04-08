import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// The "soruce" of the table
class MyData extends DataTableSource {
  // Generate some made-up data
  final List<Map<String, dynamic>> _data = List.generate(
      200,
      (index) => {
            "id": index,
            "title": "Item $index",
            "price": Random().nextInt(10000),
            "toto": 'TOTO',
          });

  @override
  bool get isRowCountApproximate => false;
  @override
  int get rowCount => _data.length;
  @override
  int get selectedRowCount => 0;
  @override
  DataRow getRow(int index) {
    return DataRow(cells: [
      DataCell(Text(_data[index]['id'].toString())),
      DataCell(Text(_data[index]["title"])),
      DataCell(Text(_data[index]["price"].toString())),
      DataCell(Text(_data[index]["toto"])),
    ]);
  }
}

class MyApp extends StatefulWidget {
  final String title = 'Flutter Sandbox App';

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                DataTable(
                  headingRowColor: MaterialStateProperty.resolveWith((states) {
                    if (states.contains(MaterialState.selected)) {
                      return Colors.red;
                    }
                    return Colors.blue;
                  }),
                  columns: [
                    DataColumn(label: Text('Data')),
                    DataColumn(label: Text('Table')),
                  ],
                  rows: [
                    DataRow(cells: [
                      DataCell(Text('Hello')),
                      DataCell(Text('World')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Hello')),
                      DataCell(Text('Dash')),
                    ]),
                  ],
                ),
                PaginatedDataTable(
                  headingRowColor: MaterialStateProperty.resolveWith((states) {
                    if (states.contains(MaterialState.selected)) {
                      return Colors.red;
                    }
                    return Colors.blue;
                  }),
                  rowsPerPage: 8,
                  columns: [
                    DataColumn(label: Text('Paginated')),
                    DataColumn(label: Text('Data')),
                    DataColumn(label: Text('Table')),
                    DataColumn(label: Text('Toto')),
                  ],
                  source: MyData(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
