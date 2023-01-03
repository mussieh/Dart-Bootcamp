import 'dart:io';
import 'dart:math';
import 'hangman_art.dart';
import 'hangman_words.dart';

List<String> generateBlanks(String word) {
  List<String> blanks = [];
  for (int i = 0; i < word.length; i++) {
    blanks.add("_");
  }
  return blanks;
}

void replaceBlanks(String letter, String word, List<String> blanks) {
  for (int i = 0; i < word.length; i++) {
    if (word[i] == letter) {
      blanks[i] = letter;
    }
  }
}

// A program that plays the Hangman game.
void main() {
  print(hangmanGraphic);
  List<String> figures = [
    zeroLifeLeftFigure,
    oneLifeLeftFigure,
    twoLivesLeftFigure,
    threeLivesLeftFigure,
    fourLivesLeftFigure,
    fiveLivesLeftFigure,
    sixLivesLeftFigure
  ];
  String randomWord = words.elementAt(Random().nextInt(words.length));
  List<String> blanks = generateBlanks(randomWord);
  int livesLeft = 6;
  String letterInput;

  while (livesLeft > 0) {
    stdout.write("Guess a letter: ");
    letterInput = stdin.readLineSync().toString().trim().toLowerCase();
    if (blanks.contains(letterInput)) {
      print("You've already guessed $letterInput");
    }
    if (randomWord.contains(letterInput)) {
      replaceBlanks(letterInput, randomWord, blanks);
    } else {
      print(
          "You guessed $letterInput, that's not in the word. You lose a life.");
      livesLeft--;
      if (livesLeft == 0) {
        print("You lose.");
      }
    }
    print(blanks.join(" "));
    if (!blanks.contains("_")) {
      print("You win.");
      print(figures[livesLeft]);
      break;
    }
    print("\n");
    print(figures[livesLeft]);
  }
  print("The random word was $randomWord");
}
