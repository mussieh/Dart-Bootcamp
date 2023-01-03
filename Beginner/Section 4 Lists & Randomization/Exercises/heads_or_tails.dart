import 'dart:math';

// Virtual coin toss program that randomly tells the user "Heads" or "Tails".
void main() {
  Random().nextInt(2) == 1 ? print("Heads") : print("Tails");
}
