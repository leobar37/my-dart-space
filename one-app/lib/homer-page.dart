import "package:flutter/material.dart";

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Wenas, i'm a good developer")),
      body: Column(
        children: [ContainerWidget()],
      ),
    );
  }
}

var positionedElements = () {
  return Positioned(
    top: 20,
    left: 50,
    child: Transform(
      transform: Matrix4.identity()
        ..rotateZ(15 * 3.14 / 150)
        ..scale(0.5),
      alignment: Alignment.center,
      child: Container(
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(1)),
              color: Colors.red[500]),
          width: 50,
          height: 60,
          margin: EdgeInsets.only(top: 20),
          color: Colors.deepOrangeAccent),
    ),
  );
};

// make container, which is equivalent to a div
class ContainerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 300,
        height: 450,
        color: Colors.green,
        child: Stack(
          children: [
            Center(
              child: Text("hello world"),
            ),
            positionedElements()
          ],
        ));
  }
}

class TextWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = new TextStyle(
        color: Colors.red, fontSize: 24, fontWeight: FontWeight.w200);

    return Row(children: [Text("hello world", style: textStyle)]);
  }
}

class Progress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text("You needs a lot of discipline to achieve your goals"),
      LinearProgressIndicator(
        value: 0.0,
      ),
    ]);
  }
}

class TasksLists extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final items = List.filled(10, 1, growable: false)
        .asMap()
        .map((idx, value) {
          return new MapEntry(idx, TaskItem(label: "Task number ${idx + 1}"));
        })
        .values
        .toList();

    return Column(
      children: items,
    );
  }
}

class TaskItem extends StatelessWidget {
  final String label;

  const TaskItem({required this.label, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [Checkbox(value: false, onChanged: null), Text(this.label)],
    );
  }
}
