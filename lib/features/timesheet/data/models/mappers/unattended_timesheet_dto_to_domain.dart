import 'package:flutter_assessment/features/timesheet/data/models/unattended_timesheet_dto.dart';
import 'package:flutter_assessment/features/timesheet/domain/models/unattended_timesheet.dart';

extension UnattendedTimesheetDtoMapper on UnattendedTimesheetDto {
  UnattendedTimesheet toDomain() {
    return UnattendedTimesheet(
      parentId: parentId,
      shiftId: shiftId,
      client: client,
      checkInDistance: checkInDistance,
      date: date,
      dateTimeFormat: dateTimeFormat,
      endDateTimeFormat: endDateTimeFormat,
      startTime: startTime,
      endTime: endTime,
      distance: distance,
      shiftTiming: shiftTiming,
      type: type,
      county: county,
      longitude: longitude,
      latitude: latitude,
      duration: duration,
      hourlyRate: hourlyRate,
      totalPayRate: totalPayRate,
    );
  }
}
