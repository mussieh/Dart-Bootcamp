import 'dart:io';

// A program that calculates the highest score from a list of scores.
// For practice sake, 'max' and 'min' functions are not allowed.
void main() {
  stdout.write("Input a list of student scores ");
  String? scoresInput = stdin.readLineSync();

  if (scoresInput != null && scoresInput != "") {
    int highestScore = 0;
    List<String> studentScores = scoresInput.trim().split(" ");

    for (final score in studentScores) {
      if (int.tryParse(score) != null) {
        int studentScore = int.parse(score);
        if (studentScore > highestScore) {
          highestScore = studentScore;
        }
      }
    }
    print("The highest score in the class is: $highestScore");
  } else {
    print("You have typed an invalid value. Please try again!");
  }
}
