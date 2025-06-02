import 'package:flutter_assessment/features/timesheet/data/models/account_balance_dto.dart';
import 'package:flutter_assessment/features/timesheet/domain/models/account_balance.dart';

extension AccountBalanceDtoMapper on AccountBalanceDto {
  AccountBalance toDomain() {
    return AccountBalance(
      basicPayAmount: basicPayAmount,
      holidayPayAmount: holidayPayAmount,
      withdrawCount: withdrawCount,
    );
  }
}
