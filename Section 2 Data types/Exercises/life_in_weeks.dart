import 'dart:io';

// Calculates a person's life expectancy till age 90 in days, weeks and months.
void main() {
  stdout.write("What is your current age? ");
  String? age = stdin.readLineSync();
  if (age == "" || age == null || int.tryParse(age) == null) {
    print("You have typed an invalid value. Please try again!");
  } else {
    int yearsLeft = 90 - int.parse(age);
    int daysLeft = 365 * yearsLeft;
    int weeksLeft = 52 * yearsLeft;
    int monthsLeft = 12 * yearsLeft;
    print(
        "You have $daysLeft days, $weeksLeft weeks, and ${monthsLeft} months left.");
  }
}
