import 'package:flutter_assessment/core/domain/models/either.dart';
import 'package:flutter_assessment/core/exceptions/http_exception.dart';
import 'package:flutter_assessment/features/timesheet/domain/models/account_balance.dart';
import 'package:flutter_assessment/features/timesheet/domain/models/flagged_timesheet.dart';
import 'package:flutter_assessment/features/timesheet/domain/models/mappers/account_balance_domain_to_ui.dart';
import 'package:flutter_assessment/features/timesheet/domain/models/mappers/flagged_timesheet_domain_to_ui.dart';
import 'package:flutter_assessment/features/timesheet/domain/models/mappers/submitted_timesheet_domain_to_ui.dart';
import 'package:flutter_assessment/features/timesheet/domain/models/mappers/unattended_timesheet_domain_to_ui.dart';
import 'package:flutter_assessment/features/timesheet/domain/models/mappers/withdraw_timesheet_domain_to_ui.dart';
import 'package:flutter_assessment/features/timesheet/domain/models/submitted_timesheet.dart';
import 'package:flutter_assessment/features/timesheet/domain/models/unattended_timesheet.dart';
import 'package:flutter_assessment/features/timesheet/domain/models/withdraw_timesheet.dart';
import 'package:flutter_assessment/features/timesheet/domain/repository/timesheet_repository.dart';
import 'package:flutter_assessment/features/timesheet/presentation/controller/timesheet_state.dart';
import 'package:flutter_assessment/features/timesheet/presentation/entities/withdraw_timesheet_ui_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TimesheetNotifier extends StateNotifier<TimesheetState> {
  final TimeSheetRepository _repository;

  TimesheetNotifier(this._repository) : super(_initialState());

  static TimesheetState _initialState() {
    return TimesheetState(
      totalBalance: "0.00",
      holidayPayBalance: "0.00",
      selectedTab: 0,
      selectedCount: 0,
      isLoading: false,
      errorMessage: null,
      submittedItems: [],
      withdrawItems: [],
      flaggedItems: [],
      unattendedItems: [],
    );
  }

  Future<T> _handleRepositoryCall<T>(
      Future<Either<AppException, T>> repositoryCall,
      T defaultValue,
      String errorPrefix,
      ) async {
    try {
      final result = await repositoryCall;
      return result.fold(
            (error) {
          print('hello : $errorPrefix: ${error.message}');
          _setError('$errorPrefix: ${error.message}');
          return defaultValue;
        },
            (data) {
          print('$errorPrefix: Successfully fetched -> $data');
          return data;
        },
      );
    } catch (e) {
      _setError('$errorPrefix: An unexpected error occurred');
      return defaultValue;
    }
  }

  void _setError(String message) {
    state = state.copyWith(isLoading: false, errorMessage: message);
  }

  void _setLoading(bool loading) {
    state = state.copyWith(isLoading: loading, errorMessage: null);
  }

  Future<List<SubmittedTimesheet>> _fetchSubmittedTimesheets() async {
    return await _handleRepositoryCall(
      _repository.fetchSubmittedTimeSheets(page: 1, limit: 50),
      <SubmittedTimesheet>[],
      'Failed to load submitted timesheets',
    );
  }

  Future<List<WithdrawTimesheet>> _fetchWithdrawTimesheets() async {
    return await _handleRepositoryCall(
      _repository.fetchWithdrawTimeSheets(page: 1, limit: 50),
      <WithdrawTimesheet>[],
      'Failed to load withdraw timesheets',
    );
  }

  Future<List<FlaggedTimesheet>> _fetchFlaggedTimesheets() async {
    return await _handleRepositoryCall(
      _repository.fetchFlaggedTimeSheets(page: 1, limit: 50),
      <FlaggedTimesheet>[],
      'Failed to load flagged timesheets',
    );
  }

  Future<List<UnattendedTimesheet>> _fetchUnattendedTimesheets() async {
    return await _handleRepositoryCall(
      _repository.fetchUnattendedTimeSheets(page: 1, limit: 50),
      <UnattendedTimesheet>[],
      'Failed to load unattended timesheets',
    );
  }

  Future<AccountBalance?> _fetchAccountBalance() async {
    return await _handleRepositoryCall(
      _repository.fetchAccountBalance(),
      null,
      'Failed to load account balance',
    );
  }

  Future<void> loadTimesheets() async {
    _setLoading(true);

    try {
      final results = await Future.wait([
        _fetchSubmittedTimesheets(),
        _fetchWithdrawTimesheets(),
        _fetchFlaggedTimesheets(),
        _fetchUnattendedTimesheets(),
        _fetchAccountBalance(),
      ]);

      final submittedItems = SubmittedTimesheetMapper.fromSubmittedTimesheets(
        results[0] as List<SubmittedTimesheet>,
      );
      final withdrawItems = WithdrawTimesheetMapper.fromWithdrawTimesheets(
        results[1] as List<WithdrawTimesheet>,
      );
      final flaggedItems = FlaggedTimesheetMapper.fromFlaggedTimesheets(
        results[2] as List<FlaggedTimesheet>,
      );
      final unattendedItems = UnattendedTimesheetMapper.fromUnattendedTimesheets(
        results[3] as List<UnattendedTimesheet>,
      );
      final totalBalance = (results[4] as AccountBalance?)?.toUiModel();

      state = state.copyWith(
        totalBalance: totalBalance?.basicPayAmountText,
        holidayPayBalance: totalBalance?.holidayPayAmountText,
        isLoading: false,
        errorMessage: null,
        submittedItems: submittedItems,
        withdrawItems: withdrawItems,
        flaggedItems: flaggedItems,
        unattendedItems: unattendedItems,
      );
    } catch (e) {
      _setError('An unexpected error occurred while loading timesheets');
    }
  }

  Future<void> refreshCurrentTab() async {
    final currentTab = state.selectedTab;
    _setLoading(true);

    try {
      switch (currentTab) {
        case 0:
          await _refreshSubmittedTab();
          break;
        case 1:
          await _refreshWithdrawTab();
          break;
        case 2:
          await _refreshFlaggedTab();
          break;
        case 3:
          await _refreshUnattendedTab();
          break;
        default:
          state = state.copyWith(isLoading: false);
      }
    } catch (e) {
      _setError('An unexpected error occurred while refreshing');
    }
  }

  Future<void> _refreshSubmittedTab() async {
    final timesheets = await _fetchSubmittedTimesheets();

    if (state.errorMessage == null) {
      final items = SubmittedTimesheetMapper.fromSubmittedTimesheets(timesheets);
      state = state.copyWith(isLoading: false, submittedItems: items, selectedCount: 0);
    }
  }

  Future<void> _refreshWithdrawTab() async {
    final timesheets = await _fetchWithdrawTimesheets();

    if (state.errorMessage == null) {
      final items = WithdrawTimesheetMapper.fromWithdrawTimesheets(timesheets);
      state = state.copyWith(isLoading: false, withdrawItems: items, selectedCount: 0);
    }
  }

  Future<void> _refreshFlaggedTab() async {
    final timesheets = await _fetchFlaggedTimesheets();

    if (state.errorMessage == null) {
      final items = FlaggedTimesheetMapper.fromFlaggedTimesheets(timesheets);
      state = state.copyWith(isLoading: false, flaggedItems: items, selectedCount: 0);
    }
  }

  Future<void> _refreshUnattendedTab() async {
    final timesheets = await _fetchUnattendedTimesheets();

    if (state.errorMessage == null) {
      final items = UnattendedTimesheetMapper.fromUnattendedTimesheets(timesheets);
      state = state.copyWith(isLoading: false, unattendedItems: items, selectedCount: 0);
    }
  }

  void selectTab(int index) {
    state = state.copyWith(selectedTab: index, selectedCount: 0);
  }

  void toggleItemSelection(String itemId) {
    if (state.selectedTab != 1) return;

    final updatedList = _updateItemSelection(itemId);
    final selectedCount = _calculateSelectedCount(updatedList);

    state = state.copyWith(withdrawItems: updatedList, selectedCount: selectedCount);
  }

  List<WithdrawTimeSheetUiModel> _updateItemSelection(String itemId) {
    return state.withdrawItems.map((weekModel) {
      final updatedShifts =
      weekModel.items.map((shift) {
        return shift.id == itemId ? shift.copyWith(isSelected: !shift.isSelected) : shift;
      }).toList();
      return weekModel.copyWith(items: updatedShifts);
    }).toList();
  }

  int _calculateSelectedCount(List<WithdrawTimeSheetUiModel> items) {
    return items.expand((week) => week.items).where((item) => item.isSelected).length;
  }

  void selectAll() {
    if (state.selectedTab != 1) return;

    final allShifts = state.withdrawItems.expand((week) => week.items);
    final allSelected = allShifts.every((shift) => shift.isSelected);

    final updatedList =
    state.withdrawItems.map((weekModel) {
      final updatedShifts =
      weekModel.items.map((shift) => shift.copyWith(isSelected: !allSelected)).toList();
      return weekModel.copyWith(items: updatedShifts);
    }).toList();

    final selectedCount = _calculateSelectedCount(updatedList);

    state = state.copyWith(withdrawItems: updatedList, selectedCount: selectedCount);
  }

  void clearError() {
    state = state.copyWith(errorMessage: null);
  }
}