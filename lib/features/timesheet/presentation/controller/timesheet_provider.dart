import 'package:flutter_assessment/features/timesheet/domain/providers/timesheet_repository_provider.dart';
import 'package:flutter_assessment/features/timesheet/presentation/controller/timesheet_notifier.dart';
import 'package:flutter_assessment/features/timesheet/presentation/controller/timesheet_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final timesheetNotifierProvider = StateNotifierProvider<TimesheetNotifier, TimesheetState>((ref) {
  final repository = ref.watch(timesheetRepositoryProvider);
  return TimesheetNotifier(repository);
});
