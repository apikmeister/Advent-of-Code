// --- Day 1: Trebuchet?! ---
// https://adventofcode.com/2023/day/1

int partOne(Iterable<String> input) {
  var sum = 0;
  var regex = RegExp(r'\d');

  for (var line in input) {
    var matches = regex.allMatches(line).map((m) => m.group(0)!).toList();

    if (matches.isNotEmpty) {
      sum += int.parse(matches.first + matches.last);
    }
  }

  return sum;
}

String evalNumber(String input) {
  if (input.isEmpty) {
    return '0';
  }

  if (isNumeric(input[0])) {
    return input[0];
  }

  const numberStrings = [
    'zero',
    'one',
    'two',
    'three',
    'four',
    'five',
    'six',
    'seven',
    'eight',
    'nine'
  ];
  for (var i = 0; i < numberStrings.length; i++) {
    if (input.startsWith(numberStrings[i])) {
      return i.toString();
    }
  }

  return '0';
}

int partTwo(Iterable<String> input) {
  var sum = 0;

  for (var line in input) {
    var numbers = <String>[];
    var i = 0;
    while (i < line.length) {
      var number = evalNumber(line.trim().substring(i));
      if (number != '0') {
        numbers.add(number);
      }
      i += 1;
    }

    if (numbers.isEmpty) {
      print('Invalid line: $line');
    } else {
      sum += int.parse(numbers.first + numbers.last);
    }
  }

  return sum;
}

bool isNumeric(String s) {
  return '0123456789'.contains(s);
}
