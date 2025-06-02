import 'package:flutter_assessment/features/timesheet/data/models/withdraw_timesheet_dto.dart';
import 'package:flutter_assessment/features/timesheet/domain/models/withdraw_timesheet.dart';

extension WithdrawTimesheetDtoMapper on WithdrawTimesheetDto {
  WithdrawTimesheet toDomain() {
    return WithdrawTimesheet(
      week: week,
      weekId: weekId,
      shifts: shifts.map((e) => e.toDomain()).toList(),
    );
  }
}

extension ShiftDtoMapper on WithdrawShiftDto {
  WithdrawShift toDomain() {
    return WithdrawShift(
      id: id,
      date: date,
      shiftCode: shiftCode,
      client: client.toDomain(),
      totalPayRate: totalPayRate,
      totalWorkedHours: totalWorkedHours,
      shiftTiming: shiftTiming,
      hourlyRate: hourlyRate,
      status: status,
      expectedDate: expectedDate,
      checkoutType: checkoutType,
    );
  }
}

extension ClientDtoMapper on WithdrawClientDto {
  WithdrawClient toDomain() {
    return WithdrawClient(id: id, name: name, address: address);
  }
}
