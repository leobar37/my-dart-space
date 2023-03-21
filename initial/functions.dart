import 'dart:ffi';

void lexicalScope() {
  /**
   * Dart is lexical scoped language, which means that the scope 
   * is determined statically, simply by the layout of the code
   */
  // Example
  void myFn1() {
    String aVariableInF1 = "f1Variable";
    void myFn2() {
      String aVariableInF2 = "f2Variable";
      void myFn3() {
        String aVariableInF3 = "f3Variable";
        // myFn3 have acces all top-level variables
        print(aVariableInF1);
        print(aVariableInF2);
        print(aVariableInF3);
      }
    }
  }

  /**
   * A clousure is a function object that has access 
   * to variables in its lexical scope, even when the function 
   * is used outside of its original scope
   */
  makeASum() {
    int count = 0;
    sum() {
      count = count + 1;
    }

    minus() {
      count = count - 1;
    }

    return {"sum": sum, "minus": minus, "result": () => count};
  }

  Map actions = makeASum();

  print(actions);

  actions["sum"]!();
  actions["sum"]!();
  actions["sum"]!();
  actions["minus"]!();

  int result = actions["result"]();

  print("This is the result ${result}");

  // returns a function that adds [addBy] to the function's argument
  Function makeAddr(int addBy) {
    return (int i) => addBy + i;
  }

  var addSum = makeAddr(5);
}

// you can pass as parameter to another function. For example
void functionAsFirtClasObjects() {
  List<dynamic> anyList = ["heas", 1, "asas", 454];

  void printAnyElement(dynamic value) {
    print(value);
  }

  print("Print elements");
  anyList.forEach(printAnyElement);

  // define a function as variable
  var printAMesageWithExclamation = (String msg) => print(msg);
  void printAMesageWithExclamation2(String msg) => print(msg);

  printAMesageWithExclamation("hello");
  printAMesageWithExclamation2("Hello world");
  /**
   * Anonymus function
   * You can also create a nameless function called 
   * an anonymus function, or sometimes, lambda or clousure
   */
  final anyFn = (dynamic element) {
    // you can get the index, to do this
    int idx = anyList.indexOf(element);
    print("Printed by an anonymus function");
    print("My index is $idx and my value is $element");
  };
  anyList.forEach((element) {
    // you can get the index, to do this
    int idx = anyList.indexOf(element);
    print("Printed by an anonymus function");
    print("My index is $idx and my value is $element");
  });
  // above is the same to this
  anyList.forEach(anyFn);
}

void main(List<String> args) {
  /**
   * Dart is true object-oriented language, so even functions are objects have a type
   * Function. This means that functions can be assigned to variables or passed as
   * arguments to ther functions
   */
  String getMyHelloWorld(String name) {
    return 'Hello world $name';
  }

  late String helloWorld = getMyHelloWorld("Leo");

  print(helloWorld);

  // For the functions that contain just one expression, you can use a shorthand
  // sintax
  // arrow sintax
  String helloFunction(String name) => 'Hello world $name';

  print(helloFunction("Leo"));

  /**
   * Named Parameters:
   * Named parameters are optional unless they're explicity  as required
   */
  bool configApp({required bool applyVersion, bool? requiredApp = false}) {
    print("To do something with config params");
    print(
        {"requiredApp": requiredApp, "applyVersion": applyVersion}.toString());
    return true;
  }

  configApp(applyVersion: true);
  /**
   * Optional positional parameters
   * Wrapping a set function parameters in [] marks them as optional positional parameters
   */

  void applyString(String first, String second, [String? third, String? four]) {
    print("Hacking with simple strings");
    print({
      "first": first,
      "Second": second,
      "optional": [third, four]
    });
  }

  applyString("Hello", "Word", "hey", "Startup world");

  // pass lists as default value

  void doStuff({
    List<int> myNums = const [1, 2, 3, 4],
    Map<String, int> myMap = const {"birthday": 15, "delay": 150},
  }) {
    print({"defaultList": myNums, "defaultMap": myMap});
  }

  const exampleArr = [1, 2, 3, 4];
  bool everyNumMoreThan2 = exampleArr.every((num) => num > 2);
  bool anyNumMoreThan2 = exampleArr.any((num) => num > 2);
  var evenNumbers = exampleArr.where((num) => num.isEven);
  print(everyNumMoreThan2);
  print(anyNumMoreThan2);
  print(evenNumbers);
  doStuff();

  functionAsFirtClasObjects();
  lexicalScope();
}
