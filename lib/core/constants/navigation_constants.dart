import 'package:flutter_assessment/core/constants/app_icons.dart';

enum NavigationTab {
  home(0, 'Home', AppIcons.home, AppIcons.homeSelected),
  findShifts(1, 'Find Shifts', AppIcons.findShifts, AppIcons.findShiftsSelected),
  bookings(2, 'Booking', AppIcons.booking, AppIcons.bookingSelected),
  timeSheets(3, 'Time Sheets', AppIcons.timesheet, AppIcons.timesheetSelected),
  availability(4, 'Availability', AppIcons.availability, AppIcons.availabilitySelected);

  const NavigationTab(this.tabIndex, this.label, this.iconPath, this.activeIconPath);

  final int tabIndex;
  final String label;
  final String iconPath;
  final String activeIconPath;
}
