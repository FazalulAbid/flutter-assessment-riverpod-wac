class UnattendedTimesheetDto {
  final String parentId;
  final String shiftId;
  final String client;
  final int checkInDistance;
  final String date;
  final String dateTimeFormat;
  final String endDateTimeFormat;
  final String startTime;
  final String endTime;
  final int distance;
  final String shiftTiming;
  final String type;
  final String county;
  final double longitude;
  final double latitude;
  final double duration;
  final double hourlyRate;
  final double totalPayRate;

  UnattendedTimesheetDto({
    required this.parentId,
    required this.shiftId,
    required this.client,
    required this.checkInDistance,
    required this.date,
    required this.dateTimeFormat,
    required this.endDateTimeFormat,
    required this.startTime,
    required this.endTime,
    required this.distance,
    required this.shiftTiming,
    required this.type,
    required this.county,
    required this.longitude,
    required this.latitude,
    required this.duration,
    required this.hourlyRate,
    required this.totalPayRate,
  });

  factory UnattendedTimesheetDto.fromJson(Map<String, dynamic> json) {
    return UnattendedTimesheetDto(
      parentId: json['parent_id'] ?? '',
      shiftId: json['shift_id'] ?? '',
      client: json['client'] ?? '',
      checkInDistance: json['check_in_distance'] ?? 0,
      date: json['date'] ?? '',
      dateTimeFormat: json['date_time_format'] ?? '',
      endDateTimeFormat: json['end_date_time_format'] ?? '',
      startTime: json['start_time'] ?? '',
      endTime: json['end_time'] ?? '',
      distance: json['distance'] ?? 0,
      shiftTiming: json['shift_timing'] ?? '',
      type: json['type'] ?? '',
      county: json['county'] ?? '',
      longitude: (json['longitude'] ?? 0).toDouble(),
      latitude: (json['latitude'] ?? 0).toDouble(),
      duration: (json['duration'] ?? 0).toDouble(),
      hourlyRate: (json['hourly_rate'] ?? 0).toDouble(),
      totalPayRate: (json['total_pay_rate'] ?? 0).toDouble(),
    );
  }
}

