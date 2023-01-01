import 'dart:io';
import 'dart:math';

String rock = '''
    _______
---'   ____)
      (_____)
      (_____)
      (____)
---.__(___)
''';

String paper = '''
    _______
---'   ____)____
          ______)
          _______)
         _______)
---.__________)
''';

String scissors = '''
    _______
---'   ____)____
          ______)
       __________)
      (____)
---.__(___)
''';

// A program that plays the rock paper scissors hand game.
void main() {
  List<String> gameOptions = [rock, paper, scissors];
  print("What do you choose? Type 0 for Rock, 1 for Paper or 2 for Scissors.");

  String? userChoice = stdin.readLineSync();
  if (userChoice != null &&
      userChoice != "" &&
      int.tryParse(userChoice) != null) {
    int userChoiceParsed = int.parse(userChoice);

    if (userChoiceParsed >= 3 || userChoiceParsed < 0) {
      print("You typed an invalid number, you lose!");
    } else {
      print(gameOptions[userChoiceParsed]);

      print("Computer chose:");
      int computerChoice = Random().nextInt(gameOptions.length);
      print(gameOptions[computerChoice]);

      if (userChoiceParsed == 0 && computerChoice == 2) {
        print("You win!");
      } else if (computerChoice == 0 && userChoiceParsed == 2) {
        print("You lose");
      } else if (computerChoice > userChoiceParsed) {
        print("You lose");
      } else if (userChoiceParsed > computerChoice) {
        print("You win!");
      } else if (computerChoice == userChoiceParsed) {
        print("It's a draw");
      }
    }
  }
}
