// --- Day 1: Trebuchet?! ---
// https://adventofcode.com/2023/day/1

import 'dart:io';
import 'package:advent_of_code/2023/day01.dart';
import 'package:advent_of_code/util.dart';
import 'package:test/test.dart';

final input = File('test/data/2023/day01.txt').readAsLinesSync();

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(
          partOne('''
1abc2
pqr3stu8vwx
a1b2c3d4e5f
treb7uchet
'''
              .asLines),
          equals(142));
    });
    test('Solution', () {
      expect(partOne(input), equals(55834));
    });
  });
  group('Part Two', () {
    test('Example 1', () {
      expect(
          partTwo('''
two1nine
eightwothree
abcone2threexyz
xtwone3four
4nineeightseven2
zoneight234
7pqrstsixteen
'''
              .asLines),
          equals(281));
    });
    test('Solution', () {
      expect(partTwo(input), equals(53221));
    });
  });
}
