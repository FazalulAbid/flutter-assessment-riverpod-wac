import 'package:flutter_assessment/core/constants/navigation_constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final navigationProvider = StateNotifierProvider<NavigationNotifier, NavigationTab>(
  (ref) => NavigationNotifier(),
);

class NavigationNotifier extends StateNotifier<NavigationTab> {
  NavigationNotifier() : super(NavigationTab.home);

  void setTab(NavigationTab tab) {
    state = tab;
  }

  void setIndex(int index) {
    state = NavigationTab.values.firstWhere(
      (tab) => tab.tabIndex == index,
      orElse: () => NavigationTab.home,
    );
  }
}
