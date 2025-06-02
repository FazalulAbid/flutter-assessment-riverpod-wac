class UnattendedTimesheet {
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

  UnattendedTimesheet({
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
}
