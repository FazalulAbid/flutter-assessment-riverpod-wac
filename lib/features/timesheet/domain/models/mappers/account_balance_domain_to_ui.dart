import 'package:flutter_assessment/features/timesheet/domain/models/account_balance.dart';
import 'package:flutter_assessment/features/timesheet/presentation/entities/account_balance_ui_model.dart';

extension AccountBalanceUiMapper on AccountBalance {
  AccountBalanceUiModel toUiModel() {
    return AccountBalanceUiModel(
      basicPayAmountText: '£${basicPayAmount.toStringAsFixed(2)}',
      holidayPayAmountText: '£${holidayPayAmount.toStringAsFixed(2)}',
      withdrawCountText: '$withdrawCount Withdrawals',
    );
  }
}
