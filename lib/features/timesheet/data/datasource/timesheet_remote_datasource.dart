import 'package:flutter_assessment/core/data/models/api_response.dart';
import 'package:flutter_assessment/core/data/models/pagination_response.dart';
import 'package:flutter_assessment/core/domain/models/either.dart';
import 'package:flutter_assessment/core/exceptions/http_exception.dart';
import 'package:flutter_assessment/features/timesheet/data/models/account_balance_dto.dart';
import 'package:flutter_assessment/features/timesheet/data/models/flagged_timesheet_dto.dart';
import 'package:flutter_assessment/features/timesheet/data/models/submitted_timesheet_dto.dart';
import 'package:flutter_assessment/features/timesheet/data/models/unattended_timesheet_dto.dart';
import 'package:flutter_assessment/features/timesheet/data/models/withdraw_timesheet_dto.dart';

abstract class TimesheetRemoteDataSource {
  Future<Either<AppException, ApiResponse<AccountBalanceDto>>> getAccountBalance();

  Future<Either<AppException, ApiResponse<PaginationResponse<SubmittedTimesheetDto>>>>
  getSubmittedTimeSheets({required int page, required int limit});

  Future<Either<AppException, ApiResponse<PaginationResponse<WithdrawTimesheetDto>>>>
  getWithdrawTimeSheets({required int page, required int limit});

  Future<Either<AppException, ApiResponse<PaginationResponse<FlaggedTimeSheetDto>>>>
  getFlaggedTimeSheets({required int page, required int limit});

  Future<Either<AppException, ApiResponse<UnattendedPaginationResponse<UnattendedTimesheetDto>>>>
  getUnattendedTimeSheets({required int page, required int limit});
}
