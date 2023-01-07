import 'dart:io';
import 'art.dart';

void printHighestBidder(Map<int, String> biddingRecord) {
  int highestBid = 0;
  for (final currentBid in biddingRecord.keys) {
    if (currentBid > highestBid) {
      highestBid = currentBid;
    }
  }
  if (highestBid == 0) {
    print("There is no winner as there are no bids.");
  } else {
    print(
        "The winner is ${biddingRecord[highestBid]} with a bid of \$$highestBid.");
  }
}

void main() {
  Map<int, String> bidders = {};
  bool otherBiddersPresent = false;
  print(logo);
  print("Welcome to the secret auction program.");

  do {
    // Clear console to hide previous bidders.
    if (otherBiddersPresent) {
      if (Platform.isWindows) {
        print(Process.runSync("cls", [], runInShell: true).stdout);
      } else {
        print(Process.runSync("clear", [], runInShell: true).stdout);
      }
    }
    stdout.write("What is your name?: ");
    String? nameInput = stdin.readLineSync();
    stdout.write("What is your bid?: \$");
    String? bidInput = stdin.readLineSync();
    if (nameInput != null &&
        nameInput != "" &&
        bidInput != null &&
        int.tryParse(bidInput) != null) {
      bidders[int.parse(bidInput)] = nameInput;
    } else {
      print("You have typed an invalid value. Please try again!");
    }
    print("Are there any other bidders? Type 'yes' or 'no'");
    otherBiddersPresent = stdin.readLineSync() == "yes" ? true : false;
  } while (otherBiddersPresent);

  printHighestBidder(bidders);
}
