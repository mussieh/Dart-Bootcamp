import 'dart:io';
import 'dart:math';
import 'art.dart';
import 'game_data.dart';

const nameKeyword = "name";
const followerCountKeyword = "follower_count";
const descriptionKeyword = "description";
const countryKeyword = "country";

const aLiteral = "a";
const bLiteral = "b";

// Randomly pick an Instagram account.
// If two accounts are identical, pick an account again.
Map<String, dynamic> pickInstagramAccount(
    [Map<String, dynamic>? previousAccount]) {
  var currentInstagramAccount = data[Random().nextInt(data.length)];
  while (previousAccount != null &&
      previousAccount[nameKeyword] == currentInstagramAccount[nameKeyword]) {
    currentInstagramAccount = data[Random().nextInt(data.length)];
  }
  return currentInstagramAccount;
}

// Formats the game status output.
String getFormattedOutput(Map<String, dynamic> account) {
  String name = account[nameKeyword];
  String description = account[descriptionKeyword];
  String country = account[countryKeyword];
  return "$name, a/an $description, from (the) $country";
}

// Check if the answer from the user is correct in terms of which Instagram
// account has more followers.
bool checkAnswer(int primaryAccountFollowers, int secondaryAccountFollowers,
    String? followersInput) {
  if (primaryAccountFollowers > secondaryAccountFollowers) {
    return followersInput == aLiteral;
  } else if (primaryAccountFollowers < secondaryAccountFollowers) {
    return followersInput == bLiteral;
  } else {
    return true;
  }
}

// Clears the console
void clearScreen() {
  if (Platform.isWindows) {
    print(Process.runSync("cls", [], runInShell: true).stdout);
  } else {
    print(Process.runSync("clear", [], runInShell: true).stdout);
  }
}

// Play the Higher Lower Game.
void higherLowerGame() {
  var firstAccount = pickInstagramAccount();
  var secondAccount = pickInstagramAccount(firstAccount);
  String? userInput;
  bool answerCorrect;
  int score = 0;

  do {
    print(logo);
    if (score > 0) {
      print("You're right! Current score: $score.");
    }
    print("Compare A: ${getFormattedOutput(firstAccount)}.");
    print(vs);
    print("Against B: ${getFormattedOutput(secondAccount)}.");
    stdout.write("Who has more followers? Type 'a' or 'b': ");
    userInput = stdin.readLineSync();

    int primaryAccountFollowers = firstAccount[followerCountKeyword];
    int secondaryAccountFollowers = secondAccount[followerCountKeyword];
    answerCorrect = checkAnswer(
        primaryAccountFollowers, secondaryAccountFollowers, userInput);

    score = answerCorrect == true ? ++score : score;
    firstAccount = secondAccount;
    secondAccount = pickInstagramAccount(firstAccount);
    clearScreen();
  } while (answerCorrect);

  print(logo);
  print("Sorry, that's wrong. Final score: $score");
}

// A program that plays the Higher Lower game on Instagram accounts.
void main() {
  higherLowerGame();
}
