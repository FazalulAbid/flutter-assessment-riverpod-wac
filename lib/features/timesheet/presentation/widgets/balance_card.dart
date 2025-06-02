import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assessment/core/constants/app_icons.dart';
import 'package:flutter_assessment/core/presentation/widgets/dashed_line.dart';
import 'package:flutter_assessment/core/presentation/widgets/svg_icon.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BalanceCard extends StatelessWidget {
  final String totalBalance;
  final String holidayPayBalance;

  const BalanceCard({super.key, required this.totalBalance, required this.holidayPayBalance});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.w),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: SmoothRectangleBorder(
          borderRadius: SmoothBorderRadius(cornerRadius: 16.r, cornerSmoothing: 1),
        ),
        shadows: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 16,
            offset: const Offset(0, 2),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Total Balance',
            style: TextStyle(fontSize: 14.sp, color: Colors.grey[600], fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 8.h),
          Text(
            totalBalance,
            style: TextStyle(fontSize: 28.sp, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          SizedBox(height: 16.h),
          DashedLine(color: Colors.grey, dashWidth: 4, dashSpacing: 2, height: 1),
          SizedBox(height: 16.h),
          Row(
            children: [
              Text(
                'Holiday Pay Balance ',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                holidayPayBalance,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: theme.primaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              SvgIcon(assetPath: AppIcons.arrowRight, size: 16.w, color: theme.primaryColor),
            ],
          ),
        ],
      ),
    );
  }
}
