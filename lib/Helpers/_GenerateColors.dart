import 'dart:math';
import 'package:flutter/material.dart';

HSLColor getRandomCoolLightHSLColor() {
  final Random random = Random();

  // Define cool tone hue ranges
  final List<Range> coolRanges = [
    const Range(90, 150), // Green-blue
    const Range(180, 270), // Blue
    const Range(270, 310), // Purple/Violet
  ];

  // Pick a random range, then pick a random hue within that range
  final Range selectedRange = coolRanges[random.nextInt(coolRanges.length)];
  final double hue =
      selectedRange.start +
      random.nextDouble() * (selectedRange.end - selectedRange.start);

  // Keep saturation and lightness in light/soft range
  final double saturation =
      0.4 + random.nextDouble() * 0.4; // Soft to moderate saturation
  final double lightness = 0.7 + random.nextDouble() * 0.2; // Light tones

  return HSLColor.fromAHSL(1.0, hue, saturation, lightness);
}

class Range {
  final double start;
  final double end;

  const Range(this.start, this.end);
}
