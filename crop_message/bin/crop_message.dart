import 'dart:io';

void main(List<String> arguments) async {
  String testMessage = "Codility We teste coders";
  int testeK = 14;
  // String? messageIn;
  // String? kIn;

  // while (messageIn == null) {
  //   print("Digite a mensagem: ");
  //   messageIn = stdin.readLineSync();
  // }

  // while (kIn == null) {
  //   print("Digite o ponto de corte: ");
  //   kIn = stdin.readLineSync();
  // }

  print(solution(testMessage, testeK));
  // print(solution(messageIn, int.parse(kIn)));
}

String solution(String message, int k) {
  final stopWatch = Stopwatch()..start();
  List<String> messageCrop = message.split(" ");
  int count = 0;

  List<String> finalMessage = [];

  for (String element in messageCrop) {
    if (count <= k) {
      finalMessage.add(element);
      count += finalMessage.join(" ").length + 1;
    }
  }
  stopWatch.stop();
  print(stopWatch.elapsedTicks);
  return finalMessage.join(" ");
}
