// --- Day 7: Camel Cards ---
// https://adventofcode.com/2023/day/7

List<String> cardOrder = [
  'A',
  'K',
  'Q',
  'J',
  'T',
  '9',
  '8',
  '7',
  '6',
  '5',
  '4',
  '3',
  '2'
];

List<String> fiveCardOrder = [
  'Five of a kind',
  'Four of a kind',
  'Full house',
  'Three of a kind',
  'Two pair',
  'One pair',
  'High card',
];

int partOne(Iterable<String> input) {
  var inputList = input.toList();
  List<List<Object>> handsBidsTypes = [];

  for (var i = 0; i < inputList.length; i++) {
    handsBidsTypes.add(
        [inputList[i].split(' ')[0], int.parse(inputList[i].split(' ')[1])]);
  }

  for (var i = 0; i < handsBidsTypes.length; i++) {
    var cardsHandsBidsTypes = handsBidsTypes[i][0].toString().split('');
    var counts = Map.fromIterable(cardsHandsBidsTypes,
        value: (e) => cardsHandsBidsTypes.where((c) => c == e).length);
    Map<int, Function> handTypes = {
      1: () => 'Five of a kind',
      2: () => counts.values.any((count) => count == 4)
          ? 'Four of a kind'
          : 'Full house',
      3: () => counts.values.any((count) => count == 3)
          ? 'Three of a kind'
          : 'Two pair',
      4: () => 'One pair',
      5: () => 'High card'
    };

    handsBidsTypes[i].add(handTypes[counts.length]!().toString());
  }

  for (var i = 0; i < 5; i++) {
    handsBidsTypes.sort((a, b) {
      var typeComparison = fiveCardOrder.indexOf(a[2].toString()) -
          fiveCardOrder.indexOf(b[2].toString());
      if (typeComparison != 0) {
        return typeComparison;
      }
      for (var i = 0; i < 5; i++) {
        var cardOrderComparison =
            cardOrder.indexOf(a[0].toString().split('')[i]) -
                cardOrder.indexOf(b[0].toString().split('')[i]);
        if (cardOrderComparison != 0) {
          return cardOrderComparison;
        }
      }

      return 0;
    });
  }

  var totalWinnings = 0;
  var reversedhandsBidsTypes = handsBidsTypes.reversed.toList();
  for (var i = 0; i < handsBidsTypes.length; i++) {
    totalWinnings +=
        (int.parse(reversedhandsBidsTypes[i][1].toString()) * (i + 1));
  }

  return totalWinnings;
}
// 252094342 wrong

List<String> partTwoCardOrder = [
  'A',
  'K',
  'Q',
  'T',
  '9',
  '8',
  '7',
  '6',
  '5',
  '4',
  '3',
  '2',
  'J',
];

// what is this spaghetti bro
// if its works, its works
int partTwo(Iterable<String> input) {
  var inputList = input.toList();
  List<List<Object>> handsBidsTypes = [];

  for (var i = 0; i < inputList.length; i++) {
    handsBidsTypes.add(
        [inputList[i].split(' ')[0], int.parse(inputList[i].split(' ')[1])]);
  }

  for (var i = 0; i < handsBidsTypes.length; i++) {
    var cardsHandsBidsTypes = handsBidsTypes[i][0].toString().split('');
    var counts = Map.fromIterable(cardsHandsBidsTypes,
        value: (e) => cardsHandsBidsTypes.where((c) => c == e).length);
    if (counts.containsKey('J')) {
      var jValue = counts['J']; // Get the value of 'J' key
      // Handle all J key
      if (jValue != 5) {
        counts.remove('J');
        var maxKey =
            counts.keys.reduce((a, b) => counts[a]! > counts[b]! ? a : b);
        counts.update(maxKey, (value) => value + int.parse(jValue.toString()));
      } // Remove the 'J' key
    }

    Map<int, Function> handTypes = {
      1: () => 'Five of a kind',
      2: () => counts.values.any((count) => count == 4)
          ? 'Four of a kind'
          : 'Full house',
      3: () => counts.values.any((count) => count == 3)
          ? 'Three of a kind'
          : 'Two pair',
      4: () => 'One pair',
      5: () => 'High card'
    };

    handsBidsTypes[i].add(handTypes[counts.length]!().toString());
  }

  for (var i = 0; i < 5; i++) {
    handsBidsTypes.sort((a, b) {
      var typeComparison = fiveCardOrder.indexOf(a[2].toString()) -
          fiveCardOrder.indexOf(b[2].toString());
      if (typeComparison != 0) {
        return typeComparison;
      }
      for (var i = 0; i < 5; i++) {
        var cardOrderComparison =
            partTwoCardOrder.indexOf(a[0].toString().split('')[i]) -
                partTwoCardOrder.indexOf(b[0].toString().split('')[i]);
        if (cardOrderComparison != 0) {
          return cardOrderComparison;
        }
      }

      return 0;
    });
  }

  var totalWinnings = 0;
  var reversedhandsBidsTypes = handsBidsTypes.reversed.toList();
  for (var i = 0; i < handsBidsTypes.length; i++) {
    totalWinnings +=
        (int.parse(reversedhandsBidsTypes[i][1].toString()) * (i + 1));
  }

  return totalWinnings;
}
