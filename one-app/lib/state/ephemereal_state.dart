import 'package:flutter/material.dart';

class CounterPageState extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CounterPage();
}

class CounterPage extends State<CounterPageState> {
  List<StatefulWidget> widgets = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("My Counter App"),
        ),
        body: SizedBox.expand(
            child: Center(
          child: Column(
            children: [
              OutlinedButton(
                  onPressed: () => {
                        setState(() {
                          widgets.add(CounterWithState());
                        })
                      },
                  child: Text("Add more")),
              ...this.widgets
            ],
          ),
        )));
  }
}

class CounterWithState extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CounterWidget();
}

class CounterWidget extends State<CounterWithState> {
  int _counter = 0;

  void incrementCounter() {
    setState(() {
      this._counter++;
    });
  }

  void decrementCounter() {
    setState(() {
      this._counter--;
    });
  }

  Widget makeAButton(String text, Function() onPressed) {
    return OutlinedButton(
      child: Text(text),
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.6,
      child: Container(
        padding: EdgeInsets.all(10),
        decoration:
            BoxDecoration(border: Border.all(color: Colors.blue, width: 6)),
        child: Wrap(
          alignment: WrapAlignment.center,
          children: [
            Text("Counter ${this._counter}", style: TextStyle(fontSize: 40)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                makeAButton("Decrement", () => {decrementCounter()}),
                makeAButton("Increment", () => {incrementCounter()}),
              ],
            )
          ],
        ),
      ),
    );
  }
}
