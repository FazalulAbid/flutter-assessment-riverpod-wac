class UnattendedTimesheetUiModel {
  final String id;
  final String client;
  final String county;
  final String shiftTiming;
  final String shiftDate;
  final String distance;
  final String timeRange;
  final String amount;
  final String rateInfo;
  final bool isSelected;

  UnattendedTimesheetUiModel({
    required this.id,
    required this.client,
    required this.county,
    required this.shiftTiming,
    required this.shiftDate,
    required this.distance,
    required this.timeRange,
    required this.amount,
    required this.rateInfo,
    this.isSelected = false,
  });

  UnattendedTimesheetUiModel copyWith({
    String? id,
    String? client,
    String? county,
    String? shiftTiming,
    String? shiftDate,
    String? distance,
    String? timeRange,
    String? amount,
    String? rateInfo,
    bool? isSelected,
  }) {
    return UnattendedTimesheetUiModel(
      id: id ?? this.id,
      client: client ?? this.client,
      county: county ?? this.county,
      shiftTiming: shiftTiming ?? this.shiftTiming,
      shiftDate: shiftDate ?? this.shiftDate,
      distance: distance ?? this.distance,
      timeRange: timeRange ?? this.timeRange,
      amount: amount ?? this.amount,
      rateInfo: rateInfo ?? this.rateInfo,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}
