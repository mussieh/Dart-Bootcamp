import 'dart:io';

/// Determines if a given year is a leap year or not.
bool isLeapYear(int year) {
  if (year % 4 == 0) {
    if (year % 100 == 0) {
      if (year % 400 == 0) {
        return true;
      } else {
        return false;
      }
    } else {
      return true;
    }
  } else {
    return false;
  }
}

/// Provides the days in a month taking leap years into account.
int daysInMonth({required int year, required int month}) {
  List<int> monthDays = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
  if (month == 2 && isLeapYear(year)) {
    return 29;
  }
  return monthDays[month - 1];
}

// A program that determines the days in a month.
void main() {
  stdout.write("Enter a year: ");
  String? yearInput = stdin.readLineSync();
  stdout.write("Enter a month: ");
  String? monthInput = stdin.readLineSync();

  if (yearInput != null &&
      int.tryParse(yearInput) != null &&
      monthInput != null &&
      int.tryParse(monthInput) != null) {
    int days =
        daysInMonth(year: int.parse(yearInput), month: int.parse(monthInput));
    print(days);
  } else {
    print("You have typed an invalid value. Please try again!");
  }
}
