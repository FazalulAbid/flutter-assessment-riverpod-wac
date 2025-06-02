import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TimeSheetGroupCard extends StatelessWidget {
  final String week;

  final Widget child;

  const TimeSheetGroupCard({super.key, required this.week, required this.child});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Week label
        Padding(
          padding: EdgeInsets.only(bottom: 8.h),
          child: Text(
            week,
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600, color: Colors.black),
          ),
        ),

        child,
      ],
    );
  }
}
