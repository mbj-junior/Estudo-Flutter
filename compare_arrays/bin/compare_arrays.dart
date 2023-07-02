// Escrever uma função que receberia como parâmetro dois arrays
// de números inteiros desordenados e deveria retornar se ambos tinham os
// mesmos valores, independentemente da ordem.

void main(List<String> arguments) {
  print(compareListInt([1, 2, 3, 4], [3, 2, 1, 4, 6]));
}

bool compareListInt(List<int> firstList, List<int> secondList) {
  int countFistList = 0;
  int countSecondList = 0;
  bool isEqual = false;

  if (firstList.length == secondList.length) {
    for (int i = 0; i < firstList.length; i++) {
      countFistList += firstList[i];
      countSecondList += secondList[i];
    }
    isEqual = countFistList == countSecondList;
  }

  return isEqual;
}
