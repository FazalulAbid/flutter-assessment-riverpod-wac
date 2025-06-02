class WithdrawTimesheet {
  final String week;
  final String weekId;
  final List<WithdrawShift> shifts;

  WithdrawTimesheet({
    required this.week,
    required this.weekId,
    required this.shifts,
  });
}

class WithdrawShift {
  final String id;
  final String date;
  final String shiftCode;
  final WithdrawClient client;
  final double totalPayRate;
  final double totalWorkedHours;
  final String shiftTiming;
  final double hourlyRate;
  final int status;
  final String expectedDate;
  final int checkoutType;

  WithdrawShift({
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

class WithdrawClient {
  final String id;
  final String name;
  final String? address;

  WithdrawClient({required this.id, required this.name, this.address});
}
