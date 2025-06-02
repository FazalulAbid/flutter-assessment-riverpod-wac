import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TabHeaderDelegate extends SliverPersistentHeaderDelegate {
  final int selectedTab;
  final Function(int) onTabSelected;

  TabHeaderDelegate({required this.selectedTab, required this.onTabSelected});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    final theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey[300]!, width: 1.0)),
      ),
      child: Container(
        color: theme.colorScheme.primaryContainer,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(width: 16.w),
                  _buildTab('Submitted', 0),
                  SizedBox(width: 16.w),
                  _buildTab('Withdraw', 1),
                  SizedBox(width: 16.w),
                  _buildTab('Flagged', 2),
                  SizedBox(width: 16.w),
                  _buildTab('Unattended', 3),
                  SizedBox(width: 16.w),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTab(String title, int index) {
    final isSelected = selectedTab == index;
    return GestureDetector(
      onTap: () => onTabSelected(index),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 4.w),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: isSelected ? Colors.black : Colors.transparent, width: 2.0),
          ),
        ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
            color: isSelected ? Colors.black : Color(0xFF999999),
          ),
        ),
      ),
    );
  }

  @override
  double get maxExtent => 60.h;

  @override
  double get minExtent => 60.h;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => true;
}
