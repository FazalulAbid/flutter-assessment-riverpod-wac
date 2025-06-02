import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_assessment/core/constants/navigation_constants.dart';
import 'package:flutter_assessment/core/presentation/providers/navigation_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavigationWidget extends ConsumerWidget {
  const BottomNavigationWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navigationState = ref.watch(navigationProvider);
    final theme = Theme.of(context);

    return SizedBox(
      height: 72.h,
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: navigationState.tabIndex,
        onTap: (index) {
          HapticFeedback.lightImpact();
          ref.read(navigationProvider.notifier).setIndex(index);
        },
        selectedItemColor: theme.primaryColor,
        unselectedItemColor: theme.colorScheme.onSurface,
        backgroundColor: theme.colorScheme.surface,
        elevation: 0,
        selectedFontSize: 10.sp,
        unselectedFontSize: 10.sp,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w700),
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500),
        items:
            NavigationTab.values
                .map(
                  (tab) => BottomNavigationBarItem(
                    icon: Padding(
                      padding: EdgeInsets.only(bottom: 6.sp),
                      child: SvgPicture.asset(tab.iconPath, height: 24.sp, width: 24.sp),
                    ),
                    activeIcon: Padding(
                      padding: EdgeInsets.only(bottom: 6.sp),
                      child: SvgPicture.asset(tab.activeIconPath, height: 24.sp, width: 24.sp),
                    ),
                    label: tab.label,
                  ),
                )
                .toList(),
      ),
    );
  }
}
