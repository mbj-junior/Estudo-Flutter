
String soluction(String s) {
  if (s == "") {
    return s;
  }

  List<String> word = s.split("");
  List<String> finalWord = [""];
  bool isCapsLook = false;

  String specialC = "C";
  String specialB = "B";

  for (String element in word) {
    if (element == specialC) {
      isCapsLook = !isCapsLook;
    }
    if (element == specialB) {
      finalWord.removeLast();
    }
    if (element != specialC && element != specialB) {
      finalWord.add(isCapsLook ? element.toUpperCase() : element);
    }
  }

  return finalWord.join("");
}