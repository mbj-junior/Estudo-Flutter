import 'dart:io';

void main(List<String> arguments) async {
  String? messageIn;
  String? kIn;

  while (messageIn == null || messageIn.isEmpty) {
    stdout.write("Digite a mensagem: ");
    messageIn = stdin.readLineSync();
  }

  while (kIn == null || kIn.isEmpty) {
    stdout.write("Digite o ponto de corte: ");
    kIn = stdin.readLineSync();
  }

  print(solution(messageIn, int.parse(kIn)));
}

String solution(String message, int k) {
  final stopWatch = Stopwatch()..start();
  List<String> messageCrop = message.split(" ");
  int count = 0;

  List<String> finalMessage = [];

  for (var i = 0; count <= k; i++) {
    finalMessage.add(messageCrop[i]);
    count += finalMessage.join(" ").length + 1;
  }

  stopWatch.stop();
  print(stopWatch.elapsedTicks);
  return finalMessage.join(" ");
}
