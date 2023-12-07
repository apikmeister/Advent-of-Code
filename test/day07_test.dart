// --- Day 7: Camel Cards ---
// https://adventofcode.com/2023/day/7

import 'dart:io';
import 'package:advent_of_code/2023/day07.dart';
import 'package:advent_of_code/util.dart';
import 'package:test/test.dart';

final input = File('test/data/2023/day07.txt').readAsLinesSync();

void main() {
  group('Part One', () {
    test('Example', () {
      expect(
          partOne('''
32T3K 765
T55J5 684
KK677 28
KTJJT 220
QQQJA 483
'''
              .asLines),
          equals(6440));
    });
    test('Solution', () {
      expect(partOne(input), equals(248453531));
    });
  });
  group('Part Two', () {
    test('Example', () {
      expect(
          partTwo('''
32T3K 765
T55J5 684
KK677 28
KTJJT 220
QQQJA 483
'''
              .asLines),
          equals(5905));
    });
    test('Solution', () {
      expect(partTwo(input), equals(248781813));
    });
  });
}
