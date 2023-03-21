import 'package:flutter/material.dart';

class ElevatedButtonExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text("Elevated Button"),
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        elevation: 1,
        padding: EdgeInsets.all(12),
      ),
    );
  }
}

class OutlineButtonExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        print("outline button pressed");
      },
      child: Text("Outline Button"),
      style: OutlinedButton.styleFrom(
          alignment: Alignment.center,
          side: BorderSide(color: Colors.red, width: 5)),
    );
  }
}

class TextButtonExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {},
        child: Text("Text Button"),
        style: TextButton.styleFrom(
          alignment: Alignment.center,
          side: BorderSide(color: Colors.red, width: 5),
          foregroundColor: Colors.red,
        ));
  }
}

class FlutterIconExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: Icon(Icons.favorite),
      iconSize: 25,
      color: Colors.red,
    );
  }
}

class FloationActionButtonExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        backgroundColor: Colors.red, child: Icon(Icons.add), onPressed: () {});
  }
}

class ButtonApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My buttons App"),
        backgroundColor: Colors.blue[900],
        centerTitle: true,
      ),
      body: Center(
        child: Wrap(
          direction: Axis.vertical,
          runAlignment: WrapAlignment.center,
          children: [
            ElevatedButtonExample(),
            OutlineButtonExample(),
            TextButtonExample(),
            FlutterIconExample()
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloationActionButtonExample(),
    );
  }
}
