const numbers = [1, 3, 56, 66, 68, 80, 99, 105, 450];

bool naiveContains(int value, List<num> list) {
  for (final element in list) {
    if (element == value) {
      return true;
    }
  }
  return false;
}

// if you were checking the number 451 existed in the list
// the naive algorithm would have to interate
// from beginning to end of the list
// since the list is sorted, drop half the comparissions necessary
// by checking the middle element

bool betterNaiveConstraints(int value, List<int> list) {
  if (list.isEmpty) {
    return false;
  }
  //  add "~" to result in a integer

  int middleIndex = list.length ~/ 2;

  if (value > list[middleIndex]) {
    for (num i = middleIndex; i < list.length; i++) {
      final currentElement = list[i as int];
      if (currentElement == value) {
        return true;
      }
    }
  } else {
    for (num i = middleIndex; i >= 0; i--) {
      final currentElement = list[i as int];
      if (currentElement == value) {
        return true;
      }
    }
  }
  return false;
}
