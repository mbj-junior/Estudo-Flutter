enum Pet { cat, dog, fish }

void main() {
  final List<Pet> values = Pet.values;
  Type teste = Pet;
  print(teste);
  print(values); // [Pet.cat, Pet.dog, Pet.fish]
  print(Pet.cat); // Pet.cat
  print(Pet.dog.index); // 1
  print(Pet.fish == values[2]); // true
}
