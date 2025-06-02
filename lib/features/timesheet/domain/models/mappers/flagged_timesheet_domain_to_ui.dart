import 'package:flutter_assessment/features/timesheet/domain/models/flagged_timesheet.dart';
import 'package:flutter_assessment/features/timesheet/presentation/entities/flagged_timesheet_ui_model.dart';

class FlaggedTimesheetMapper {
  static List<FlaggedTimeSheetUiModel> fromFlaggedTimesheets(
    List<FlaggedTimesheet> timesheets,
  ) {
    return timesheets
        .map((timesheet) => _mapToTimeSheetUiModel(timesheet))
        .toList();
  }

  static FlaggedTimeSheetUiModel _mapToTimeSheetUiModel(
    FlaggedTimesheet timesheet,
  ) {
    return FlaggedTimeSheetUiModel(
      week: timesheet.week,
      items:
          timesheet.shifts.map((shift) => _mapToShiftUiModel(shift)).toList(),
    );
  }

  static FlaggedShiftUiModel _mapToShiftUiModel(FlaggedShift shift) {
    final dateFormatted = shift.date;
    final expectedDateFormatted =
        shift.expectedDate != null
            ? 'Payment will be credited by ${shift.expectedDate}!}'
            : 'Expected date not available';

    return FlaggedShiftUiModel(
      id: shift.id,
      shiftCode: '#${shift.shiftCode}',
      client: shift.client.name,
      clientAddress: shift.client.address?.split(',').take(2).join(',') ?? '',
      amount: '€${shift.totalPayRate.toStringAsFixed(1)}',
      shiftDate: dateFormatted,
      isSelected: false,
      rateInfo:
          'Total: ${shift.totalWorkedHours.toStringAsFixed(0)} Hrs • €${shift.hourlyRate.toStringAsFixed(2)}/hr',
      expectedPaymentDate: expectedDateFormatted,
      shiftTiming: shift.shiftTiming,
      getApproval: shift.getApproval,
      disputeReason: shift.disputeReason,
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
