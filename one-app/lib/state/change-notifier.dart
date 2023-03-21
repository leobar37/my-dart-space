import 'package:flutter/material.dart';
// https://dart.dev/guides/language/language-tour#adding-features-to-a-class-mixins
// https://docs.flutter.dev/development/data-and-backend/state-mgmt/simple
import 'package:provider/provider.dart';

class Counter with ChangeNotifier {
  int _counter = 0;
  Counter(this._counter);
  int get counter => this._counter;

  set counter(int num) {
    this._counter = num;
  }

  void increment() {
    this._counter++;
    this.notifyListeners();
  }

  void decrement() {
    this._counter--;
    this.notifyListeners();
  }
}

class ButtonsToCounter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final counterNotifier = Provider.of<Counter>(context, listen: false);
    final textStyle = TextStyle(fontSize: 25);
    var buttonMore = ElevatedButton(
        onPressed: () {
          counterNotifier.increment();
        },
        child: Text("+", style: textStyle));
    var buttonLess = ElevatedButton(
        onPressed: () {
          counterNotifier.decrement();
        },
        child: Text("-", style: textStyle));
    return Wrap(
        spacing: 10,
        children: [Expanded(child: buttonLess), Expanded(child: buttonMore)]);
  }
}

class CounterDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Counter>(builder: (context, notifier, child) {
      final count = notifier.counter;
      return Text(
        "$count",
        style: TextStyle(fontSize: 60),
      );
    });
  }
}

class CounterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: FractionallySizedBox(
          heightFactor: 0.4,
          widthFactor: 0.5,
          child: Column(
            children: [CounterDisplay(), ButtonsToCounter()],
          ),
        ),
      ),
    );
  }
}

class CounterWithNotifier extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Counter with notifier"), centerTitle: true),
        body: ChangeNotifierProvider(
            create: (context) => Counter(0), child: CounterApp()));
  }
}
