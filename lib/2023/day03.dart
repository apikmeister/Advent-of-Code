// --- Day 3: Gear Ratios ---
// https://adventofcode.com/2023/day/3

int partOne(Iterable<String> input) {
  var inputList = input.toList();
  var schematic = 0;

  var m = inputList.length;
  var n = inputList[0].length;

  for (var i = 0; i < m; i++) {
    var j = 0;
    while (j < n) {
      var ctr = 1;
      while (j < n - 1 &&
          isNumeric(inputList[i][j]) == isNumeric(inputList[i][j + 1])) {
        ctr++;
        j++;
      }
      if (isNumeric(inputList[i][j])) {
        var num = int.parse(inputList[i].substring(j - ctr + 1, j + 1));
        var valid = false;
        for (var x = i - 1; x <= i + 1; x++) {
          for (var y = j - ctr; y <= j + 1; y++) {
            if (x >= 0 &&
                x < m &&
                y >= 0 &&
                y < n &&
                inputList[x][y] != '.' &&
                !isNumeric(inputList[x][y])) {
              valid = true;
            }
          }
        }
        if (valid) {
          schematic += num;
        }
      }
      j++;
    }
  }

  return schematic;
}

int partTwo(Iterable<String> input) {
  var inputList = input.toList();

  var m = inputList.length;
  var n = inputList[0].length;

  var counts = List.generate(m, (_) => List.filled(n, 0));
  var prods = List.generate(m, (_) => List.filled(n, 1));

  for (var i = 0; i < m; i++) {
    var j = 0;
    while (j < n) {
      var ctr = 1;
      while (j < n - 1 &&
          isNumeric(inputList[i][j]) == isNumeric(inputList[i][j + 1])) {
        ctr++;
        j++;
      }
      if (isNumeric(inputList[i][j])) {
        var num = int.parse(inputList[i].substring(j - ctr + 1, j + 1));
        for (var x = i - 1; x <= i + 1; x++) {
          for (var y = j - ctr; y <= j + 1; y++) {
            if (x >= 0 &&
                x < m &&
                y >= 0 &&
                y < n &&
                inputList[x][y] != '.' &&
                !isNumeric(inputList[x][y])) {}
            if (x >= 0 && x < m && y >= 0 && y < n && inputList[x][y] == '*') {
              counts[x][y]++;
              prods[x][y] *= num;
              break;
            }
          }
        }
      }
      j++;
    }
  }

  var ratio = 0;

  for (var i = 0; i < m; i++) {
    for (var j = 0; j < n; j++) {
      if (counts[i][j] == 2) {
        ratio += prods[i][j];
      }
    }
  }

  return ratio;
}

bool isNumeric(String s) {
  return double.tryParse(s) != null;
}
