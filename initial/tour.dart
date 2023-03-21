// define a function
// This is a comment
/**
 * This as well is a comment :)
 */

// void is a special type that indicates a value tha't neves used
// A function that don't explicity a return value have the void return type
void printAInteger(int aNumber) {
  print('This is your number $aNumber');
}

void definedVariables() {
  var name = "Hello";
  Object nameObj = "Hello";
  String nameString = "Hello";
  print("These are the same variables");
  print({name, nameObj, nameString});
}

void printNumbersWithAFunction() {
  int aNumber = 3;
  int passedNumber = aNumber > 3 ? 100 : 50;
  printAInteger(passedNumber);
}

void optionaVariables() {
  /**
   * if you enable null safety, then you must initialize the values of null-variables before use them
   */
  int? aNumber;
  /**
    * The first argument of assert can be any expresion that resolves to a boolean value.
    * if the expression's values is true assertion succeeds and execution continues.
    * When exactly do assertions work? That depends on the tools and framework you’re using:
    * - Flutter enables assertions in debug mode.
    * - Development-only tools such as [webdev serve][] typically enable assertions by default.
    *- Some tools, such as dart run and [dart compile js][] support assertions through a command-line flag: --enable-asserts.
    */
  assert(aNumber == 111, "this is my message");
}

void lateVariables() {
  /**
   * Dart 2.2 added late modifier, which has two uses cases:
   * - Declaring a non-null variable tha's initialized after its declaration
   * - Lazily initializing a variable 
   */
  // if you're sue that a variable is set before it's used, but Dart disagrees, you can fix
  //  the error making the variable late
  late String description;
  void main() {
    description = "Hello wordl";
    /**
     * If you fail ot initalize late variable , a runtime error occurs when the variable is used
     */
    print(description);
  }

  /**
   * When you mark  a variable as late but initialize it and its declaration, the
   * the initializer runs the first time the variable is used 
   * This is lazy initilization is handy in a couple of cases:
   * - The variable might not be needed, and initalizing is costly
   * - You're initializing a instance variable, and its initializes need access to this 
   * For example: In the follwing example, if the temparature variable is never used, then
   * the expensive readThermometer() function is never called.
   * ```
   * late String temperature = readThermometer(); // lazy initialized 
   * ````
   * 
   */
  main();
}

void finalAndConst() {
  /**
   * if you never intend to change a variable, use final or const, either instead of
   * var or in addition a type 
   * a final variable can be set only once; a const variable is a compile-time
   * constant(const variable are implicity final) 
   */
  final name = "leo";
  final String name2 = "leo";
  /**
   * Use const for variables that you want to be compile-time constants
   * such as a number or string literal, a const variable, or the result of an arithmetic operation on constant numbers:
   * 
   */
  const bar = 1000000; // Unit of pressure (dynes/cm2)
  const double atm = 1.01325 * bar; // Standard atmosphere
  /**
   * Instance variables can be a final but not a constant
   */
  // you can define constants that use
}

void main() {
//  printNumbersWithAFunction();
  definedVariables();
  optionaVariables();
}
