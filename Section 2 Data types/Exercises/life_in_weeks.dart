import 'dart:io';

void main() {
  stdout.write("What is your current age? ");
  var age = stdin.readLineSync();
  if (age == "" || age == null || int.tryParse(age) == null) {
    print("You have typed an invalid value. Please try again!");
  } else {
    int ageParsed = int.parse(age);
    int yearsLeft = 90 - ageParsed;
    int daysLeft = 365 * yearsLeft;
    int weeksLeft = 52 * yearsLeft;
    int monthsLeft = 12 * yearsLeft;
    print(
        "You have $daysLeft days, $weeksLeft weeks, and $monthsLeft months left.");
  }
}
