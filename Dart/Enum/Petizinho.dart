enum Pet { cat, dog, fish }

void main() {
  final pet = Pet.fish;

  switch (pet) {
    case Pet.cat:
      print('Cat');
      break;
    case Pet.dog:
      print('Dog');
      break;
    default:
      print("Fish");
  }

  print(Pet.cat.toString().split('.').last); // cat

  // names in non-english
  const names = ['chat', 'chien', 'poisson'];
  print(names[Pet.fish.index]); // poisson

  // find enum value by name
  final dog =
      Pet.values.firstWhere((e) => e.toString().split('.').last == 'dog');
  print(dog); // Pet.dog
}
