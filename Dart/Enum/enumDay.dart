enum Day { monday, tuesday }

extension ParseToString on Day {
  String toShortString() {
    return this.name;
  }
}

extension DayEx on Day {
  int get indexteste => this.index;
}

main() {
  Day monday = Day.monday;
  print(monday.toShortString()); //prints 'monday'
  print(Day.tuesday.indexteste); //prints 'monday'
}

