enum Color {
  red('Red'),
  green('Green'),
  blue('Blue');

  const Color(this.name);

  final String name;
}

void main() {
  Color? c = Color.values.firstWhere((element) => element.name == "Reds", orElse: () => Color.blue);
  print(c);
}
