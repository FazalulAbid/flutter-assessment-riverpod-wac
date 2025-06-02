import 'package:flutter_assessment/features/timesheet/data/models/submitted_timesheet_dto.dart';
import 'package:flutter_assessment/features/timesheet/domain/models/submitted_timesheet.dart';

extension SubmittedTimesheetDtoMapper on SubmittedTimesheetDto {
  SubmittedTimesheet toDomain() {
    return SubmittedTimesheet(
      week: week,
      weekId: weekId,
      shifts: shifts.map((e) => e.toDomain()).toList(),
    );
  }
}

extension ShiftDtoMapper on ShiftDto {
  SubmittedShift toDomain() {
    return SubmittedShift(
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

extension ClientDtoMapper on ClientDto {
  SubmittedClient toDomain() {
    return SubmittedClient(id: id, name: name, address: address);
  }
}
