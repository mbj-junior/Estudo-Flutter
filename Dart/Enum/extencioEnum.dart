enum Color { red, green, blue }
// depois do dart 2.15 os enums já imcorporava os extencios e tinha alguns nativamente

void main() {
  // dart < 2.15
  print(Color.red.toString().split('.').last); // red
  // dart >= 2.15, with official EnumExtension
  print(Color.red.name); // red
}
