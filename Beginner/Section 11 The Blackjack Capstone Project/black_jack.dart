import 'dart:math';
import 'dart:io';
import 'art.dart';

int pickRandomCard(List<int> cards) {
  return cards[Random().nextInt(cards.length)];
}

int getScore(List<int> cards) {
  return cards.reduce((value, element) => value + element);
}

void hitComputer(List<int> computerCards) {
  while (getScore(computerCards) < 17) {
    computerCards.add(pickRandomCard(deckOfCards));
  }
}

void hitUser(List<int> userCards) {
  userCards.add(pickRandomCard(deckOfCards));
}

bool isGameOver(List<int> userCards, List<int> computerCards) {
  int userScore = getScore(userCards);
  int computerScore = getScore(computerCards);

  if (userScore == 21 ||
      userScore > 21 ||
      computerScore == 21 ||
      computerScore > 21) {
    return true;
  }
  return false;
}

void printGameResults(List<int> userCards, List<int> computerCards) {
  int userScore = getScore(userCards);
  int computerScore = getScore(computerCards);

  if (userCards.length == 2 && userScore == 21) {
    print("Win with a Blackjack 😎");
  } else if (userScore > 21) {
    print("You went over. You lose 😭");
  } else if (computerScore > 21) {
    print("Opponent went over. You win 😁");
  } else if (userScore > computerScore) {
    print("You win 😃");
  } else if (userScore == computerScore) {
    print("Draw 🙃");
  } else {
    if (computerCards.length == 2 && computerScore == 21) {
      print("You lose, opponent has Blackjack 😱");
    } else {
      print("You lose 😤");
    }
  }
}

void blackjack() {
  stdout.write("Do you want to play a game of Blackjack? Type 'y' or 'n': ");
  if (stdin.readLineSync() == 'y') {
    print(logo);
    List<int> userCards = [
      pickRandomCard(deckOfCards),
      pickRandomCard(deckOfCards)
    ];
    int computerScore = pickRandomCard(deckOfCards);
    List<int> computerCards = [computerScore];
    bool shouldGetAnotherCard = true;

    while (!isGameOver(userCards, computerCards) && shouldGetAnotherCard) {
      print("   Your cards: $userCards, current score: ${getScore(userCards)}");
      print("   Computer's first card: $computerScore");

      stdout.write("Type 'y' to get another card, type 'n' to pass: ");
      shouldGetAnotherCard = stdin.readLineSync() == "y" ? true : false;
      if (shouldGetAnotherCard) {
        hitUser(userCards);
      }
    }
    hitComputer(computerCards);

    print(
        "   Your final hand: $userCards, final score: ${getScore(userCards)}");
    print("   Computer's final hand: $computerCards, " +
        "final score: ${getScore(computerCards)}");
    printGameResults(userCards, computerCards);
    blackjack();
  }
}

// A program that plays the blackjack game
void main() {
  blackjack();
}
