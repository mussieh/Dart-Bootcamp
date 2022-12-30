import 'dart:io';

// Calculates if a number is even or odd.
// This is for practice only as dart has built-in support for that check.
void main() {
  stdout.write("Which number do you want to check? ");
  String? userInput = stdin.readLineSync();
  if (userInput == "" || userInput == null || int.tryParse(userInput) == null) {
    print("The input you typed is not a valid number.");
  } else {
    // use someNum.isEven in production code
    int.parse(userInput) % 2 == 0
        ? print("This is an even number.")
        : print("This is an odd number.");
  }
}
