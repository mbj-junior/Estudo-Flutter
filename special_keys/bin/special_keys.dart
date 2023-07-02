import 'package:special_keys/special_keys.dart';
import 'dart:io';

void main(List<String> arguments) {
  String? message;

  while (message == null || message.isEmpty) {
    stdout.write("digite a mensagem: ");
    message = stdin.readLineSync();
  }

  stdout.write("Frase final: ${soluction(message)}");
}
