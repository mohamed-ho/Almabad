import 'dart:math';
import 'dart:ui';

Color getRandomDarkColor() {
  final Random random = Random();

  int red = random.nextInt(128); // Limit red value to 0-127
  int green = random.nextInt(128); // Limit green value to 0-127
  int blue = random.nextInt(128); // Limit blue value to 0-127

  return Color.fromARGB(255, red, green, blue);
}
