import 'dart:io';
import 'dart:math';

// Calculates the BMI of a person.
void main() {
  stdout.write("Enter your height: ");
  String? height = stdin.readLineSync();

  stdout.write("Enter your weight: ");
  String? weight = stdin.readLineSync();

  if (height == "" || height == null || weight == "" || weight == null) {
    print("You have typed an empty value. Please try again!");
  } else if (double.tryParse(height) == null ||
      double.tryParse(weight) == null) {
    print("You have typed an invalid value. Please try again!");
  } else {
    print(double.parse(weight) ~/ pow(double.parse(height), 2));
  }
}
