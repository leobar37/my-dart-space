import 'dart:math';

void main(List<String> args) {
  // create a map

  var aLiteralMap = {
    "Name": "Leo",
    "LastName": "Why do you care? :)",
  };
  // the same object as above, but with Map Contructor
  var myMap = Map<String, String>();
  /**
   * Wait a moment, where are the "new" keyword?:o
   * In dart the "new" keyword is optional
   * @see https://dart.dev/guides/language/language-tour#using-constructors
   */
  myMap["Name"] = "Leo";
  myMap["LastName"] = "Okey, my lastname is .. Why do you care?";
  print(myMap);

  if (aLiteralMap == myMap) {
    print("Maps are equals");
  } else {
    print("The objects are not equal");
  }
  // TIP:
  // getting a object type
  print(myMap.runtimeType);
}
