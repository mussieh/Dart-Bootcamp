import 'dart:io';
import 'dart:math';

// A program that generates a random password
void main() {
  List<String> letters = [
    'a',
    'b',
    'c',
    'd',
    'e',
    'f',
    'g',
    'h',
    'i',
    'j',
    'k',
    'l',
    'm',
    'n',
    'o',
    'p',
    'q',
    'r',
    's',
    't',
    'u',
    'v',
    'w',
    'x',
    'y',
    'z',
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J',
    'K',
    'L',
    'M',
    'N',
    'O',
    'P',
    'Q',
    'R',
    'S',
    'T',
    'U',
    'V',
    'W',
    'X',
    'Y',
    'Z'
  ];
  List<String> symbols = ['!', '#', '\$', '%', '&', '(', ')', '*', '+'];
  List<String> numbers = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];

  print("Welcome to the Dart Password Generator!");
  print("How many letters would you like in your password?");
  String? lettersInput = stdin.readLineSync();

  print("How many symbols would you like?");
  String? symbolsInput = stdin.readLineSync();

  print("How many numbers would you like?");
  String? numbersInput = stdin.readLineSync();

  if (lettersInput != null &&
      lettersInput != "" &&
      int.tryParse(lettersInput) != null &&
      symbolsInput != null &&
      symbolsInput != "" &&
      int.tryParse(symbolsInput) != null &&
      numbersInput != null &&
      numbersInput != "" &&
      int.tryParse(numbersInput) != null) {
    int numberOfLetters = int.parse(lettersInput);
    int numberOfSymbols = int.parse(symbolsInput);
    int numbersCount = int.parse(numbersInput);
    List<String> passwordChars = [];
    Random randomNumberGenerator = Random();

    for (int i = 0; i < numberOfLetters; i++) {
      passwordChars.add(
          letters.elementAt(randomNumberGenerator.nextInt(letters.length)));
    }

    for (int i = 0; i < numberOfSymbols; i++) {
      passwordChars.add(
          symbols.elementAt(randomNumberGenerator.nextInt(symbols.length)));
    }

    for (int i = 0; i < numbersCount; i++) {
      passwordChars.add(
          numbers.elementAt(randomNumberGenerator.nextInt(numbers.length)));
    }

    print(passwordChars);
    passwordChars.shuffle();
    print(passwordChars);
    print("Your password is: " + passwordChars.join());
  } else {
    print("You have typed an invalid value. Please try again!");
  }
}
