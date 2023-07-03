import 'package:min_max_five_array/min_max_five_array.dart';
import 'package:test/test.dart';

void main() {
  test('Must return 16 24', () {
    expect(miniMaxSum([1, 3, 5, 7, 9]), "16 24");
  });

  test('Must return 10 14', () {
    expect(miniMaxSum([1, 2, 3, 4, 5]), "10 14");
  });

  test('Must return 2063136757 2744467344', () {
    expect(miniMaxSum([256741038, 623958417, 467905213, 714532089, 938071625]),
        "2063136757 2744467344");
  });
  test('Must return 2572095760 2999145560', () {
    expect(miniMaxSum([793810624, 895642170, 685903712, 623789054, 468592370]),
        "2572095760 2999145560");
  });
}
