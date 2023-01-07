import 'dart:io';

// An automatic pizza order program that calculates a total bill for pizza.
void main() {
  print("Welcome to Dart Pizza Deliveries!");
  stdout.write("What size pizza do you want? S, M, or L ");
  String? pizzaSize = stdin.readLineSync();

  stdout.write("Do you want pepperoni? Y or N ");
  String? hasPepperoni = stdin.readLineSync();

  stdout.write("Do you want extra cheese? Y or N ");
  String? hasExtraCheese = stdin.readLineSync();

  int totalBill = 0;

  if (pizzaSize == "S") {
    totalBill += 15;
    if (hasPepperoni == "Y") {
      totalBill += 2;
    }
  } else if (pizzaSize == "M") {
    totalBill += 20;
    if (hasPepperoni == "Y") {
      totalBill += 3;
    }
  } else if (pizzaSize == "L") {
    totalBill += 25;
    if (hasPepperoni == "Y") {
      totalBill += 3;
    }
  }

  if ((pizzaSize == "S" || pizzaSize == "M" || pizzaSize == "L") &&
      hasExtraCheese == "Y") {
    totalBill += 1;
  }
  print("Your final bill is: \$$totalBill");
}
