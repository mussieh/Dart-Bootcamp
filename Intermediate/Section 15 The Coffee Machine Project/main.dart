import 'dart:io';

import 'coffee_machine_data.dart';

const espressoKeyword = "espresso";
const latteKeyword = "latte";
const cappuccinoKeyword = "cappuccino";

const ingredientsKeyword = "ingredients";
const waterKeyword = "water";
const milkKeyword = "milk";
const coffeeKeyword = "coffee";
const costKeyword = "cost";

const reportCommand = "report";

int waterResourceAmount = resources[waterKeyword] as int;
int milkResourceAmount = resources[milkKeyword] as int;
int coffeeResourceAmount = resources[coffeeKeyword] as int;
double moneyStored = 0;

const pennyAmount = 0.01;
const nickelAmount = 0.05;
const dimeAmount = 0.10;
const quarterAmount = 0.25;

// Returns the amount of a specific ingredient needed for making a drink.
int getAmount(String? drinkType, String ingredientType) {
  var drink;
  var drinkIngredients;
  int drinkAmount = 0;
  if (drinkType == espressoKeyword) {
    drink = menu[drinkType];
    drinkIngredients = drink?[ingredientsKeyword] as Map<String, int>;
    if (ingredientType != milkKeyword) {
      drinkAmount = drinkIngredients[ingredientType];
    }
  } else if (drinkType == latteKeyword || drinkType == cappuccinoKeyword) {
    drink = menu[drinkType];
    drinkIngredients = drink?[ingredientsKeyword] as Map<String, int>;
    drinkAmount = drinkIngredients[ingredientType];
  }
  return drinkAmount;
}

// Prints the current resource status for making a drink
void printResourceStatus(String? drinkType) {
  if (waterResourceAmount - getAmount(drinkType, waterKeyword) < 0) {
    print(" Sorry there is not enough water.");
  } else if (milkResourceAmount - getAmount(drinkType, milkKeyword) < 0) {
    print(" Sorry there is not enough milk.");
  } else if (coffeeResourceAmount - getAmount(drinkType, coffeeKeyword) < 0) {
    print(" Sorry there is not enough coffee.");
  }
}

// Prints the resource and money stored amount to screen.
printResourceReport() {
  print("Water: ${waterResourceAmount}ml");
  print("Milk: ${milkResourceAmount}ml");
  print("Coffee: ${coffeeResourceAmount}g");
  print("Money: \$$moneyStored");
}

// Adjusts resources when a successful coffee drink purchase occurs.
void adjustResources(String? drinkType) {
  if (drinkType == espressoKeyword) {
    waterResourceAmount -= getAmount(drinkType, waterKeyword);
    coffeeResourceAmount -= getAmount(drinkType, coffeeKeyword);
  } else if (drinkType == latteKeyword || drinkType == cappuccinoKeyword) {
    waterResourceAmount -= getAmount(drinkType, waterKeyword);
    milkResourceAmount -= getAmount(drinkType, milkKeyword);
    coffeeResourceAmount -= getAmount(drinkType, coffeeKeyword);
  }
}

// Checks if enough resources are available (water, milk, coffee) for making
// a drink.
bool enoughResourcesAvailable(String? drinkType) {
  printResourceStatus(drinkType);
  if (drinkType == espressoKeyword) {
    return waterResourceAmount - getAmount(drinkType, waterKeyword) >= 0 &&
        coffeeResourceAmount - getAmount(drinkType, coffeeKeyword) >= 0;
  } else if (drinkType == latteKeyword || drinkType == cappuccinoKeyword) {
    return waterResourceAmount - getAmount(drinkType, waterKeyword) >= 0 &&
        milkResourceAmount - getAmount(drinkType, milkKeyword) >= 0 &&
        coffeeResourceAmount - getAmount(drinkType, coffeeKeyword) >= 0;
  }
  return false;
}

// Gets the cost of a drink.
double getCost(String? drinkType) {
  double drinkCost = 0;
  if (drinkType == espressoKeyword ||
      drinkType == latteKeyword ||
      drinkType == cappuccinoKeyword) {
    drinkCost = menu[drinkType]?[costKeyword] as double;
  }
  return drinkCost;
}

// Calculates the change for a transaction.
double calculateChange(String? drinkType, double moneyProvided) {
  double change = 0;
  if (drinkType == espressoKeyword ||
      drinkType == latteKeyword ||
      drinkType == cappuccinoKeyword) {
    change = double.tryParse(
            (moneyProvided - getCost(drinkType)).toStringAsFixed(2)) ??
        0;
  }
  return change;
}

// Checks if the user put enough coins in for a drink.
bool enoughMoneyInserted(String? drinkType, double moneyProvided) {
  if (drinkType == espressoKeyword ||
      drinkType == latteKeyword ||
      drinkType == cappuccinoKeyword) {
    return moneyProvided - getCost(drinkType) >= 0;
  }
  return false;
}

// Checks if the coffee machine should stay on or not.
bool coffeeMachineOn(String? drinkTypeInput) {
  if (drinkTypeInput == espressoKeyword ||
      drinkTypeInput == latteKeyword ||
      drinkTypeInput == cappuccinoKeyword ||
      drinkTypeInput == reportCommand) {
    return true;
  }
  return false;
}

// Initiates the coffee machine.
void coffeeMachine() {
  String drinkTypeInput;
  double change = 0;
  int numOfQuarters = 0;
  int numOfDimes = 0;
  int numOfNickels = 0;
  int numOfPennies = 0;

  do {
    stdout.write(" What would you like? (espresso/latte/cappuccino): ");
    drinkTypeInput = stdin.readLineSync().toString().trim().toLowerCase();

    if (drinkTypeInput == reportCommand) {
      printResourceReport();
    }

    if (enoughResourcesAvailable(drinkTypeInput)) {
      print("Please insert coins.");
      stdout.write("how many quarters?: ");
      numOfQuarters = int.tryParse(stdin.readLineSync() ?? "") ?? 0;
      stdout.write("how many dimes?: ");
      numOfDimes = int.tryParse(stdin.readLineSync() ?? "") ?? 0;
      stdout.write("how many nickels?: ");
      numOfNickels = int.tryParse(stdin.readLineSync() ?? "") ?? 0;
      stdout.write("how many pennies?: ");
      numOfPennies = int.tryParse(stdin.readLineSync() ?? "") ?? 0;

      double moneyProvided = numOfQuarters * quarterAmount +
          numOfDimes * dimeAmount +
          numOfNickels * nickelAmount +
          numOfPennies * pennyAmount;
      if (enoughMoneyInserted(drinkTypeInput, moneyProvided)) {
        adjustResources(drinkTypeInput);
        change = calculateChange(drinkTypeInput, moneyProvided);
        moneyStored +=
            double.tryParse((moneyProvided - change).toStringAsFixed(2)) ?? 0;
        print("Here is \$$change in change.");
        print("Here is your $drinkTypeInput ☕️. Enjoy!");
      } else {
        print("Sorry that's not enough money. Money refunded.");
      }
    }
  } while (coffeeMachineOn(drinkTypeInput));
}

// A program for a coffee machine.
void main() {
  coffeeMachine();
}
