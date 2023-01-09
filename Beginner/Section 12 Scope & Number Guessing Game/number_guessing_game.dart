import 'dart:io';
import 'dart:math';
import 'art.dart';

const easyLevelTurns = 10;
const hardLevelTurns = 5;

int checkAnswer(guess, answer, turns) {
  if (guess < answer) {
    print("Too low.");
    return turns - 1;
  } else if (guess > answer) {
    print("Too high.");
    return turns - 1;
  } else {
    print("You got it! The answer was $answer.");
    return 0;
  }
}

int setDifficulty() {
  stdout.write("Choose a difficulty. Type 'easy' or 'hard': ");
  String? difficultyLevelInput = stdin.readLineSync();

  if (difficultyLevelInput == "easy") {
    return easyLevelTurns;
  } else if (difficultyLevelInput == "hard") {
    return hardLevelTurns;
  } else {
    return 0;
  }
}

void guessTheNumber() {
  print(logo);
  int numberToGuess = Random().nextInt(100) + 1;
  int attempts;
  String? currentGuessInput;
  int currentGuess;
  print("Welcome to the Number Guessing Game!");
  print("I'm thinking of a number between 1 and 100.");
  print("Pssst, the correct answer is $numberToGuess");
  attempts = setDifficulty();

  while (attempts > 0) {
    print("You have $attempts attempts remaining to guess the number.");
    stdout.write("Make a guess: ");
    currentGuessInput = stdin.readLineSync() ?? "";
    currentGuess = int.tryParse(currentGuessInput) ?? 0;

    attempts = checkAnswer(currentGuess, numberToGuess, attempts);

    if (attempts == 0) {
      if (currentGuess == numberToGuess) {
        return;
      }
      print("You've run out of guesses, you lose.");
    } else {
      print("Guess again.");
    }
  }
}

void main() {
  guessTheNumber();
}
