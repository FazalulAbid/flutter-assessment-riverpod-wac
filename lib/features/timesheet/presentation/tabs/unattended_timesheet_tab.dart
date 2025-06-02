import 'package:flutter/material.dart';
import 'package:flutter_assessment/features/timesheet/presentation/entities/submitted_timesheet_ui_model.dart';
import 'package:flutter_assessment/features/timesheet/presentation/entities/unattended_timesheet_ui_model.dart';
import 'package:flutter_assessment/features/timesheet/presentation/widgets/timesheet_group_card.dart';
import 'package:flutter_assessment/features/timesheet/presentation/widgets/unattended_timesheet_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UnattendedTimeSheetTab extends StatelessWidget {
  final List<UnattendedTimesheetUiModel> items;
  final Function(String) onItemToggle;
  final VoidCallback onSelectAll;
  final int selectedCount;
  final Future<void> Function() onRefresh;

  const UnattendedTimeSheetTab({
    super.key,
    required this.items,
    required this.onItemToggle,
    required this.onSelectAll,
    required this.selectedCount,
    required this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final timesheet = items[index];

          return Padding(
            padding: EdgeInsets.only(bottom: 16.h),
            child: ListView.separated(
              itemCount: items.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (_, __) => SizedBox(height: 12.h),
              itemBuilder: (context, shiftIndex) {
                final shift = items[shiftIndex];
                return UnattendedTimeSheetCard(
                  item: shift,
                  onToggle: () => onItemToggle(shift.id),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
