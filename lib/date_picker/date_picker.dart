import 'package:flutter/material.dart';

class DatePicker extends StatefulWidget {
  const DatePicker({super.key});

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  DateTime? selectedDate;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedDate = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Date Picker"),
      ),
      body: ListView(children: [
        Container(
          height: 100,
          child: FlutterLogo(),
        ),
        SizedBox(height: 10.0),
        CalendarDatePicker(
          initialDate: selectedDate!,
          firstDate:  DateTime(2015, 1, 1),
          lastDate:  DateTime(2024, 1, 1),
          onDateChanged: (date) {
            setState(() {
              selectedDate = date;
            });
          },
        ),
        Text("Selected Date: $selectedDate"),
      ]),
    );
  }
}