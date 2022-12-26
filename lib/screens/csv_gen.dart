import 'package:file_saver/file_saver.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:csv/csv.dart';
import 'package:path_provider/path_provider.dart';

class CsvGenerator extends StatefulWidget {
  const CsvGenerator({super.key});

  @override
  State<CsvGenerator> createState() => _CsvGeneratorState();
}

class _CsvGeneratorState extends State<CsvGenerator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Generate CSV"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Generate CSV File',
            ),
            IconButton(
                onPressed: generateCsv,
                icon: Icon(Icons.abc))
          ],
        ),
      ),
    );
  }

  generateCsv() async {
    List<List<String>> data = [
      ["No.", "Name", "Roll No."],
      ["1", 'Rohan', '101'],
      ["2", 'Vipul', '102'],
      ["3", 'Bosco', '103']
    ];
    String csvData = ListToCsvConverter().convert(data);
    final String directory = (await getApplicationSupportDirectory()).path;
    final path = "$directory/csv-${DateTime.now()}.csv";
    final File file = File(path);
    await file.writeAsString(csvData).then((value) {
      FileSaver.instance.saveAs(
          'user', file.readAsBytesSync(), 'csv', MimeType.CSV);
    });
  }
}
