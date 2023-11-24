import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:printing/printing.dart';
import 'package:pdf/widgets.dart' as pw;
class DataToPdf extends StatefulWidget {
  @override
  State<DataToPdf> createState() => _DataToPdfState();
}

class _DataToPdfState extends State<DataToPdf> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Table to PDF Example'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  generateTablePdf().then((pdfBytes) {
                    Printing.layoutPdf(onLayout: (format) {
                      return pdfBytes;
                    });
                  });
                },
                child: Text('Generate PDF'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<Uint8List> generateTablePdf() async {
  final pdf = pw.Document();

  // Define the data for your table
  List<List<String>> tableData = [
    ['Subject 1', 'Subject 2', 'Subject 3'],
    ['Data 1', 'Data 2', 'Data 3'],
    ['Data 4', 'Data 5', 'Data 6'],

  ];

  pdf.addPage(
    pw.Page(
      build: (context) => pw.Table.fromTextArray(
        context: context,
        data: tableData,
        border: pw.TableBorder.all(),
        headerAlignment: pw.Alignment.centerLeft,
        cellAlignment: pw.Alignment.centerLeft,
        headerStyle: pw.TextStyle(fontWeight: pw.FontWeight.bold),
        cellStyle: const pw.TextStyle(),
      ),
    ),
  );

  // Generate the PDF and return it as Uint8List
  return pdf.save();
}