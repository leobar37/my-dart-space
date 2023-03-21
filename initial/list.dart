void controlFlowCollection() {
  bool isAndroid = true;
  bool isAks = false;
  List<int> toAddInAndroid = [
    9,
    8,
    7,
    // you can add comma after the the last item in dart,
    // this trailing comma doesn't affect the collection
    // but it can prevent copy-paste errors
    6,
  ];
  List<int> aksFields1 = [-1, -2, -3, -4];
  print("Flow collection");

  List<int> myList = [
    // return a  expression
    for (var i = 0; i < 5; i++) i + 1,
    // by default insert the 5 firts values
    for (final myNum in toAddInAndroid.sublist(0, 4)) myNum,
    // why not express sintax
    // where is "else" here? :)
    if (isAndroid) ...toAddInAndroid,
    // ignore: dead_code
    if (isAks) ...aksFields1,
  ];
  print(myList.join(","));
}

void dartLists() {
  /**
   * Dart lis literals are denoted by a comma separated list of expressions or values
   * enclosed in square brackets ([]).
   */
  List myList = [
    "Tomate",
    "Pimienta",
    "Perejil",
  ];

  assert(myList.length == 3);
  assert(myList[0] == "Tomate");
  // to create a list that's a compile-time constant, add const before the list literal
  const List<int> myLiterals = const [
    1,
    2,
    3,
    4,
  ];

  myList[0] = 1; // this line will cause an error

  /**
    * Sprea operator
    */
  var exampleList = [1, 2, 3];

  List<int> newList = [...exampleList];
  print("This is my new List ${newList.join(",")}");
}

class Person {
  String name;
  String lastName;
  int age;
  Person(this.name, this.lastName, this.age);
  @override
  String toString() {
    return "This is user is called $name";
  }
}

List<Person> makePersons() {
  final persons = List.filled(10, null, growable: true)
      .asMap()
      .map((idx, value) {
        return new MapEntry(
            idx, new Person("Elmer $idx", "León $idx", 5 + idx));
      })
      .values
      .toList();

  return persons.toList();
}

void main(List<String> args) {
  var persons = makePersons();
  var selectedPerson = persons.firstWhere((element) {
    var lastLetter = element.name
        .substring(element.name.length - 1, element.name.length - 0);
    return lastLetter == "3";
  });

  int showAge(Person person) {
    return person.age;
  }

  print("the selected person is $selectedPerson");
  print("the selected person age is ${showAge(selectedPerson)}");
}
