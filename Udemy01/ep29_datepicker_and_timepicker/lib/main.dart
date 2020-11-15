import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'date and time picker',
        home: Scaffold(
            appBar: AppBar(
              title: Text('Demo Date and Time Picker'),
            ),
            body: DateTimeAndTimePicker()
            // Center(
            //   child: Text('Hay Wait a minute'),
            // ),
            ));
  }
}

class DateTimeAndTimePicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Appbar 2nd (Scaffold in Scaffold)')),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 50,
          ),
          RaisedButton(
              child: Text('Pick Date'),
              onPressed: () => _selectedDate(context)),
          RaisedButton(
            child: Text('Pick Time'),
            onPressed: () => _selectedTime(context),
          ),
          Calendar()
        ],
      ),
    );
  }

  Future<void> _selectedDate(inContext) async {
    DateTime selectedDate = await showDatePicker(
        context: inContext,
        initialDate: DateTime.now(),
        firstDate: DateTime(2017),
        lastDate: DateTime(2025));
    print('you picked : $selectedDate');
  }

  Future<void> _selectedTime(inContext) async {
    TimeOfDay selectedTime =
        await showTimePicker(context: inContext, initialTime: TimeOfDay.now());
    print('You picked Time : $selectedTime');
  }
}

class Calendar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CalendarState();
  }
}

class _CalendarState extends State<Calendar> {
  DateTime dateTime;

  /* Constructure */
  _CalendarState() {
    dateTime = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.date_range),
      title:
          //Text(''),
          Text('${dateTime.year} - ${dateTime.month} - ${dateTime.day}'),
      trailing: Icon(Icons.keyboard_arrow_down),
      onTap: () => chooseDate(context),
    );
  }

  Future<void> chooseDate(inContext) async {
    DateTime chooseDateTime = await showDatePicker(
      context: inContext,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
    );

    if (chooseDateTime != null) {
      setState(() {
        dateTime = chooseDateTime;
      });
    }
  }
}
