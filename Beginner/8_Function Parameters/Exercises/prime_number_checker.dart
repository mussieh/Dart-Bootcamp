import 'dart:io';

void checkNumber({required int number}) {
  if (number == 1) {
    print("It's not a prime number.");
    return;
  }
  for (int i = 2; i < number; i++) {
    if (number % i == 0) {
      print("It's not a prime number.");
      return;
    }
  }
  print("It's a prime number.");
}

// This program checks if a number is a prime number or not.
void main() {
  stdout.write("Check this number: ");
  String? numberInput = stdin.readLineSync();
  if (numberInput != null && int.tryParse(numberInput) != null) {
    checkNumber(number: int.parse(numberInput));
  } else {
    print("You have typed an invalid value. Please try again!");
  }
}
