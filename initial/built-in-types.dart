int numbersLeason() {
  // int is a number not loger than 64bit
  int aNumber = 5;
  // double precision
  late double myDoubleNumber = 5.2;

  // you can also declare a variable as a num, if you do this, the varibles can have both
  // integers and doubles values.
  num x = 1;
  num y = 1.5;

  // transform string to int and viceversa
  // string -> int
  var one = int.parse("1");
  print("this is a number $one");
  // int -> string
  String aNumberInString = 1.toString();
  // double -> String
  String piAsString = 3.14159.toStringAsFixed(2);

  // literal numbers are compile-time constants. Many arithmetic expressions are also compile-time constants,
  // as long as their operands are compile-time constans that evaluates to numbers
  const msPerSecond = 1000;
  const secondPerUnity = 5;
  const msUntilRetry = secondPerUnity * msPerSecond;
  return msUntilRetry;
}

void stringLeasons() {
  String s1 = 'Single quotes work well fo Strings literals';
  String s2 = "Double quotes work just well";
  String s3 = 'It\'s easy to escape the string delimeter.';
  String s4 = "It's even easier to use other delimeter";

  // string interpolation
  String greeting = "Hello world";
  String result = "This is a interpolation $greeting";
  // interpolate a expression
  const int resultArithmeticExpression = 10;
  print(
      "Hello moto ${resultArithmeticExpression >= 10 ? "moto10" : "moto-10"}");

  // concatenation
  String exampleConcatenation = "Hello world"
      "awa de uwu"
      "Dime si tu"
      "shi o no:=)";
  // this works as well
  String helloConcatenation = "Hello friend" + "Hugo";

// another way to create a multi-line string: use a triple quote 
//with either single or double
// quotation marks

  String s1 = '''
 Create multi-line like this one 
 ${222}
''';
}|

void booleanLeason() {
  //  to represent boolean values. Dart has a type named bool. 
  // Only two objects
  // have type bool: the boolean literals true and false which are both compile-time constants

  bool myBooleanType = true;
  const booleanType = false;
}

void main() {
  numbersLeason();
}
