import 'package:have_the_same_letters/compare_words.dart';
import 'package:test/test.dart';

void main() {
  test('Words is equals', () {
    expect(compareWords(["abc", "abc"]), true);
  });
}
