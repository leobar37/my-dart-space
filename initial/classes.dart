import 'dart:math';

abstract class Greeting {
  Person? person = null;
  void setPerson(Person per);

  void sayHello() {
    if (this.person != null) {
      print("Hello  ${this.person?.name}");
    } else {
      print("I love say hello to much");
    }
  }
}

class GreetingToDoctor extends Greeting {
  @override
  void setPerson(Person per) {}
}

class Rectangle {
  double left, top, width, height;
  Rectangle(this.left, this.top, this.width, this.height);
  // define two calculated properties rigth and bottom
  double get rigth => left + width;
  set right(double value) => left = value - width;
  double get bottom => top + height;

  set bottom(double value) => top = value + height;
}

class Person {
  String name;
  String lastName;

  Person(this.name, this.lastName);

  String get fullName {
    return "$name $lastName";
  }

  set fullName(String completeName) {
    final names = completeName.split(" ");
    name = names[0];
    lastName = names[1];
  }

/**
 * Take a portion of the union between 
 * Name and LastName as default username
 */
  get userName {
    int ramInt = 0;
    int ramIntInitial = 0;

    void refreshValues() {
      ramInt = Random().nextInt(this.fullName.length);
      ramIntInitial = Random().nextInt(this.fullName.length - 5);
    }

    refreshValues();
    while (ramIntInitial >= ramInt) {
      refreshValues();
    }

    return "${ramIntInitial}${this.fullName.substring(ramIntInitial, ramInt)}${ramInt}"
        .replaceAll(" ", "");
  }
}

void main(List<String> args) {
  final person = new Person("Elmer", "Joselito");
  print(person.toString());
  print(person.fullName);
  print({"name": person.name, "fullName": person.lastName});
  print("Set full name");
  person.fullName = "Leonardito Dicaprio";
  print("New full name");
  print(person.name);
  print(person.lastName);
  print(person.fullName);
  print(person.userName);
}
