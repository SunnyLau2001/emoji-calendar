class AppSettings {
  static DateTime calendarStartDate = DateTime(2020, 1, 1);
  static DateTime calendarEndDate = DateTime(2030, 12, 31);

  static DateTime get startDate => adjustedStartDate(calendarStartDate);
  static DateTime get endDate => adjustedEndDate(calendarEndDate);

  static DateTime adjustedStartDate(DateTime date) {
    final numOfDayBack = date.weekday % 7; // ensure minus 1 to 6 not 7
    return DateTime(date.year, date.month, date.day - numOfDayBack);
  }

  static DateTime adjustedEndDate(DateTime date) {
    final numOfDayForward = 6 - date.weekday; // ensure minus 1 to 6 not 7
    return DateTime(date.year, date.month, date.day + numOfDayForward);
  }
}
