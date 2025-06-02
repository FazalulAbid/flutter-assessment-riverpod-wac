import 'package:flutter_assessment/features/timesheet/domain/models/unattended_timesheet.dart';
import 'package:flutter_assessment/features/timesheet/presentation/entities/unattended_timesheet_ui_model.dart';

class UnattendedTimesheetMapper {
  static List<UnattendedTimesheetUiModel> fromUnattendedTimesheets(
    List<UnattendedTimesheet> timesheets,
  ) {
    return timesheets.map(_mapToUiModel).toList();
  }

  static UnattendedTimesheetUiModel _mapToUiModel(UnattendedTimesheet shift) {
    final dateFormatted = shift.date;
    return UnattendedTimesheetUiModel(
      id: shift.shiftId,
      client: shift.client,
      county: shift.county,
      shiftTiming: shift.shiftTiming,
      distance: shift.distance.toString(),
      shiftDate: dateFormatted,
      timeRange: '${shift.startTime} - ${shift.endTime}',
      amount: '€${shift.totalPayRate.toStringAsFixed(1)}',
      rateInfo:
          'Total: ${shift.duration.toStringAsFixed(0)} Hrs • €${shift.hourlyRate.toStringAsFixed(2)}/hr',
    );
  }

  static String _formatDate(DateTime date) {
    const List<String> weekdays = [
      "MON",
      "TUE",
      "WED",
      "THU",
      "FRI",
      "SAT",
      "SUN",
    ];
    const List<String> months = [
      "JAN",
      "FEB",
      "MAR",
      "APR",
      "MAY",
      "JUN",
      "JUL",
      "AUG",
      "SEP",
      "OCT",
      "NOV",
      "DEC",
    ];
    return '${date.day.toString().padLeft(2, '0')} ${months[date.month - 1]} ${weekdays[date.weekday - 1]}';
  }
}
