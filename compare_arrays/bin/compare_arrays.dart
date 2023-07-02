// Escrever uma função que receberia como parâmetro dois arrays
// de números inteiros desordenados e deveria retornar se ambos tinham os
// mesmos valores, independentemente da ordem.

import 'package:compare_arrays/compare_arrays.dart';

void main(List<String> arguments) {
  print(compareListInt([1, 2, 3, 4], [3, 2, 1, 4, 6]));
}
