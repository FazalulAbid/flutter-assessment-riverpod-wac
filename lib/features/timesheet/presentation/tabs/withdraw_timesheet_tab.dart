import 'package:flutter/material.dart';
import 'package:flutter_assessment/core/presentation/widgets/custom_checkbox.dart';
import 'package:flutter_assessment/features/timesheet/presentation/entities/withdraw_timesheet_ui_model.dart';
import 'package:flutter_assessment/features/timesheet/presentation/widgets/timesheet_group_card.dart';
import 'package:flutter_assessment/features/timesheet/presentation/widgets/withdraw_timesheet_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WithdrawTimeSheetTab extends StatelessWidget {
  final List<WithdrawTimeSheetUiModel> items;
  final Function(String) onItemToggle;
  final VoidCallback onSelectAll;
  final int selectedCount;
  final int totalItems;
  final Future<void> Function() onRefresh;

  const WithdrawTimeSheetTab({
    super.key,
    required this.items,
    required this.onItemToggle,
    required this.onSelectAll,
    required this.selectedCount,
    required this.totalItems,
    required this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return RefreshIndicator(
      onRefresh: onRefresh,
      child: Column(
        children: [
          if (items.isNotEmpty)
            Container(
              padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
              width: double.infinity,
              color: theme.colorScheme.primaryContainer,
              child: Row(
                children: [
                  Text(
                    '$selectedCount Selected',
                    style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
                  ),
                  const Spacer(),
                  CustomCheckbox(
                    isSelected: selectedCount == totalItems,
                    onChanged: onSelectAll,
                    text: 'Select All',
                  ),
                ],
              ),
            ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: items.length,
              itemBuilder: (context, groupIndex) {
                final item = items[groupIndex];
                return Padding(
                  padding: EdgeInsets.only(bottom: 16.h),
                  child: TimeSheetGroupCard(
                    week: item.week,
                    child: Column(
                      children: List.generate(
                        item.items.length,
                            (shiftIndex) {
                          final shift = item.items[shiftIndex];
                          return Padding(
                            padding: EdgeInsets.only(bottom: 12.h),
                            child: WithdrawTimeSheetCard(
                              item: shift,
                              onToggle: () => onItemToggle(shift.id),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

}
