import 'dart:io';

void main() {
  print("Welcome to the Band Name Generator.");
  print("What's the name of the city you grew up in?");
  String? cityName = stdin.readLineSync();

  print("What's your pet's name?");
  String? petName = stdin.readLineSync();

  print("Your band name could be $cityName $petName");
}
