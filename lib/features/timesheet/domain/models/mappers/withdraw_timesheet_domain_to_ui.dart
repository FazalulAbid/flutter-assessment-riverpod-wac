import 'package:flutter_assessment/features/timesheet/domain/models/withdraw_timesheet.dart';
import 'package:flutter_assessment/features/timesheet/presentation/entities/withdraw_timesheet_ui_model.dart';

class WithdrawTimesheetMapper {
  static List<WithdrawTimeSheetUiModel> fromWithdrawTimesheets(List<WithdrawTimesheet> timesheets) {
    return timesheets.map((timesheet) => _mapToTimeSheetUiModel(timesheet)).toList();
  }

  static WithdrawTimeSheetUiModel _mapToTimeSheetUiModel(WithdrawTimesheet timesheet) {
    return WithdrawTimeSheetUiModel(
      week: timesheet.week,
      items: timesheet.shifts.map((shift) => _mapToShiftUiModel(shift)).toList(),
    );
  }

  static WithdrawShiftUiModel _mapToShiftUiModel(WithdrawShift shift) {
    final dateFormatted = shift.date;
    final expectedDateFormatted = shift.expectedDate;

    return WithdrawShiftUiModel(
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
}
