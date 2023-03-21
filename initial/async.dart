Future<void> main(List<String> args) async {
  void countSeconds(int seconds) {
    for (var i = 0; i < 5; i++) {
      Future.delayed(Duration(seconds: i), () => print(i));
    }
  }

  Future<String> fetchUser() async =>
      Future.delayed(new Duration(seconds: 4), () => "Hello world");
  Future<String> createOrderMessage() async {
    var order = await fetchUser();
    return "Your order is: $order";
  }

  countSeconds(4);

  dynamic result = await createOrderMessage();
  print(result);
}
