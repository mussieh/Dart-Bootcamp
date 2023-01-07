import 'dart:io';

void calculateCansOfPaint(
    {required int height, required int width, required int coverage}) {
  int numberOfCans = ((height * width) / coverage).ceil();
  print("You'll need $numberOfCans cans of paint.");
}

// A program for calculating the number of cans of paint for a paint project.
void main() {
  const coverage = 5;
  stdout.write("Enter height of wall: ");
  String? heightInput = stdin.readLineSync();
  stdout.write("Enter width of wall: ");
  String? widthInput = stdin.readLineSync();

  if (heightInput != null &&
      widthInput != null &&
      int.tryParse(heightInput) != null &&
      int.tryParse(widthInput) != null) {
    calculateCansOfPaint(
        height: int.parse(heightInput),
        width: int.parse(widthInput),
        coverage: coverage);
  } else {
    print("You have typed an invalid value. Please try again!");
  }
}
