import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateScreen extends StatefulWidget {
  const DateScreen({Key? key}) : super(key: key);

  @override
  State<DateScreen> createState() => _DateScreenState();
}

class _DateScreenState extends State<DateScreen> {
  final DateFormat _dateFormat = DateFormat('dd-MM-yyyy');
  DateTime _selectedDate = DateTime.now();

  void _showDateIOS(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext builder) {
        return Container(
          padding: EdgeInsets.all(16.0),
          color: Colors.white,
          height: MediaQuery.of(context).copyWith().size.height * 0.35,
          child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.date,
            onDateTimeChanged: (value) {
              setState(() {
                _selectedDate = value;
              });
            },
            initialDateTime: DateTime.now(),
            minimumYear: 2000,
            maximumYear: 3000,
          ),
        );
      },
    );
  }

  void _showDateAndroid(context) async {
    final datePick = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: _selectedDate.subtract(const Duration(days: 30)),
      lastDate: DateTime(_selectedDate.year + 1),
    );

    if (datePick != null) {
      setState(() {
        _selectedDate = datePick;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Colors.lightBlueAccent,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Text(
                'Tanggal Terpilih: ${_dateFormat.format(_selectedDate)}',
                style: TextStyle(fontSize: 18.0, color: Colors.black),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.orangeAccent,
                onPrimary: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
              ),
              onPressed: () => _showDateAndroid(context),
              child: const Text('Pilih Tanggal untuk Android'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.orangeAccent,
                onPrimary: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
              ),
              onPressed: () => _showDateIOS(context),
              child: const Text('Pilih Tanggal untuk iOS'),
            ),
          ],
        ),
      ),
    );
  }
}
