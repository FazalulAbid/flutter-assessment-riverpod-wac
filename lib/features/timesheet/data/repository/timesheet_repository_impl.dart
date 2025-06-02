import 'package:flutter_assessment/core/domain/models/either.dart';
import 'package:flutter_assessment/core/exceptions/http_exception.dart';
import 'package:flutter_assessment/features/timesheet/data/datasource/timesheet_remote_datasource.dart';
import 'package:flutter_assessment/features/timesheet/data/models/mappers/account_balance_dto_to_domain.dart';
import 'package:flutter_assessment/features/timesheet/data/models/mappers/flagged_timesheet_dto_to_domain.dart';
import 'package:flutter_assessment/features/timesheet/data/models/mappers/submitted_timesheet_dto_to_domain.dart';
import 'package:flutter_assessment/features/timesheet/data/models/mappers/unattended_timesheet_dto_to_domain.dart';
import 'package:flutter_assessment/features/timesheet/data/models/mappers/withdraw_timesheet_dto_to_domain.dart';
import 'package:flutter_assessment/features/timesheet/domain/models/account_balance.dart';
import 'package:flutter_assessment/features/timesheet/domain/models/flagged_timesheet.dart';
import 'package:flutter_assessment/features/timesheet/domain/models/submitted_timesheet.dart';
import 'package:flutter_assessment/features/timesheet/domain/models/unattended_timesheet.dart';
import 'package:flutter_assessment/features/timesheet/domain/models/withdraw_timesheet.dart';
import 'package:flutter_assessment/features/timesheet/domain/repository/timesheet_repository.dart';

class TimesheetRepositoryImpl implements TimeSheetRepository {
  final TimesheetRemoteDataSource _remoteDataSource;

  TimesheetRepositoryImpl({required TimesheetRemoteDataSource remoteDataSource})
    : _remoteDataSource = remoteDataSource;

  @override
  Future<Either<AppException, List<SubmittedTimesheet>>> fetchSubmittedTimeSheets({
    required int page,
    required int limit,
  }) async {
    final result = await _remoteDataSource.getSubmittedTimeSheets(page: page, limit: limit);

    return result.fold((exception) => Left(exception), (apiResponse) {
      try {
        final domainList = apiResponse.data.data.map((dto) => dto.toDomain()).toList();
        return Right(domainList);
      } catch (e) {
        return Left(
          AppException(
            message: 'Failed to map submitted timesheets: $e',
            statusCode: 500,
            identifier: 'MAPPING_ERROR',
          ),
        );
      }
    });
  }

  @override
  Future<Either<AppException, List<WithdrawTimesheet>>> fetchWithdrawTimeSheets({
    required int page,
    required int limit,
  }) async {
    final result = await _remoteDataSource.getWithdrawTimeSheets(page: page, limit: limit);

    return result.fold((exception) => Left(exception), (apiResponse) {
      try {
        final domainList = apiResponse.data.data.map((dto) => dto.toDomain()).toList();
        return Right(domainList);
      } catch (e) {
        return Left(
          AppException(
            message: 'Failed to map withdraw timesheets: $e',
            statusCode: 500,
            identifier: 'MAPPING_ERROR',
          ),
        );
      }
    });
  }

  @override
  Future<Either<AppException, List<FlaggedTimesheet>>> fetchFlaggedTimeSheets({
    required int page,
    required int limit,
  }) async {
    final result = await _remoteDataSource.getFlaggedTimeSheets(page: page, limit: limit);

    return result.fold((exception) => Left(exception), (apiResponse) {
      try {
        final domainList = apiResponse.data.data.map((dto) => dto.toDomain()).toList();
        return Right(domainList);
      } catch (e) {
        return Left(
          AppException(
            message: 'Failed to map flagged timesheets: $e',
            statusCode: 500,
            identifier: 'MAPPING_ERROR',
          ),
        );
      }
    });
  }

  @override
  Future<Either<AppException, List<UnattendedTimesheet>>> fetchUnattendedTimeSheets({
    required int page,
    required int limit,
  }) async {
    final result = await _remoteDataSource.getUnattendedTimeSheets(page: page, limit: limit);

    return result.fold((exception) => Left(exception), (apiResponse) {
      try {
        final domainList = apiResponse.data.data.map((dto) => dto.toDomain()).toList();
        return Right(domainList);
      } catch (e) {
        return Left(
          AppException(
            message: 'Failed to map unattended timesheets: $e',
            statusCode: 500,
            identifier: 'MAPPING_ERROR',
          ),
        );
      }
    });
  }

  @override
  Future<Either<AppException, AccountBalance>> fetchAccountBalance() async {
    final result = await _remoteDataSource.getAccountBalance();

    return result.fold((exception) => Left(exception), (apiResponse) {
      try {
        final domain = apiResponse.data.toDomain();
        return Right(domain);
      } catch (e) {
        return Left(
          AppException(
            message: 'Failed to map account balance: $e',
            statusCode: 500,
            identifier: 'MAPPING_ERROR',
          ),
        );
      }
    });
  }
}
