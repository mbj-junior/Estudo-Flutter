import 'package:have_the_same_letters/word_sort.dart';
import 'package:test/test.dart';

void main() {
  test('hash code abc must be equal abc', () {
    expect(wordSort("abc"), "abc".hashCode);
  });

  test('hash code cba must be equal abc', () {
    expect(wordSort("cba"), "abc".hashCode);
  });

  test('hash code ABC must be equal abc', () {
    expect(wordSort("ABC"), "abc".hashCode);
  });

  test('hash code Abc must be equal abc', () {
    expect(wordSort("Abc"), "abc".hashCode);
  });
}
