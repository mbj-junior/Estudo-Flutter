import 'package:test/test.dart';

import '../bin/compare_arrays.dart';

void main() {
  test('Must return true to equal list sorted', () {
    expect(compareListInt([1, 2, 3], [1, 2, 3]), true);
  });

  test('Must return true to equal list dont sort', () {
    expect(compareListInt([1, 2, 3], [3, 2, 1]), true);
  });

  test('Must return false to same length', () {
    expect(compareListInt([1, 2, 2], [1, 2, 3]), false);
  });

  test('Must return false to diferent length to first list', () {
    expect(compareListInt([1, 2, 3, 4], [3, 2, 1]), false);
  });

  test('Must return false to diferent length to second list', () {
    expect(compareListInt([1, 2, 3], [3, 2, 1, 4]), false);
  });
}
