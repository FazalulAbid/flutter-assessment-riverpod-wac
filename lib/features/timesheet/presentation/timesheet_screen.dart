import 'package:flutter/material.dart';
import 'package:flutter_assessment/features/timesheet/presentation/controller/timesheet_provider.dart';
import 'package:flutter_assessment/features/timesheet/presentation/entities/flagged_timesheet_ui_model.dart';
import 'package:flutter_assessment/features/timesheet/presentation/entities/submitted_timesheet_ui_model.dart';
import 'package:flutter_assessment/features/timesheet/presentation/entities/unattended_timesheet_ui_model.dart';
import 'package:flutter_assessment/features/timesheet/presentation/entities/withdraw_timesheet_ui_model.dart';
import 'package:flutter_assessment/features/timesheet/presentation/tabs/flagged_timesheet_tab.dart';
import 'package:flutter_assessment/features/timesheet/presentation/tabs/submitted_timesheet_tab.dart';
import 'package:flutter_assessment/features/timesheet/presentation/tabs/unattended_timesheet_tab.dart';
import 'package:flutter_assessment/features/timesheet/presentation/tabs/withdraw_timesheet_tab.dart';
import 'package:flutter_assessment/features/timesheet/presentation/widgets/balance_card.dart';
import 'package:flutter_assessment/features/timesheet/presentation/widgets/withdraw_bottom_section.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TimesheetScreen extends ConsumerStatefulWidget {
  const TimesheetScreen({super.key});

  @override
  ConsumerState<TimesheetScreen> createState() => _TimesheetScreenState();
}

class _TimesheetScreenState extends ConsumerState<TimesheetScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  late AnimationController _animationController;
  late Animation<double> _heightAnimation;

  final double withdrawSectionHeight = 70.h;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(_handleTabSelection);

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _heightAnimation = Tween<double>(
      begin: 0.0,
      end: withdrawSectionHeight,
    ).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    // Load initial data
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(timesheetNotifierProvider.notifier).loadTimesheets();
    });
  }

  void _handleTabSelection() {
    ref
        .read(timesheetNotifierProvider.notifier)
        .selectTab(_tabController.index);

    if (_tabController.index == 1) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
  }

  @override
  void dispose() {
    _tabController.removeListener(_handleTabSelection);
    _tabController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  Future<void> _handleRefresh() async {
    await ref.read(timesheetNotifierProvider.notifier).refreshCurrentTab();
  }

  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
        action: SnackBarAction(
          label: 'Retry',
          textColor: Colors.white,
          onPressed: () {
            ref.read(timesheetNotifierProvider.notifier).loadTimesheets();
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final paymentState = ref.watch(timesheetNotifierProvider);
    final theme = Theme.of(context);

    if (paymentState.errorMessage != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _showErrorSnackBar(paymentState.errorMessage!);
        ref.read(timesheetNotifierProvider.notifier).clearError();
      });
    }

    if (_tabController.index != paymentState.selectedTab) {
      _tabController.animateTo(paymentState.selectedTab);

      if (paymentState.selectedTab == 1) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    }

    return Scaffold(
      backgroundColor: theme.colorScheme.primaryContainer,
      body: Stack(
        children: [
          AnimatedBuilder(
            animation: _heightAnimation,
            builder: (context, child) {
              return NestedScrollView(
                headerSliverBuilder: (context, innerBoxIsScrolled) {
                  return [
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 4.h),
                        child: BalanceCard(
                          totalBalance: paymentState.totalBalance,
                          holidayPayBalance: paymentState.holidayPayBalance,
                        ),
                      ),
                    ),
                    SliverPersistentHeader(
                      pinned: true,
                      delegate: _CustomTabBarDelegate(
                        tabBar: _buildCustomTabBar(theme),
                      ),
                    ),
                  ];
                },
                body: Container(
                  padding: EdgeInsets.only(bottom: _heightAnimation.value),
                  child:
                      paymentState.isLoading && _isAllDataEmpty(paymentState)
                          ? const Center(child: CircularProgressIndicator())
                          : TabBarView(
                            controller: _tabController,
                            children: [
                              SubmittedTimeSheetTab(
                                items: paymentState.submittedItems,
                                onItemClick: (id) {
                                  // On item click
                                },
                                onSelectAll: () {
                                  ref
                                      .read(timesheetNotifierProvider.notifier)
                                      .selectAll();
                                },
                                selectedCount: paymentState.selectedCount,
                                onRefresh: _handleRefresh,
                              ),
                              WithdrawTimeSheetTab(
                                items: paymentState.withdrawItems,
                                onItemToggle: (id) {
                                  ref
                                      .read(timesheetNotifierProvider.notifier)
                                      .toggleItemSelection(id);
                                },
                                onSelectAll: () {
                                  ref
                                      .read(timesheetNotifierProvider.notifier)
                                      .selectAll();
                                },
                                selectedCount: paymentState.selectedCount,
                                totalItems: _getTotalWithdrawItemsCount(
                                  paymentState.withdrawItems,
                                ),
                                onRefresh: _handleRefresh,
                              ),
                              FlaggedTimeSheetTab(
                                items: paymentState.flaggedItems,
                                onItemToggle: (id) {
                                  // On Item Click
                                },
                                onSelectAll: () {
                                  ref
                                      .read(timesheetNotifierProvider.notifier)
                                      .selectAll();
                                },
                                selectedCount: paymentState.selectedCount,
                                onRefresh: _handleRefresh,
                              ),
                              UnattendedTimeSheetTab(
                                items: paymentState.unattendedItems,
                                onItemToggle: (id) {
                                  // Handle on item click
                                },
                                onSelectAll: () {
                                  ref
                                      .read(timesheetNotifierProvider.notifier)
                                      .selectAll();
                                },
                                selectedCount: paymentState.selectedCount,
                                onRefresh: _handleRefresh,
                              ),
                            ],
                          ),
                ),
              );
            },
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            bottom: _tabController.index == 1 ? 0 : -withdrawSectionHeight,
            left: 0,
            right: 0,
            child: WithdrawBottomSection(
              amount: '€115',
              totalShifts: '2 Shifts',
              onWithdrawPressed: () {},
            ),
          ),
        ],
      ),
    );
  }

  bool _isAllDataEmpty(paymentState) {
    return paymentState.submittedItems.isEmpty &&
        paymentState.withdrawItems.isEmpty &&
        paymentState.flaggedItems.isEmpty &&
        paymentState.unattendedItems.isEmpty;
  }

  int _getTotalWithdrawItemsCount(List<WithdrawTimeSheetUiModel> items) {
    return items.fold(0, (sum, week) => sum + week.items.length);
  }

  Widget _buildCustomTabBar(ThemeData theme) {
    return Container(
      color: theme.colorScheme.primaryContainer,
      child: TabBar(
        controller: _tabController,
        onTap: (index) {
          ref.read(timesheetNotifierProvider.notifier).selectTab(index);
        },
        isScrollable: true,
        tabAlignment: TabAlignment.start,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        indicatorColor: Colors.black,
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(
            width: 2.h,
            color: theme.colorScheme.onSurface,
          ),
        ),
        indicatorWeight: 2.0,
        indicatorSize: TabBarIndicatorSize.label,
        labelColor: Colors.black,
        unselectedLabelColor: const Color(0xFF999999),
        labelStyle: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
        unselectedLabelStyle: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
        ),
        labelPadding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 12.h),
        dividerColor: theme.colorScheme.outline,
        dividerHeight: 2.h,
        tabs: const [
          Tab(text: 'Submitted'),
          Tab(text: 'Withdraw'),
          Tab(text: 'Flagged'),
          Tab(text: 'Unattended'),
        ],
      ),
    );
  }
}

class _CustomTabBarDelegate extends SliverPersistentHeaderDelegate {
  final Widget tabBar;

  _CustomTabBarDelegate({required this.tabBar});

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return tabBar;
  }

  @override
  double get maxExtent => 60.h;

  @override
  double get minExtent => 60.h;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}
