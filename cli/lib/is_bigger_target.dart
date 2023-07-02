/// Recive a String and return if the sum is bigest of target
bool isBiggerTarget({required dynamic userInput, int? inputTarget}) {
  List<String> userInputList = userInput.split(" ");
  int count = 0;
  final target = inputTarget ?? 42;

  for (String element in userInputList) {
    int? number = int.tryParse(element);
    if (number != null) {
      count += number;
      if (count > target) return false;
    }
  }

  return count == target;
}
