import 'package:flutter_assessment/features/timesheet/data/models/flagged_timesheet_dto.dart';
import 'package:flutter_assessment/features/timesheet/domain/models/flagged_timesheet.dart';

extension FlaggedTimesheetDtoMapper on FlaggedTimeSheetDto {
  FlaggedTimesheet toDomain() {
    return FlaggedTimesheet(
      week: week,
      weekId: weekId,
      shifts: shifts.map((e) => e.toDomain()).toList(),
    );
  }
}

extension FlaggedShiftDtoMapper on FlaggedShiftDto {
  FlaggedShift toDomain() {
    return FlaggedShift(
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
      getApproval: getApproval,
      disputeReason: disputeReason,
    );
  }
}

extension FlaggedClientDtoMapper on FlaggedClientDto {
  FlaggedClient toDomain() {
    return FlaggedClient(
      id: id,
      name: name,
      address: address,
      checkInDistance: checkInDistance,
      photo: photo,
      preference: preference,
      type: type,
      sdrEmail: sdrEmail,
      breakTimePayment: breakTimePayment,
    );
  }
}
