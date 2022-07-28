import 'package:collector/utils/extensions/date_time.ext.dart';
import 'package:flutter/material.dart';

class DateContainer extends StatelessWidget {
  final DateTime date;
  final ValueChanged<DateTime> onDateChanged;

  const DateContainer({
    super.key,
    required this.date,
    required this.onDateChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final newDate = await showDatePicker(
          context: context,
          initialDate: date,
          firstDate: date.subtract(const Duration(days: 30)),
          lastDate: date,
        );
        if (newDate != null) {
          final newTime = await showTimePicker(
            context: context,
            initialTime: TimeOfDay.now(),
          );
          if (newTime != null) {
            onDateChanged(
              DateTime(
                newDate.year,
                newDate.month,
                newDate.day,
                newTime.hour,
                newTime.minute,
              ),
            );
          }
        }
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.calendar_today,
            color: Theme.of(context).iconTheme.color?.withOpacity(0.5),
          ),
          const SizedBox(width: 8.0),
          Text(
            date.formatToHumanReadable,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          const SizedBox(width: 16.0),
          Icon(
            Icons.edit,
            color: Theme.of(context).iconTheme.color?.withOpacity(0.5),
            size: 16.0,
          ),
        ],
      ),
    );
  }
}
