import 'package:cli/is_bigger_target.dart';
import 'package:test/test.dart';

void main() {
  group('sucess teste - ', () {
    test('Must return true if sum is 42', () {
      expect(isBiggerTarget(userInput: "40 2"), true);
    });

    test('Must return false if sum is`t 42', () {
      expect(isBiggerTarget(userInput: "1 2"), false);
    });

    test('Must return false if sum is`t bigger 42', () {
      expect(isBiggerTarget(userInput: "40 20 40"), false);
    });

    test('Must return true if sum is new limit 60', () {
      expect(isBiggerTarget(userInput: "40 20", inputTarget: 60), true);
    });

    test('Must return false if sum is`t new limit 60', () {
      expect(isBiggerTarget(userInput: "4 20", inputTarget: 60), false);
    });
  });
}
