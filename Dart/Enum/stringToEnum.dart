enum Color {
  red,
  green,
  blue,
}

class ColorHelper {
  static const Map<String, Color> _stringToColor = {
    'Red': Color.red,
    'Green': Color.green,
    'Blue': Color.blue,
  };

  static const Map<Color, String> _colorToString = {
    Color.red: 'Red',
    Color.green: 'Green',
    Color.blue: 'Blue',
  };

  static Color fromString(String colorString) {
    return _stringToColor[colorString] ?? Color.red;
  }

  static String toStringih(Color color) {
    return _colorToString[color] ?? 'Red';
  }
}

void main() {
  String colorString = 'Green';

  Color myColor = ColorHelper.fromString(colorString);
  print('Color: $myColor');

  String colorName = ColorHelper.toStringih(myColor);
  print('Color Name: $colorName');
}
