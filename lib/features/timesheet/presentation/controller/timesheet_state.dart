import 'package:flutter_assessment/features/timesheet/presentation/entities/flagged_timesheet_ui_model.dart';
import 'package:flutter_assessment/features/timesheet/presentation/entities/submitted_timesheet_ui_model.dart';
import 'package:flutter_assessment/features/timesheet/presentation/entities/unattended_timesheet_ui_model.dart';
import 'package:flutter_assessment/features/timesheet/presentation/entities/withdraw_timesheet_ui_model.dart';

class TimesheetState {
  final String totalBalance;
  final String holidayPayBalance;
  final int selectedTab;
  final int selectedCount;
  final bool isLoading;
  final String? errorMessage;
  final List<SubmittedTimeSheetUiModel> submittedItems;
  final List<WithdrawTimeSheetUiModel> withdrawItems;
  final List<FlaggedTimeSheetUiModel> flaggedItems;
  final List<UnattendedTimesheetUiModel> unattendedItems;

  TimesheetState({
    required this.totalBalance,
    required this.holidayPayBalance,
    required this.selectedTab,
    required this.selectedCount,
    required this.isLoading,
    this.errorMessage,
    required this.submittedItems,
    required this.withdrawItems,
    required this.flaggedItems,
    required this.unattendedItems,
  });

  TimesheetState copyWith({
    String? totalBalance,
    String? holidayPayBalance,
    int? selectedTab,
    int? selectedCount,
    bool? isLoading,
    String? errorMessage,
    List<SubmittedTimeSheetUiModel>? submittedItems,
    List<WithdrawTimeSheetUiModel>? withdrawItems,
    List<FlaggedTimeSheetUiModel>? flaggedItems,
    List<UnattendedTimesheetUiModel>? unattendedItems,
  }) {
    return TimesheetState(
      totalBalance: totalBalance ?? this.totalBalance,
      holidayPayBalance: holidayPayBalance ?? this.holidayPayBalance,
      selectedTab: selectedTab ?? this.selectedTab,
      selectedCount: selectedCount ?? this.selectedCount,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      submittedItems: submittedItems ?? this.submittedItems,
      withdrawItems: withdrawItems ?? this.withdrawItems,
      flaggedItems: flaggedItems ?? this.flaggedItems,
      unattendedItems: unattendedItems ?? this.unattendedItems,
    );
  }
}
