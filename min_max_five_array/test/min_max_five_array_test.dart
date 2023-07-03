import 'package:min_max_five_array/min_max_five_array.dart';
import 'package:test/test.dart';

void main() {
  test('Must return 16 24', () {
    expect(miniMaxSum([1, 3, 5, 7, 9]), "16 24");
  });

  test('Must return 10 14', () {
    expect(miniMaxSum([1, 2, 3, 4, 5]), "10 14");
  });
}
