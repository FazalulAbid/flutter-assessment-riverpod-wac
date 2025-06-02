import 'package:flutter/material.dart';
import 'package:flutter_assessment/core/constants/app_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AvailabilityScreen extends StatelessWidget {
  const AvailabilityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(AppIcons.availability, height: 60, width: 60),
          const SizedBox(height: 16),
          const Text('Availability', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}
