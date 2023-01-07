import 'dart:io';
import 'alphabet.dart';
import 'art.dart';

void caesar(
    {required String startText,
    required int shiftAmount,
    required String cipherDirection}) {
  StringBuffer sb = StringBuffer();
  int letterIndex;
  int newLetterIndex;

  if (cipherDirection == "decode") {
    shiftAmount *= -1;
  }

  for (int i = 0; i < startText.length; i++) {
    letterIndex = alphabet.indexOf(startText[i]);
    if (letterIndex != -1) {
      if (shiftAmount < 0) {
        newLetterIndex = shiftRight(letterIndex + shiftAmount);
      } else {
        newLetterIndex = (letterIndex + shiftAmount) % 26;
      }
      sb.write(alphabet[newLetterIndex]);
    } else {
      sb.write(startText[i]);
    }
  }
  print("Here's the ${cipherDirection}d result: ${sb.toString()}");
}

// Recursively adds 26 so we shift to the right for positive indexing.
int shiftRight(int shiftAmount) {
  if (shiftAmount >= 0) {
    return shiftAmount;
  } else {
    return shiftRight(shiftAmount + 26);
  }
}

// A program that implements the caesar cipher.
void main() {
  print(logo);
  do {
    print("Type 'encode' to encrypt, type 'decode' to decrypt:");
    String? cipherDirectionInput = stdin.readLineSync();
    print("Type your message:");
    String? messageInput = stdin.readLineSync();
    print("Type the shift number:");
    String? shiftInput = stdin.readLineSync();

    if (cipherDirectionInput != null &&
        cipherDirectionInput != "" &&
        messageInput != null &&
        messageInput != "" &&
        shiftInput != null &&
        int.tryParse(shiftInput) != null) {
      caesar(
          startText: messageInput.trim().toLowerCase(),
          shiftAmount: int.parse(shiftInput),
          cipherDirection: cipherDirectionInput.trim());
    } else {
      print("You have typed an invalid value. Please try again!");
    }

    print("Type 'yes' if you want to go again. Otherwise type 'no'.");
  } while (stdin.readLineSync() == "yes");
  print("Goodbye");
}
