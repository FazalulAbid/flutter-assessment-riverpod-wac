import 'package:flutter/material.dart';
import 'package:flutter_assessment/core/constants/app_icons.dart';
import 'package:flutter_assessment/core/presentation/providers/navigation_provider.dart';
import 'package:flutter_assessment/core/presentation/widgets/bottom_navigation_widget.dart';
import 'package:flutter_assessment/core/presentation/widgets/main_app_bar_actions.dart';
import 'package:flutter_assessment/core/presentation/widgets/svg_icon.dart';
import 'package:flutter_assessment/features/availability/presentation/availability_screen.dart';
import 'package:flutter_assessment/features/booking/presentation/booking_screen.dart';
import 'package:flutter_assessment/features/find_shifts/presentation/find_shifts_screen.dart';
import 'package:flutter_assessment/features/home/presentation/home_screen.dart';
import 'package:flutter_assessment/features/timesheet/presentation/timesheet_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainScreen extends ConsumerWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTab = ref.watch(navigationProvider);
    final currentIndex = currentTab.tabIndex;

    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        toolbarHeight: 64.h,
        title: Text(currentTab.label),
        actions: [AppBarActions(tab: currentTab)],
        leading: IconButton(icon: SvgIcon(assetPath: AppIcons.menu), onPressed: () {}),
        backgroundColor: Theme.of(context).colorScheme.surface,
        foregroundColor: Theme.of(context).colorScheme.onSurface,
      ),
      body: IndexedStack(
        index: currentIndex,
        children: const [
          HomeScreen(),
          FindShiftsScreen(),
          BookingScreen(),
          TimesheetScreen(),
          AvailabilityScreen(),
        ],
      ),
      bottomNavigationBar: const BottomNavigationWidget(),
    );
  }
}
