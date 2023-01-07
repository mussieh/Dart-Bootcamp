import 'dart:io';
import 'dart:math';

// Calculates the BMI of a person and displays their BMI status.
void main() {
  stdout.write("Enter your height in m: ");
  String? height = stdin.readLineSync();

  stdout.write("Enter your weight in kg: ");
  String? weight = stdin.readLineSync();

  if (height == "" ||
      height == null ||
      weight == "" ||
      weight == null ||
      double.tryParse(height) == null ||
      double.tryParse(weight) == null) {
    print("You have typed an invalid value. Please try again!");
  } else {
    int bmi = (double.parse(weight) / pow(double.parse(height), 2)).round();
    if (bmi < 18.5) {
      print("Your BMI is $bmi, you are underweight.");
    } else if (bmi > 18.5 && bmi < 25) {
      print("Your BMI is $bmi, you have a normal weight.");
    } else if (bmi > 25 && bmi < 30) {
      print("Your BMI is $bmi, you are slightly overweight.");
    } else if (bmi > 30 && bmi < 35) {
      print("Your BMI is $bmi, you are obese.");
    } else {
      print("Your BMI is $bmi, you are clinically obese.");
    }
  }
}
