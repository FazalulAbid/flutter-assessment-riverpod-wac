import 'package:flutter/material.dart';
import 'package:flutter_assessment/features/timesheet/presentation/widgets/time_sheet_card_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WithdrawBottomSection extends StatelessWidget {
  final String amount;
  final String totalShifts;
  final Color? withdrawButtonColor;
  final VoidCallback? onWithdrawPressed;

  const WithdrawBottomSection({
    super.key,
    this.amount = '€115',
    this.totalShifts = '2 Shifts',
    this.withdrawButtonColor,
    this.onWithdrawPressed,
  });

  @override
  Widget build(BuildContext context) {
    final Color buttonColor =
        withdrawButtonColor ?? Theme.of(context).primaryColor;

    return Container(
      height: 70.h,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Color(0xFFE0E3E7), width: 1)),
      ),
      child: SafeArea(
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    amount,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Total: $totalShifts',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 16.w),
            TimeSheetCardButton(onPressed: onWithdrawPressed, text: 'Withdraw'),
          ],
        ),
      ),
    );
  }
}
