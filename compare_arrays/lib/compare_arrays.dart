bool compareListInt(List<int> firstList, List<int> secondList) {
  int count = 0;
  bool isEqual = false;

  if (firstList.length == secondList.length) {
    for (int i = 0; i < firstList.length; i++) {
      count += firstList[i];
      count -= secondList[i];
    }
    isEqual = count == 0;
  }

  return isEqual;
}
