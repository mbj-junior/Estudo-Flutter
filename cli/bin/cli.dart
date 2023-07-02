import 'dart:io';
import 'package:cli/is_bigger_target.dart';

void main(List<String> arguments) {
  print("Informe uma lista de numeros:");
  String? numbers = stdin.readLineSync();
  if (numbers != null) {
    isBiggerTarget(userInput: numbers) ? print("É 42") : print("Não é 42");
    isBiggerTarget(userInput: numbers, inputTarget: 32) ? print("É 32") : print("Não é 32");
  } else {
    print("valores invalidos");
  }
}
