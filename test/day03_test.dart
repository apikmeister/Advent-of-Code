// --- Day 3: Gear Ratios ---
// https://adventofcode.com/2023/day/3

import 'dart:io';
import 'package:advent_of_code/2023/day03.dart';
import 'package:advent_of_code/util.dart';
import 'package:test/test.dart';

final input = File('test/data/2023/day03.txt').readAsLinesSync();

void main() {
  group('Part One', () {
    test('Example', () {
      expect(
          partOne('''
467..114..
...*......
..35..633.
......#...
617*......
.....+.58.
..592.....
......755.
...\$.*....
.664.598..
'''
              .asLines),
          equals(4361));
    });
    test('Solution', () {
      expect(partOne(input), equals(527446));
    });
  });
  group('Part Two', () {
    test('Example', () {
      expect(
          partTwo('''
467..114..
...*......
..35..633.
......#...
617*......
.....+.58.
..592.....
......755.
...\$.*....
.664.598..
'''
              .asLines),
          equals(467835));
    });
    test('Solution', () {
      expect(partTwo(input), equals(73201705));
    });
  });
}
