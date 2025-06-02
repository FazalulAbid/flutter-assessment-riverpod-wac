import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:figma_squircle/figma_squircle.dart';

class TimeSheetCardButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final Gradient? gradient;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final double? borderRadius;

  const TimeSheetCardButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.gradient,
    this.textColor = Colors.white,
    this.fontSize,
    this.fontWeight = FontWeight.w500,
    this.height,
    this.padding,
    this.borderRadius = 8,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 38.h,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          borderRadius: SmoothBorderRadius(
            cornerRadius: (borderRadius ?? 8).r,
            cornerSmoothing: 1,
          ),
          child: Ink(
            decoration: ShapeDecoration(
              gradient:
                  gradient ??
                  const LinearGradient(
                    colors: [Color(0xFF2DBB7E), Color(0xFF22A06D)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
              shape: SmoothRectangleBorder(
                borderRadius: SmoothBorderRadius(
                  cornerRadius: (borderRadius ?? 8).r,
                  cornerSmoothing: 1,
                ),
              ),
            ),
            child: Container(
              padding:
                  padding ??
                  EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
              child: Center(
                child: Text(
                  text,
                  style: TextStyle(
                    fontSize: fontSize ?? 14.sp,
                    fontWeight: fontWeight,
                    color: textColor,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
