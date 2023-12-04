// --- Day 4: Scratchcards ---
// https://adventofcode.com/2023/day/4

int partOne(Iterable<String> input) {
  var inputList = input.toList();
  var totalPoints = 0;

  for (var i = 0; i < inputList.length; i++) {
    var newLine = inputList[i].split("|");
    var winningNumbers = newLine[0]
        .split(':')[1]
        .split(" ")
        .where((e) => e.isNotEmpty && isNumeric(e))
        .map(int.parse);
    var numbersYouHave = newLine[1]
        .split(" ")
        .where((e) => e.isNotEmpty && isNumeric(e))
        .map(int.parse);

    var matches = 0;

    var points = 1;

    for (var number in numbersYouHave) {
      if (winningNumbers.contains(number)) {
        matches++;
      }
    }

    if (matches == 0) {
      points = 0;
    } else {
      for (var i = 1; i < matches; i++) {
        points *= 2;
      }
    }

    totalPoints += points;
  }

  return totalPoints;
}

int partTwo(Iterable<String> input) {
  var inputList = input.toList();
  var cards = List<List<int>>.generate(inputList.length, (_) => []);
  var totalCards = List<int>.filled(inputList.length, 1);

  for (var i = 0; i < inputList.length; i++) {
    var newLine = inputList[i].split("|");
    var winningNumbers = newLine[0]
        .split(':')[1]
        .split(" ")
        .where((e) => e.isNotEmpty && isNumeric(e))
        .map(int.parse);
    var numbersYouHave = newLine[1]
        .split(" ")
        .where((e) => e.isNotEmpty && isNumeric(e))
        .map(int.parse);

    var matches = 0;

    for (var number in numbersYouHave) {
      if (winningNumbers.contains(number)) {
        matches++;
      }
    }

    if (matches > 0) {
      for (var j = i + 1; j < inputList.length && matches > 0; j++) {
        cards[j].add(i);
        totalCards[j] += totalCards[i];
        matches--;
      }
    }
  }

  var totalScratchcards = totalCards.reduce((a, b) => a + b);
  return totalScratchcards;
}

bool isNumeric(String s) {
  return int.tryParse(s) != null;
}
