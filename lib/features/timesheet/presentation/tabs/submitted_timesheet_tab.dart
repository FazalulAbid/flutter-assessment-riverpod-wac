import 'package:flutter/material.dart';
import 'package:flutter_assessment/features/timesheet/presentation/entities/submitted_timesheet_ui_model.dart';
import 'package:flutter_assessment/features/timesheet/presentation/widgets/submitted_timesheet_card.dart';
import 'package:flutter_assessment/features/timesheet/presentation/widgets/timesheet_group_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubmittedTimeSheetTab extends StatelessWidget {
  final List<SubmittedTimeSheetUiModel> items;
  final Function(String) onItemClick;
  final VoidCallback onSelectAll;
  final int selectedCount;
  final Future<void> Function() onRefresh;

  const SubmittedTimeSheetTab({
    super.key,
    required this.items,
    required this.onItemClick,
    required this.onSelectAll,
    required this.selectedCount,
    required this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        itemCount: items.length,
        separatorBuilder: (_, __) => SizedBox(height: 16.h),
        itemBuilder: (context, index) {
          final timesheet = items[index];

          return TimeSheetGroupCard(
            week: timesheet.week,
            child: ListView.separated(
              itemCount: timesheet.items.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (_, __) => SizedBox(height: 12.h),
              itemBuilder: (context, shiftIndex) {
                final shift = timesheet.items[shiftIndex];
                return SubmittedTimeSheetCard(
                  item: shift,
                  onClick: () => onItemClick(shift.id),
                );
              },
            ),
          );
        },
      ),
    );
  }

}
