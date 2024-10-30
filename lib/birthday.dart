import 'package:flutter/material.dart';

class BirthdayInput extends StatefulWidget {
  @override
  _BirthdayInputState createState() => _BirthdayInputState();
}

class _BirthdayInputState extends State<BirthdayInput> {
  DateTime? _selectedDate;
  int? _selectedDay;
  int? _selectedMonth;
  int? _selectedYear;
  final TextEditingController _dayController = TextEditingController();
  final TextEditingController _monthController = TextEditingController();
  final TextEditingController _yearController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  List<int> _getYears() {
    return List.generate(100, (index) => DateTime.now().year - index);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          // Date Picker
          Text(
            _selectedDate == null
                ? 'Select your birthday'
                : 'Birthday: ${_selectedDate!.toLocal()}'.split(' ')[0],
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () => _selectDate(context),
            child: Text('Pick a date'),
          ),
          SizedBox(height: 20),

          // Dropdown Menus
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DropdownButton<int>(
                hint: Text('Day'),
                value: _selectedDay,
                onChanged: (value) {
                  setState(() {
                    _selectedDay = value;
                  });
                },
                items: List.generate(31, (index) => index + 1)
                    .map((day) => DropdownMenuItem(
                          value: day,
                          child: Text(day.toString()),
                        ))
                    .toList(),
              ),
              SizedBox(width: 20),
              DropdownButton<int>(
                hint: Text('Month'),
                value: _selectedMonth,
                onChanged: (value) {
                  setState(() {
                    _selectedMonth = value;
                  });
                },
                items: List.generate(12, (index) => index + 1)
                    .map((month) => DropdownMenuItem(
                          value: month,
                          child: Text(month.toString()),
                        ))
                    .toList(),
              ),
              SizedBox(width: 20),
              DropdownButton<int>(
                hint: Text('Year'),
                value: _selectedYear,
                onChanged: (value) {
                  setState(() {
                    _selectedYear = value;
                  });
                },
                items: _getYears()
                    .map((year) => DropdownMenuItem(
                          value: year,
                          child: Text(year.toString()),
                        ))
                    .toList(),
              ),
            ],
          ),
          SizedBox(height: 20),

          // Text Fields
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: TextField(
                  controller: _dayController,
                  decoration: InputDecoration(labelText: 'Day'),
                  keyboardType: TextInputType.number,
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: TextField(
                  controller: _monthController,
                  decoration: InputDecoration(labelText: 'Month'),
                  keyboardType: TextInputType.number,
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: TextField(
                  controller: _yearController,
                  decoration: InputDecoration(labelText: 'Year'),
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
