import 'package:flutter_assessment/core/domain/models/either.dart';
import 'package:flutter_assessment/core/exceptions/http_exception.dart';
import 'package:flutter_assessment/features/timesheet/domain/models/account_balance.dart';
import 'package:flutter_assessment/features/timesheet/domain/models/flagged_timesheet.dart';
import 'package:flutter_assessment/features/timesheet/domain/models/submitted_timesheet.dart';
import 'package:flutter_assessment/features/timesheet/domain/models/unattended_timesheet.dart';
import 'package:flutter_assessment/features/timesheet/domain/models/withdraw_timesheet.dart';

abstract class TimeSheetRepository {
  Future<Either<AppException, List<SubmittedTimesheet>>> fetchSubmittedTimeSheets({
    required int page,
    required int limit,
  });

  Future<Either<AppException, List<WithdrawTimesheet>>> fetchWithdrawTimeSheets({
    required int page,
    required int limit,
  });

  Future<Either<AppException, List<FlaggedTimesheet>>> fetchFlaggedTimeSheets({
    required int page,
    required int limit,
  });

  Future<Either<AppException, List<UnattendedTimesheet>>> fetchUnattendedTimeSheets({
    required int page,
    required int limit,
  });

  Future<Either<AppException, AccountBalance>> fetchAccountBalance();
}
