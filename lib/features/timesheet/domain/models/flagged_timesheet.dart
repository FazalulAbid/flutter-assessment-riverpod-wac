class FlaggedTimesheet {
  final String week;
  final String weekId;
  final List<FlaggedShift> shifts;

  FlaggedTimesheet({
    required this.week,
    required this.weekId,
    required this.shifts,
  });
}

class FlaggedShift {
  final String id;
  final String date;
  final String shiftCode;
  final FlaggedClient client;
  final double totalPayRate;
  final double totalWorkedHours;
  final String shiftTiming;
  final double hourlyRate;
  final int status;
  final String? expectedDate;
  final int? checkoutType;
  final bool getApproval;
  final String? disputeReason;

  FlaggedShift({
    required this.id,
    required this.date,
    required this.shiftCode,
    required this.client,
    required this.totalPayRate,
    required this.totalWorkedHours,
    required this.shiftTiming,
    required this.hourlyRate,
    required this.status,
    this.expectedDate,
    this.checkoutType,
    required this.getApproval,
    this.disputeReason,
  });
}

class FlaggedClient {
  final String id;
  final String name;
  final String? address;
  final int checkInDistance;
  final String? photo;
  final List<dynamic> preference;
  final int type;
  final String? sdrEmail;
  final int breakTimePayment;

  FlaggedClient({
    required this.id,
    required this.name,
    this.address,
    required this.checkInDistance,
    this.photo,
    required this.preference,
    required this.type,
    this.sdrEmail,
    required this.breakTimePayment,
  });
}
