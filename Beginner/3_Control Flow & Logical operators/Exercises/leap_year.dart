import 'dart:io';

// This program calculates if a given year is a leap year or not.
void main() {
  stdout.write("Which year do you want to check? ");
  String? year = stdin.readLineSync();

  if (year == "" || year == null || int.tryParse(year) == null) {
    print("You have typed an invalid value. Please try again!");
  } else {
    int yearParsed = int.parse(year);
    if (yearParsed % 4 == 0) {
      if (yearParsed % 100 == 0) {
        if (yearParsed % 400 == 0) {
          print("Leap year.");
        } else {
          print("Not leap year.");
        }
      } else {
        print("Leap year.");
      }
    } else {
      print("Not leap year.");
    }
  }
}
