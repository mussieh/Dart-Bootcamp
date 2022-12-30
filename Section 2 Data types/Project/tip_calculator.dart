import 'dart:io';

// Calculates the tip for a waiter/waitress with given percentage and group
// of people.
void main() {
  print("Welcome to the tip calculator.");
  stdout.write("What was the total bill? \$");
  String? totalBill = stdin.readLineSync();

  stdout.write("What percentage tip would you like to give? 10, 12, or 15? ");
  String? tipPercentage = stdin.readLineSync();

  stdout.write("How many people to split the bill? ");
  String? numberOfPeople = stdin.readLineSync();

  if (totalBill == "" ||
      totalBill == null ||
      double.tryParse(totalBill) == null ||
      tipPercentage == "" ||
      tipPercentage == null ||
      int.tryParse(tipPercentage) == null ||
      numberOfPeople == "" ||
      numberOfPeople == null ||
      int.tryParse(numberOfPeople) == null) {
    print("You have typed an invalid value. Please try again!");
  } else {
    double tipPercentageMultiplier = (int.parse(tipPercentage) / 100) + 1;
    double billPerPerson = (double.parse(totalBill) * tipPercentageMultiplier) /
        int.parse(numberOfPeople);
    print("Each person should pay: \$${billPerPerson.toStringAsFixed(2)}");
  }
}
