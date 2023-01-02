import 'dart:io';

// A program that calculates the average height from a list of heights.
// For practice sake, we can't use a 'length' or "reduce" function.
void main() {
  stdout.write("Input a list of student heights ");
  String? heightsInput = stdin.readLineSync();

  if (heightsInput != null && heightsInput != "") {
    int totalHeight = 0;
    int numberOfStudents = 0;
    int averageHeight = 0;
    List<String> studentHeights = heightsInput.trim().split(" ");

    for (int i = 0; i < studentHeights.length; i++) {
      if (int.tryParse(studentHeights[i]) != null) {
        totalHeight += int.parse(studentHeights[i]);
      }
    }

    // ignore: unused_local_variable
    for (final height in studentHeights) {
      numberOfStudents += 1;
    }

    averageHeight = (totalHeight / numberOfStudents).round();
    print(averageHeight);
  } else {
    print("You have typed an invalid value. Please try again!");
  }
}
