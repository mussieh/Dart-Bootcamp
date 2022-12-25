import 'dart:io';

void main() {
  stdout.write("Type a two digit number: ");
  String? twoDigitNumber = stdin.readLineSync();
  if (twoDigitNumber == "" ||
      twoDigitNumber == null ||
      twoDigitNumber.length != 2) {
    print("The input you typed is not a two digit number.");
  } else {
    print(int.parse(twoDigitNumber[0]) + int.parse(twoDigitNumber[1]));
  }
}
