void main(List<String> arguments) {
  String testMessage = "Codility We test coders test";
  int k = 14;

  solution(testMessage, k);
}

String solution(String message, int k) {
  List<String> messageCrop = message.split(" ");
  int count = 0;

  List<String> finalMessage = [];

  for (String element in messageCrop) {
    if (count <= k) {
      finalMessage.add(element);
      count += finalMessage.join(" ").length;
    }
  }

  return finalMessage.join(" ");
}
