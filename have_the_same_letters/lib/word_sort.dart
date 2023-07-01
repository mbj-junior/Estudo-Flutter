int wordSort(String word) {
  List<String> wordSorted = word.toLowerCase().split('');
  wordSorted.sort();
  return wordSorted.join('').hashCode;
}