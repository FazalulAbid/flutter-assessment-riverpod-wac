import 'package:flutter/material.dart';
import 'package:flutter_assessment/core/constants/navigation_constants.dart';

class AppBarActions extends StatelessWidget {
  final NavigationTab tab;

  const AppBarActions({super.key, required this.tab});

  @override
  Widget build(BuildContext context) {
    switch (tab) {
      case NavigationTab.home:
        return Row(children: []);

      case NavigationTab.findShifts:
        return Row(children: []);

      case NavigationTab.bookings:
        return Row(children: []);

      case NavigationTab.timeSheets:
        return Row(
          children: [
            TextButton(
              onPressed: () {},
              child: const Text(
                'View Payments',
                style: TextStyle(color: Colors.green, fontSize: 15, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        );

      case NavigationTab.availability:
        return Row(children: []);
    }
  }
}
