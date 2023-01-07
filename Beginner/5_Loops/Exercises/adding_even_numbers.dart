// A program that calculates the sum of all even numbers from 1 to 100.
void main() {
  int totalEvenNumberSum = 0;

  for (int i = 0; i <= 100; i += 2) {
    totalEvenNumberSum += i;
  }
  print(totalEvenNumberSum);
}
