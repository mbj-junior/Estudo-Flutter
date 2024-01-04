// Vetor de tamanho N, valoes únicos no intervalo de [1...N+1]
// Exemplo: vetor de tamanho 4 os valores possíveis são [1, 2, 3, 4, 5]
// [2, 4, 1, 5] -> 3
// [1, 2, 3, 4] -> 5

void main(List<String> arguments) {
  List<int> example1 = [2, 4, 1, 5];
  List<int> example2 = [1, 2, 3, 4];

  final stopwatch = Stopwatch()..start();
  print(completeArray(example1));
  print(completeArray(example2));
  stopwatch.stop();
  print(stopwatch.elapsedTicks);
}

int completeArray(List<int> listIn) {
  int count = 0; // 12
  int acumulador = 0; // 15

  for (int i = 0; i < listIn.length; i++) {
    count += listIn[i];
  }

  for (var i = 0; i < listIn.length + 1; i++) {
    acumulador += i + 1;
  }

  print(count);
  print(acumulador);

  return acumulador - count;
}
