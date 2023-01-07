import 'dart:io';
import 'dart:math';

// A program that selects a random name from a list of names with one name
// chosen randomly to pay for everybody's food bill.
void main() {
  stdout.write("Give me everybody's names, separated by a comma. ");
  String? names = stdin.readLineSync();
  if (names != "" && names != null) {
    List<String> namesList = names.trim().split(", ");
    String payerName = namesList[Random().nextInt(namesList.length)];
    print("$payerName is going to buy the meal today!");
  }
}
