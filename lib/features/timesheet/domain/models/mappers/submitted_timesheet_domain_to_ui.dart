import 'package:flutter_assessment/features/timesheet/domain/models/submitted_timesheet.dart';
import 'package:flutter_assessment/features/timesheet/presentation/entities/submitted_timesheet_ui_model.dart';

class SubmittedTimesheetMapper {
  static List<SubmittedTimeSheetUiModel> fromSubmittedTimesheets(
    List<SubmittedTimesheet> timesheets,
  ) {
    return timesheets
        .map((timesheet) => _mapToTimeSheetUiModel(timesheet))
        .toList();
  }

  static SubmittedTimeSheetUiModel _mapToTimeSheetUiModel(
    SubmittedTimesheet timesheet,
  ) {
    return SubmittedTimeSheetUiModel(
      week: timesheet.week,
      items:
          timesheet.shifts.map((shift) => _mapToShiftUiModel(shift)).toList(),
    );
  }

  static SubmittedShiftUiModel _mapToShiftUiModel(SubmittedShift shift) {
    final dateFormatted = shift.date;
    final expectedDateFormatted = shift.expectedDate;

    return SubmittedShiftUiModel(
      id: shift.id,
      shiftCode: '#${shift.shiftCode}',
      client: shift.client.name,
      clientAddress: shift.client.address?.split(',').take(2).join(',') ?? '',
      amount: '€${shift.totalPayRate.toStringAsFixed(1)}',
      shiftDate: dateFormatted,
      isSelected: false,
      rateInfo:
          'Total: ${shift.totalWorkedHours.toStringAsFixed(0)} Hrs • €${shift.hourlyRate.toStringAsFixed(2)}/hr',
      expectedPaymentDate: 'Payment will be credited by $expectedDateFormatted',
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

  static String _formatExpectedDate(DateTime date) {
    const List<String> months = [
      "Jan",
      "Feb",
      "Mar",
      "Apr",
      "May",
      "Jun",
      "Jul",
      "Aug",
      "Sep",
      "Oct",
      "Nov",
      "Dec",
    ];
    return '${months[date.month - 1]} ${date.day}';
  }
}
