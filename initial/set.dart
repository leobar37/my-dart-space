// Sets
/**
 * A Set in dart is a unorder collection of unique items. Dart support 
 * for set is provided by set literals
 */

void main(List<String> args) {
  // A set
  var anySet = {"Hello", "World", "World"};
  // This print "Hello" , "World" because is a set
  print(anySet);
  // this is the same as above
  Set<String> aSet = {"Hello", "World", "World"};
  print(aSet);
  // empty set

  var emptySet = <String>{};
  print(emptySet);

  Set<String> superMarket = {};
  // returns true if the value is not yet in the set
  superMarket.add("Pear"); // True
  superMarket.add("Pear"); // Returns false and the set not changed
  print(superMarket);
  superMarket.addAll({'Pear', "Tangerine"});
  print(superMarket); // {Pear, Tangerine}
  //https://api.dart.dev/stable/2.18.4/dart-core/Set-class.html
  var exampleList = [1, 2, 3, 3, 4, 5, 3, 3, 3, 3, 3];
  // a set from a array
  final items = Set.from(exampleList);
  print(items);

  // any: checks wheter any element of this
  // iterable satisfases the the function
  final existAElementGreatherThan2 = items.any((element) => element > 2);
  print("exist a element greather than 2");
  print(existAElementGreatherThan2);
  // contains: wheter valus is in the set
  final exist3NumberInTheSet = items.contains(2);
  print("exist the 3 number in the set?");
  print(exist3NumberInTheSet);
}
