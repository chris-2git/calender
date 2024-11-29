import 'package:flutter/material.dart';
import 'package:flutter_application_1/calender/addevent.dart';
import 'package:flutter_application_1/calender/calendergrid.dart';
import 'package:flutter_application_1/calender/eventlist.dart';
import 'package:flutter_application_1/calender/events.dart';
import 'package:flutter_application_1/calender/utils.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime _selectedDate = DateTime.now();
  final List<Event> _events = [];

  void _onDateSelected(DateTime date) {
    setState(() {
      _selectedDate = date;
    });
  }

  void _addEvent(Event event) {
    setState(() {
      _events.add(event);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calendar'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => _showAddEventDialog(context),
          ),
        ],
      ),
      body: Column(
        children: [
          CalendarGrid(
            selectedDate: _selectedDate,
            onDateSelected: _onDateSelected,
          ),
          Expanded(
            child: EventList(
              events: _events
                  .where((event) =>
                      CalendarDateUtils.isSameDay(event.date, _selectedDate))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _showAddEventDialog(BuildContext context) async {
    final event = await showDialog<Event>(
      context: context,
      builder: (context) => AddEventDialog(selectedDate: _selectedDate),
    );

    if (event != null) {
      _addEvent(event);
    }
  }
}
