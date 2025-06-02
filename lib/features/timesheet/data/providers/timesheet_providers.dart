import 'package:flutter_assessment/features/timesheet/data/datasource/timesheet_remote_datasource.dart';
import 'package:flutter_assessment/features/timesheet/data/datasource/timesheet_remote_datasource_impl.dart';
import 'package:flutter_assessment/features/timesheet/data/repository/timesheet_repository_impl.dart';
import 'package:flutter_assessment/features/timesheet/domain/repository/timesheet_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_assessment/core/providers/dio_provider.dart';

final timesheetRemoteDataSourceProvider = Provider<TimesheetRemoteDataSource>((
  ref,
) {
  final dioClient = ref.read(dioClientProvider);
  return TimesheetRemoteDataSourceImpl(dioClient: dioClient);
});
