import 'package:flutter_assessment/features/timesheet/data/providers/timesheet_providers.dart';
import 'package:flutter_assessment/features/timesheet/data/repository/timesheet_repository_impl.dart';
import 'package:flutter_assessment/features/timesheet/domain/repository/timesheet_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final timesheetRepositoryProvider = Provider<TimeSheetRepository>((ref) {
  final remoteDataSource = ref.read(timesheetRemoteDataSourceProvider);
  return TimesheetRepositoryImpl(remoteDataSource: remoteDataSource);
});
