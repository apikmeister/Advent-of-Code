// --- Day 1: Test ---
// https://adventofcode.com/2023/day/1

import 'dart:io';
import 'package:advent_of_code/2023/day01.dart';
import 'package:test/test.dart';

final input = File('test/data/2023/day01.txt').readAsLinesSync();

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(
          partOne(const [
            '<someLine>',
          ]),
          equals(-1));
    });
    test('Solution', () {
      expect(partOne(input), equals(-1));
    });
  });
}
