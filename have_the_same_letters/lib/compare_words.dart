import 'dart:io';
import 'package:have_the_same_letters/word_sort.dart';

bool compareWords(List<String> arguments) {
  Set<int> wordsHashCode = {};
  if (arguments.isNotEmpty) {
    for (String element in arguments) {
      wordsHashCode.add(wordSort(element));
    }
  } else {
    for (int i = 0; i < 2; i++) {
      print("Digite ${i + 1}ª palavra: ");
      wordsHashCode.add(wordSort(stdin.readLineSync()!));
    }
  }
  return wordsHashCode.length == 1;
}
