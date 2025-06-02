class AccountBalanceDto {
  final double basicPayAmount;
  final double holidayPayAmount;
  final int withdrawCount;

  AccountBalanceDto({
    required this.basicPayAmount,
    required this.holidayPayAmount,
    required this.withdrawCount,
  });

  factory AccountBalanceDto.fromJson(Map<String, dynamic> json) {
    return AccountBalanceDto(
      basicPayAmount: (json['basic_pay_amount'] ?? 0).toDouble(),
      holidayPayAmount: (json['holiday_pay_amount'] ?? 0).toDouble(),
      withdrawCount: json['withdraw_count'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'basic_pay_amount': basicPayAmount,
      'holiday_pay_amount': holidayPayAmount,
      'withdraw_count': withdrawCount,
    };
  }
}
