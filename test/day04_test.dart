// --- Day 4: Scratchcards ---
// https://adventofcode.com/2023/day/4

import 'dart:io';
import 'package:advent_of_code/2023/day04.dart';
import 'package:advent_of_code/util.dart';
import 'package:test/test.dart';

final input = File('test/data/2023/day04.txt').readAsLinesSync();

void main() {
  group('Part One', () {
    test('Example', () {
      expect(
          partOne('''
Card 1: 41 48 83 86 17 | 83 86  6 31 17  9 48 53
Card 2: 13 32 20 16 61 | 61 30 68 82 17 32 24 19
Card 3:  1 21 53 59 44 | 69 82 63 72 16 21 14  1
Card 4: 41 92 73 84 69 | 59 84 76 51 58  5 54 83
Card 5: 87 83 26 28 32 | 88 30 70 12 93 22 82 36
Card 6: 31 18 13 56 72 | 74 77 10 23 35 67 36 11
'''
              .asLines),
          equals(13));
    });
    test('Solution', () {
      expect(partOne(input), equals(20407));
    });
  });
  group('Part Two', () {
    test('Example', () {
      expect(
          partTwo('''
Card 1: 41 48 83 86 17 | 83 86  6 31 17  9 48 53
Card 2: 13 32 20 16 61 | 61 30 68 82 17 32 24 19
Card 3:  1 21 53 59 44 | 69 82 63 72 16 21 14  1
Card 4: 41 92 73 84 69 | 59 84 76 51 58  5 54 83
Card 5: 87 83 26 28 32 | 88 30 70 12 93 22 82 36
Card 6: 31 18 13 56 72 | 74 77 10 23 35 67 36 11
'''
              .asLines),
          equals(30));
    });
    test('Solution', () {
      expect(partTwo(input), equals(23806951));
    });
  });
}
