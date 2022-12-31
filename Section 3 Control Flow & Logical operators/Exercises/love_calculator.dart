import 'dart:io';

// A program that tests the compatibility between two people using their names.
void main() {
  print("Welcome to the Love Calculator!");
  print("What is your name?");
  stdout.write(" ");
  String? name = stdin.readLineSync();

  print("What is their name?");
  stdout.write(" ");
  String? otherName = stdin.readLineSync();

  if (name == "" || name == null || otherName == "" || otherName == null) {
    print("You have typed an invalid value. Please try again!");
  } else {
    String combinedName = (name + otherName).toLowerCase().replaceAll(" ", "");
    // Check the number of occurrences of the letters in 'true' and 'love' based
    // on the rules of the game.
    int trueOccurrences = 0;
    trueOccurrences += "t".allMatches(combinedName).length;
    trueOccurrences += "r".allMatches(combinedName).length;
    trueOccurrences += "u".allMatches(combinedName).length;
    trueOccurrences += "e".allMatches(combinedName).length;

    int loveOccurrences = 0;
    loveOccurrences += "l".allMatches(combinedName).length;
    loveOccurrences += "o".allMatches(combinedName).length;
    loveOccurrences += "v".allMatches(combinedName).length;
    loveOccurrences += "e".allMatches(combinedName).length;

    int loveScore =
        int.parse(trueOccurrences.toString() + loveOccurrences.toString());

    if (loveScore < 10 || loveScore > 90) {
      print("Your score is $loveScore, you go together like coke and mentos.");
    } else if (loveScore > 40 && loveScore < 50) {
      print("Your score is $loveScore, you are alright together.");
    } else {
      print("Your score is $loveScore.");
    }
  }
}
