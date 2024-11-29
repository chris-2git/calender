import 'package:flutter/material.dart';
import 'package:flutter_application_1/calender/utils.dart';

class CalendarGrid extends StatelessWidget {
  final DateTime selectedDate;
  final Function(DateTime) onDateSelected;

  const CalendarGrid({
    super.key,
    required this.selectedDate,
    required this.onDateSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          _buildMonthHeader(),
          const SizedBox(height: 8),
          _buildWeekdayHeader(),
          _buildCalendarDays(),
        ],
      ),
    );
  }

  Widget _buildMonthHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: const Icon(Icons.chevron_left),
          onPressed: () => onDateSelected(
            DateTime(selectedDate.year, selectedDate.month - 1),
          ),
        ),
        Text(
          CalendarDateUtils.formatMonth(selectedDate),
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        IconButton(
          icon: const Icon(Icons.chevron_right),
          onPressed: () => onDateSelected(
            DateTime(selectedDate.year, selectedDate.month + 1),
          ),
        ),
      ],
    );
  }

  Widget _buildWeekdayHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: CalendarDateUtils.weekdays
          .map((day) => Text(
                day,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ))
          .toList(),
    );
  }

  Widget _buildCalendarDays() {
    final daysInMonth = CalendarDateUtils.getDaysInMonth(selectedDate);

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 7,
        childAspectRatio: 1,
      ),
      itemCount: daysInMonth.length,
      itemBuilder: (context, index) {
        final date = daysInMonth[index];
        final isSelected = CalendarDateUtils.isSameDay(date, selectedDate);
        final isCurrentMonth = date.month == selectedDate.month;

        return GestureDetector(
          onTap: () => onDateSelected(date),
          child: Container(
            margin: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: isSelected ? Theme.of(context).primaryColor : null,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                '${date.day}',
                style: TextStyle(
                  color: isSelected
                      ? Colors.white
                      : isCurrentMonth
                          ? null
                          : Colors.grey,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
