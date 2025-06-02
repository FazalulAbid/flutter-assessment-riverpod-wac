class SubmittedTimesheet {
  final String week;
  final String weekId;
  final List<SubmittedShift> shifts;

  SubmittedTimesheet({required this.week, required this.weekId, required this.shifts});
}

class SubmittedShift {
  final String id;
  final String date;
  final String shiftCode;
  final SubmittedClient client;
  final double totalPayRate;
  final double totalWorkedHours;
  final String shiftTiming;
  final double hourlyRate;
  final int status;
  final String expectedDate;
  final int checkoutType;

  SubmittedShift({
    required this.id,
    required this.date,
    required this.shiftCode,
    required this.client,
    required this.totalPayRate,
    required this.totalWorkedHours,
    required this.shiftTiming,
    required this.hourlyRate,
    required this.status,
    required this.expectedDate,
    required this.checkoutType,
  });
}

class SubmittedClient {
  final String id;
  final String name;
  final String? address;

  SubmittedClient({required this.id, required this.name, this.address});
}
