// --- Day 6: Wait For It ---
// https://adventofcode.com/2023/day/6

import 'dart:io';
import 'package:advent_of_code/2023/day06.dart';
import 'package:advent_of_code/util.dart';
import 'package:test/test.dart';

final input = File('test/data/2023/day06.txt').readAsLinesSync();

void main() {
  group('Part One', () {
    test('Example', () {
      expect(
          partOne('''
Time:      7  15   30
Distance:  9  40  200
    '''
              .asLines),
          equals(288));
    });
    test('Solution', () {
      expect(partOne(input), equals(6209190));
    });
  });
  group('Part Two', () {
    test('Example', () {
      expect(
          partTwo('''
Time:      7  15   30
Distance:  9  40  200
    '''
              .asLines),
          equals(71503));
    });
    test('Solution', () {
      expect(partTwo(input), equals(28545089));
    });
  });
}
