class SubmittedTimeSheetUiModel {
  final List<SubmittedShiftUiModel> items;
  final String week;

  SubmittedTimeSheetUiModel({required this.items, required this.week});

  SubmittedTimeSheetUiModel copyWith({List<SubmittedShiftUiModel>? items, String? week}) {
    return SubmittedTimeSheetUiModel(items: items ?? this.items, week: week ?? this.week);
  }
}

class SubmittedShiftUiModel {
  final String id;
  final String shiftCode;
  final String client;
  final String clientAddress;
  final String amount;
  final String shiftDate;
  final bool isSelected;
  final String rateInfo;
  final String expectedPaymentDate;

  SubmittedShiftUiModel({
    required this.id,
    required this.shiftCode,
    required this.client,
    required this.clientAddress,
    required this.amount,
    required this.shiftDate,
    this.isSelected = false,
    required this.rateInfo,
    required this.expectedPaymentDate,
  });

  SubmittedShiftUiModel copyWith({
    String? id,
    String? shiftCode,
    String? title,
    String? client,
    String? clientAddress,
    String? amount,
    String? shiftDate,
    bool? isSelected,
    String? rateInfo,
    String? expectedPaymentDate,
  }) {
    return SubmittedShiftUiModel(
      id: id ?? this.id,
      shiftCode: shiftCode ?? this.shiftCode,
      client: title ?? this.client,
      clientAddress: clientAddress ?? this.clientAddress,
      amount: amount ?? this.amount,
      shiftDate: shiftDate ?? this.shiftDate,
      isSelected: isSelected ?? this.isSelected,
      rateInfo: rateInfo ?? this.rateInfo,
      expectedPaymentDate: expectedPaymentDate ?? this.expectedPaymentDate,
    );
  }
}
