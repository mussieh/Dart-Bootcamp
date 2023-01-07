import 'dart:io';
import 'art.dart';

double add(number1, number2) {
  return number1 + number2;
}

double subtract(number1, number2) {
  return number1 - number2;
}

double multiply(number1, number2) {
  return number1 * number2;
}

double divide(number1, number2) {
  return number1 / number2;
}

void calculator() {
  print(logo);
  Map<String, Function> operations = {
    "+": add,
    "-": subtract,
    "*": multiply,
    "/": divide
  };
  stdout.write("What's the first number?: ");

  // Assigns zero to firstNumber if the input can't be parsed
  // as a double (tryParse will return null)
  double firstNumber = double.tryParse(stdin.readLineSync() ?? "") ?? 0;

  for (final symbol in operations.keys) {
    print(symbol);
  }

  String? operationInput;
  double nextNumber;
  Function calculationFunction;
  var answer;
  String continueCalculatingInput;
  bool continueCalculating = true;

  while (continueCalculating) {
    stdout.write("Pick an operation: ");
    operationInput = stdin.readLineSync();

    stdout.write("What's the next number?: ");

    // Assigns zero to nextNumber if the input can't be parsed
    // as a double (tryParse will return null)
    nextNumber = double.tryParse(stdin.readLineSync() ?? "") ?? 0;

    if (operations[operationInput] == null) {
      break;
    }

    calculationFunction = operations[operationInput]!;
    answer = calculationFunction(firstNumber, nextNumber);
    print("$firstNumber $operationInput $nextNumber = $answer");
    stdout.write(
        "Type 'y' to continue calculating with $answer, or type 'n' to start " +
            "a new calculation: ");
    continueCalculatingInput = stdin.readLineSync() ?? "";
    if (continueCalculatingInput == "y") {
      firstNumber = answer;
    } else {
      continueCalculating = false;
      calculator();
    }
  }
}

// A calculator program.
void main() {
  calculator();
}
