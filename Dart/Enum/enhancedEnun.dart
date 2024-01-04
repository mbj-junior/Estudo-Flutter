enum Color {
  red('#FF0000', 'Red'),
  green('#00FF00', 'Green'),
  blue('#0000FF', 'Blue');

  const Color(this.hexCode, this.name);

  final String hexCode;
  final String name;

  @override
  String toString() => '$name: $hexCode';
}

void main() {
  final blue = Color.blue;
  print(blue.hexCode); // #00FF00
  print(blue.name); // Blue
  print(blue); // Blue: #00FF00
}