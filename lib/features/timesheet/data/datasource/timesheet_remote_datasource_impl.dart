import 'package:flutter_assessment/core/data/models/api_response.dart';
import 'package:flutter_assessment/core/data/models/pagination_response.dart';
import 'package:flutter_assessment/core/domain/models/either.dart';
import 'package:flutter_assessment/core/exceptions/http_exception.dart';
import 'package:flutter_assessment/core/network/dio_client.dart';
import 'package:flutter_assessment/features/timesheet/data/datasource/timesheet_remote_datasource.dart';
import 'package:flutter_assessment/features/timesheet/data/models/account_balance_dto.dart';
import 'package:flutter_assessment/features/timesheet/data/models/flagged_timesheet_dto.dart';
import 'package:flutter_assessment/features/timesheet/data/models/submitted_timesheet_dto.dart';
import 'package:flutter_assessment/features/timesheet/data/models/unattended_timesheet_dto.dart';
import 'package:flutter_assessment/features/timesheet/data/models/withdraw_timesheet_dto.dart';

class TimesheetRemoteDataSourceImpl implements TimesheetRemoteDataSource {
  final DioClient _dioClient;

  TimesheetRemoteDataSourceImpl({required DioClient dioClient}) : _dioClient = dioClient;

  @override
  Future<Either<AppException, ApiResponse<PaginationResponse<SubmittedTimesheetDto>>>>
  getSubmittedTimeSheets({required int page, required int limit}) async {
    return await _dioClient.get(
      '/d606ccd6-6720-40a1-91c7-220f12ddf7b9',
      fromJson:
          (json) => ApiResponse.fromJson(
            json,
            (data) =>
                PaginationResponse.fromJson(data, (item) => SubmittedTimesheetDto.fromJson(item)),
          ),
    );
  }

  @override
  Future<Either<AppException, ApiResponse<PaginationResponse<WithdrawTimesheetDto>>>>
  getWithdrawTimeSheets({required int page, required int limit}) async {
    return await _dioClient.get(
      '/28807b48-23ae-4be8-929f-ab2b10f6f217',
      fromJson:
          (json) => ApiResponse.fromJson(
            json,
            (data) =>
                PaginationResponse.fromJson(data, (item) => WithdrawTimesheetDto.fromJson(item)),
          ),
    );
  }

  @override
  Future<Either<AppException, ApiResponse<PaginationResponse<FlaggedTimeSheetDto>>>>
  getFlaggedTimeSheets({required int page, required int limit}) async {
    return await _dioClient.get(
      '/8d4be20a-0fe6-4846-ab26-26ccee3374d7',
      fromJson:
          (json) => ApiResponse.fromJson(
            json,
            (data) =>
                PaginationResponse.fromJson(data, (item) => FlaggedTimeSheetDto.fromJson(item)),
          ),
    );
  }

  @override
  Future<Either<AppException, ApiResponse<UnattendedPaginationResponse<UnattendedTimesheetDto>>>>
  getUnattendedTimeSheets({required int page, required int limit}) async {
    return await _dioClient.get(
      '/be72b43a-5783-4767-a405-1ad2a00dbf47',
      fromJson:
          (json) => ApiResponse.fromJson(
            json,
            (data) => UnattendedPaginationResponse.fromJson(
              data,
              (item) => UnattendedTimesheetDto.fromJson(item),
            ),
          ),
    );
  }

  @override
  Future<Either<AppException, ApiResponse<AccountBalanceDto>>> getAccountBalance() async {
    return await _dioClient.get(
      '/395122fc-7fe7-4a3c-9634-29183f017596',
      fromJson: (json) => ApiResponse.fromJson(json, (data) => AccountBalanceDto.fromJson(data)),
    );
  }
}
