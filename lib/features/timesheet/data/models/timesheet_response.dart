import 'package:flutter_assessment/features/timesheet/data/models/submitted_timesheet_dto.dart';

class TimesheetDataResponse {
  final List<SubmittedTimesheetDto> data;
  final double totalPayRate;
  final int totalCount;
  final int perPage;
  final int currentPage;

  TimesheetDataResponse({
    required this.data,
    required this.totalPayRate,
    required this.totalCount,
    required this.perPage,
    required this.currentPage,
  });

  factory TimesheetDataResponse.fromJson(Map<String, dynamic> json) {
    return TimesheetDataResponse(
      data: (json['data'] as List? ?? []).map((e) => SubmittedTimesheetDto.fromJson(e)).toList(),
      totalPayRate: (json['total_pay_rate'] ?? 0).toDouble(),
      totalCount: json['total_count'] ?? 0,
      perPage: json['per_page'] ?? 10,
      currentPage: json['current_page'] ?? 1,
    );
  }

  @override
  String toString() {
    return 'TimesheetDataResponse(data: $data, totalPayRate: $totalPayRate, totalCount: $totalCount, perPage: $perPage, currentPage: $currentPage)';
  }
}
