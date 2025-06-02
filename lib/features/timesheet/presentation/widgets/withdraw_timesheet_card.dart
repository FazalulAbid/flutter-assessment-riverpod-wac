import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assessment/core/constants/app_icons.dart';
import 'package:flutter_assessment/core/constants/app_images.dart';
import 'package:flutter_assessment/core/presentation/widgets/custom_checkbox.dart';
import 'package:flutter_assessment/core/presentation/widgets/svg_icon.dart';
import 'package:flutter_assessment/core/theme/app_colors.dart';
import 'package:flutter_assessment/features/timesheet/presentation/entities/withdraw_timesheet_ui_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WithdrawTimeSheetCard extends StatelessWidget {
  final WithdrawShiftUiModel item;
  final VoidCallback onToggle;

  const WithdrawTimeSheetCard({super.key, required this.item, required this.onToggle});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: SmoothRectangleBorder(
          borderRadius: SmoothBorderRadius(cornerRadius: 18.r, cornerSmoothing: 1),
          side: BorderSide(
            color: item.isSelected ? AppColors.primary : Colors.grey[300]!,
            width: item.isSelected ? 2 : 1,
          ),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(4.w),
        child: Column(
          children: [
            ClipSmoothRect(
              radius: SmoothBorderRadius(cornerRadius: 14.r, cornerSmoothing: 1),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(AppImages.timeSheetCardBackground),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Date and ID row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(24.r),
                          ),
                          child: Text(
                            item.shiftDate,
                            style: TextStyle(
                              fontSize: 13.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Text(
                          item.shiftCode,
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12.h),
                    // Title and address
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.client,
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            item.clientAddress,
                            style: TextStyle(fontSize: 14.sp, color: theme.colorScheme.onPrimaryContainer),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Content
            Padding(
              padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            item.amount,
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(width: 8.w),
                          Container(
                            padding: EdgeInsets.fromLTRB(6.w, 2.h, 12.w, 2.h),
                            decoration: BoxDecoration(
                              color: const Color(0xFFFFF8D1),
                              borderRadius: BorderRadius.circular(24.r),
                              border: Border.all(color: Color(0xFFFFC076), width: 1.w),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SvgIcon(assetPath: AppIcons.roundedFlash, size: 14.sp),
                                SizedBox(width: 4.w),
                                ShaderMask(
                                  shaderCallback:
                                      (bounds) => LinearGradient(
                                        colors: [Color(0xFFF06602), Color(0xFFB17F00)],
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                      ).createShader(
                                        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                                      ),
                                  child: Text(
                                    'Instant payout',
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        item.rateInfo,
                        style: TextStyle(fontSize: 13.sp, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                  const Spacer(),
                  CustomCheckbox(
                    isSelected: item.isSelected,
                    onChanged: onToggle,
                    text: 'Selected',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
