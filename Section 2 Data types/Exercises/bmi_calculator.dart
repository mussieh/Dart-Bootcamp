import 'dart:io';
import 'dart:math';

void main() {
  stdout.write("Enter your height: ");
  String? height = stdin.readLineSync();

  stdout.write("Enter your weight: ");
  String? weight = stdin.readLineSync();

  if (height == "" || height == null || weight == "" || weight == null) {
    print("You have typed an empty value. Please try again!");
  } else if (double.tryParse(height) == null ||
      double.tryParse(weight) == null) {
    print("You have typed a disallowed value. Please try again!");
  } else {
    double heightParsed = double.parse(height);
    double weightParsed = double.parse(weight);
    int bmi = weightParsed ~/ pow(heightParsed, 2);
    print(bmi);
  }
}
