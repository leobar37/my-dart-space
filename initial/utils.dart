Iterable<E> mapIndexed<E, T>(
    Iterable<T> items, E Function(int idx, T item) fn) sync* {
  var idx = 0;
  for (final item in items) {
    yield fn(idx, item);
    idx = idx + 1;
  }
}
