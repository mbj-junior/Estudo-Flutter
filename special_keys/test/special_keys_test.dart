import 'package:special_keys/special_keys.dart';
import 'package:test/test.dart';

void main() {
  test('Must return Relax', () {
    expect(soluction("CrCellBax"), "Relax");
  });

  test('Must return GoodLuck', () {
    expect(soluction("CgCoodlBClCuck"), "GoodLuck");
  });

    test('Must return AB', () {
    expect(soluction("aCaBBCCab"), "AB");
  });

    test('Must return ""', () {
    expect(soluction("aBB"), "");
  });
}
