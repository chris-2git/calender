import 'package:flutter/material.dart';
import 'package:flutter_application_1/calender/events.dart';

class EventList extends StatelessWidget {
  final List<Event> events;

  const EventList({super.key, required this.events});

  @override
  Widget build(BuildContext context) {
    if (events.isEmpty) {
      return const Center(
        child: Text('No events for this day'),
      );
    }

    return ListView.builder(
      itemCount: events.length,
      itemBuilder: (context, index) {
        final event = events[index];
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: ListTile(
            title: Text(event.title),
            subtitle: Text(event.description),
            trailing: Text(
              '${event.date.hour}:${event.date.minute.toString().padLeft(2, '0')}',
            ),
          ),
        );
      },
    );
  }
}
