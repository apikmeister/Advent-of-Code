// --- Day 2: Cube Conundrum ---
// https://adventofcode.com/2023/day/2

import 'dart:io';
import 'dart:math';

final input = File('test/data/2023/day02.txt').readAsLinesSync();

int partOne(Iterable<String> input) {
  var fulfilledGameNums = <int>[];

  for (var line in input) {
    var redLimit = 12;
    var greenLimit = 13;
    var blueLimit = 14;

    var game = line.split(':');
    var gameNum = int.parse(game[0].split(' ').last);
    var sets = game[1].split(';');

    var allColorsBelowLimit = true;

    for (var set in sets) {
      var colors = set.split(',').map((e) => e.trim()).toList();
      var blue = 0;
      var red = 0;
      var green = 0;
      for (var color in colors) {
        var parts = color.split(' ');
        if (parts[1] == 'blue') {
          blue += int.parse(parts[0]);
        } else if (parts[1] == 'red') {
          red += int.parse(parts[0]);
        } else if (parts[1] == 'green') {
          green += int.parse(parts[0]);
        }
      }
      if (blue <= blueLimit && red <= redLimit && green <= greenLimit) {
        continue;
      } else {
        allColorsBelowLimit = false;
        break;
      }
    }
    if (allColorsBelowLimit) {
      fulfilledGameNums.add(gameNum);
    }
  }

  return fulfilledGameNums.reduce((a, b) => a + b);
}

int partTwo(Iterable<String> input) {
  var power = 0;

  for (var line in input) {
    var game = line.split(':');
    var sets = game[1].split(';');
    var maxBlue = 0;
    var maxRed = 0;
    var maxGreen = 0;
    for (var set in sets) {
      var colors = set.split(',').map((e) => e.trim()).toList();
      var blue = 0;
      var red = 0;
      var green = 0;
      for (var color in colors) {
        var parts = color.split(' ');
        if (parts[1] == 'blue') {
          blue += int.parse(parts[0]);
        } else if (parts[1] == 'red') {
          red += int.parse(parts[0]);
        } else if (parts[1] == 'green') {
          green += int.parse(parts[0]);
        }
      }
      maxBlue = max(blue, maxBlue);
      maxRed = max(red, maxRed);
      maxGreen = max(green, maxGreen);
    }
    power += maxBlue * maxRed * maxGreen;
  }
  return power;
}

void main() {
  print(partTwo(input));
}
