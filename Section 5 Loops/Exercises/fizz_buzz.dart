// A program that automatically prints the solution to the FizzBuzz game.
void main() {
  for (int number = 1; number <= 100; number++) {
    if (number % 3 == 0 && number % 5 != 0) {
      print("Fizz");
    } else if (number % 5 == 0 && number % 3 != 0) {
      print("Buzz");
    } else if (number % 3 == 0 && number % 5 == 0) {
      print("FizzBuzz");
    } else {
      print(number);
    }
  }
}
