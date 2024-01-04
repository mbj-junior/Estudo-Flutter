enum Color { red, green, blue }

extension ColorExt on Color {
  // names in non-english
  String get name {
    switch (this) {
      case Color.red:
        return 'rojo';
      case Color.green:
        return 'verde';
      default:
        return 'azul';
    }
  }

  String get hexCode {
    const hexCodes = ['#FF0000', '#00FF00', "aa"];
    return hexCodes[this.index];
  }
}

void main() {
  print(Color.green.toString()); // verde
  print(Color.green.hashCode); // verde
  print(Color.blue.hexCode); // #0000FF
}


