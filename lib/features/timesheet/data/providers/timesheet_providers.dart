import 'package:flutter_assessment/core/providers/dio_provider.dart';
import 'package:flutter_assessment/features/timesheet/data/datasource/timesheet_remote_datasource.dart';
import 'package:flutter_assessment/features/timesheet/data/datasource/timesheet_remote_datasource_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final timesheetRemoteDataSourceProvider = Provider<TimesheetRemoteDataSource>((ref) {
  final dioClient = ref.read(dioClientProvider);
  return TimesheetRemoteDataSourceImpl(dioClient: dioClient);
});
