import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCheckbox extends StatelessWidget {
  final bool isSelected;
  final VoidCallback onChanged;
  final String text;

  const CustomCheckbox({
    super.key,
    required this.isSelected,
    required this.onChanged,
    this.text = '',
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (text.isNotEmpty) ...[
          Text(
            text,
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(width: 8.w),
        ],
        GestureDetector(
          onTap: onChanged,
          child: Container(
            width: 21.w,
            height: 21.w,
            decoration: BoxDecoration(
              color: isSelected ? Colors.black : Colors.transparent,
              borderRadius: BorderRadius.circular(6.r),
              border: Border.all(
                color: isSelected ? Colors.black : Colors.grey[400]!,
                width: 2,
              ),
            ),
            child:
                isSelected
                    ? Center(
                      child: Icon(
                        Icons.check,
                        size: 16.sp,
                        color: Colors.white,
                      ),
                    )
                    : null,
          ),
        ),
      ],
    );
  }
}
