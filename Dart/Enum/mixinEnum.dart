mixin Pet {
  keepCompany() => print('keep you company');
}

enum Dog with Pet implements Comparable<Dog> {
  akita.guardDog('Akita', 'japan'), // generate instance with named constructor
  bulldog('Bulldog', 'england', false),
  chihuahua('Chihuahua', 'mexico', false);

  final bool guardDog;
  final String name;
  final String originCountry;

  // generative constructor can only called in the enum
  const Dog(this.name, this.originCountry, this.guardDog);

  // named constructor with initializers
  const Dog.guardDog(String name, String country)
      : this.name = name,
        this.originCountry = country,
        this.guardDog = true;

  // factory constructor can only return one of the known values redirect to generative constructor is illegal
  factory Dog.japanDog() {
    return values.firstWhere((value) => value.originCountry == 'japan');
  }

  // implements the Comparable interface to make it sortable
  int compareTo(Dog another) => this.index - another.index;

  // override the default toString method
  String toString() => name;
}

void main() {
  List<Dog> dogs = [Dog.bulldog, Dog.chihuahua, Dog.akita];
  dogs.sort((a, b) => a.compareTo(b));

  print(dogs);
  Dog.chihuahua.keepCompany();
  print(Dog.chihuahua.originCountry);
  print(Dog.japanDog());
}
