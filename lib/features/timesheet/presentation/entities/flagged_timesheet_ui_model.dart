class FlaggedTimeSheetUiModel {
  final List<FlaggedShiftUiModel> items;
  final String week;

  FlaggedTimeSheetUiModel({required this.items, required this.week});

  FlaggedTimeSheetUiModel copyWith({List<FlaggedShiftUiModel>? items, String? week}) {
    return FlaggedTimeSheetUiModel(
      items: items ?? this.items,
      week: week ?? this.week,
    );
  }
}

class FlaggedShiftUiModel {
  final String id;
  final String shiftCode;
  final String client;
  final String clientAddress;
  final String amount;
  final String shiftDate;
  final bool isSelected;
  final String rateInfo;
  final String expectedPaymentDate;
  final String shiftTiming;
  final bool getApproval;
  final String? disputeReason;

  FlaggedShiftUiModel({
    required this.id,
    required this.shiftCode,
    required this.client,
    required this.clientAddress,
    required this.amount,
    required this.shiftDate,
    this.isSelected = false,
    required this.rateInfo,
    required this.expectedPaymentDate,
    required this.shiftTiming,
    required this.getApproval,
    this.disputeReason,
  });

  FlaggedShiftUiModel copyWith({
    String? id,
    String? shiftCode,
    String? client,
    String? clientAddress,
    String? amount,
    String? shiftDate,
    bool? isSelected,
    String? rateInfo,
    String? expectedPaymentDate,
    String? shiftTiming,
    bool? getApproval,
    String? disputeReason,
  }) {
    return FlaggedShiftUiModel(
      id: id ?? this.id,
      shiftCode: shiftCode ?? this.shiftCode,
      client: client ?? this.client,
      clientAddress: clientAddress ?? this.clientAddress,
      amount: amount ?? this.amount,
      shiftDate: shiftDate ?? this.shiftDate,
      isSelected: isSelected ?? this.isSelected,
      rateInfo: rateInfo ?? this.rateInfo,
      expectedPaymentDate: expectedPaymentDate ?? this.expectedPaymentDate,
      shiftTiming: shiftTiming ?? this.shiftTiming,
      getApproval: getApproval ?? this.getApproval,
      disputeReason: disputeReason ?? this.disputeReason,
    );
  }
}
