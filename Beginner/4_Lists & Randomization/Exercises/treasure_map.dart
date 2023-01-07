import 'dart:io';

// A program for marking treasure on a map using a two-digit system.
void main() {
  List<String> row1 = ["⬜️", "️⬜️", "️⬜️"];
  List<String> row2 = ["⬜️", "️⬜️", "️⬜️"];
  List<String> row3 = ["⬜️", "️⬜️", "️⬜️"];

  List<List<String>> treasureMatrix = [row1, row2, row3];
  print("$row1\n$row2\n$row3");

  stdout.write("Where do you want to put the treasure? ");
  String? treasureSpot = stdin.readLineSync();

  if (treasureSpot != null &&
      treasureSpot != "" &&
      int.tryParse(treasureSpot[0]) != null &&
      int.tryParse(treasureSpot[1]) != null) {
    int treasureColumn = int.parse(treasureSpot[0]);
    int treasureRow = int.parse(treasureSpot[1]);

    // Order rearranged since computer representation has row and column
    // reversed while the subtraction by one is to account for list indexing
    // starting at 0.
    treasureMatrix[treasureRow - 1][treasureColumn - 1] = "X";
    print("$row1\n$row2\n$row3");
  }
}
