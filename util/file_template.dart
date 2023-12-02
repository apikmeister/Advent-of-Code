import 'dart:io';

// dart util util/file_template.dart (day in int) (title in string)
// dart util util/file_template.dart 1 "Trebuchet?!"

var year = DateTime.now().year.toString();

void main(List<String> args) {
  if (args.length != 2) {
    print('Please call with: <dayNumber> <dayTitle>');
    return;
  }

  final [dayNumber, dayTitle] = args;
  final paddedDayNumber = dayNumber.padLeft(2, '0');

  // Create lib file
  final dayFileName = '$year/day$paddedDayNumber.dart';

  File('lib/$dayFileName').writeAsString(
    '''
// --- Day $dayNumber: $dayTitle ---
// https://adventofcode.com/$year/day/$dayNumber

int partOne(Iterable<String> input) {
  return 0;
}

int partTwo(Iterable<String> input) {
  return 0;
}
''',
  );

  // Create empty test data file
  final dataPath = 'test/data/$year/day$paddedDayNumber.txt';
  File(dataPath).create();

  // Create unit tests
  File(
    'test/day${paddedDayNumber}_test.dart',
  ).writeAsString(
    '''
// --- Day $dayNumber: $dayTitle ---
// https://adventofcode.com/$year/day/$dayNumber

import 'dart:io';
import 'package:advent_of_code/$dayFileName';
import 'package:advent_of_code/util.dart';
import 'package:test/test.dart';

final input = File('$dataPath').readAsLinesSync();

void main() {
  group('Part One', () {
    test('Example', () {
      expect(
          partOne(
            '''
    '''
                .asLines),
          equals(-1));
    });
    test('Solution', () {
      expect(partOne(input), equals(-1));
    });
  });
  group('Part Two', () {
    test('Example', () {
      expect(
          partTwo(
            '''
    '''
                .asLines),
          equals(-1));
    });
    test('Solution', () {
      expect(partTwo(input), equals(-1));
    });
  });
}
''',
  );
}
