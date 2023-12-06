// --- Day 6: Wait For It ---
// https://adventofcode.com/2023/day/6

import 'package:advent_of_code/2023/day04.dart';

int partOne(Iterable<String> input) {
  var inputList = input.toList();
  var raceTimes = inputList[0]
      .split(':')[1]
      .trim()
      .split(' ')
      .where((number) => isNumeric(number))
      .map((number) => int.parse(number))
      .toList();
  var recordDistances = inputList[1]
      .split(':')[1]
      .trim()
      .split(' ')
      .where((number) => isNumeric(number))
      .map((number) => int.parse(number))
      .toList();
  var waysToBeatRecord = [];

  for (int i = 0; i < raceTimes.length; i++) {
    int minHoldTime = 1;
    int maxHoldTime = raceTimes[i];
    int distance = 0;
    int bestTime = 0;
    for (int j = minHoldTime; j < maxHoldTime; j++) {
      distance = j * (maxHoldTime - j);
      if (distance > recordDistances[i]) {
        bestTime++;
      }
    }
    waysToBeatRecord.add(bestTime);
  }

  return waysToBeatRecord.reduce((value, element) => value * element);
}

int partTwo(Iterable<String> input) {
  var inputList = input.toList();
  var raceTimes =
      int.parse(inputList[0].split(':')[1].trim().replaceAll(' ', ''));
  var recordDistances =
      int.parse(inputList[1].split(':')[1].trim().replaceAll(' ', ''));

  for (int i = 0; i < raceTimes;) {
    int minHoldTime = 1;
    int maxHoldTime = raceTimes;
    int distance = 0;
    int bestTime = 0;
    for (int j = minHoldTime; j < maxHoldTime; j++) {
      distance = j * (maxHoldTime - j);
      if (distance > recordDistances) {
        bestTime++;
      }
    }
    return bestTime;
  }

  return 0;
}
