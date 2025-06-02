class WithdrawTimeSheetUiModel {
  final List<WithdrawShiftUiModel> items;
  final String week;

  WithdrawTimeSheetUiModel({required this.items, required this.week});

  WithdrawTimeSheetUiModel copyWith({List<WithdrawShiftUiModel>? items, String? week}) {
    return WithdrawTimeSheetUiModel(items: items ?? this.items, week: week ?? this.week);
  }
}

class WithdrawShiftUiModel {
  final String id;
  final String shiftCode;
  final String client;
  final String clientAddress;
  final String amount;
  final String shiftDate;
  final bool isSelected;
  final String rateInfo;
  final String expectedPaymentDate;

  WithdrawShiftUiModel({
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

  WithdrawShiftUiModel copyWith({
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
    return WithdrawShiftUiModel(
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
