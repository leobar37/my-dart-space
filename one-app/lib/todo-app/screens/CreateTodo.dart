import "package:auto_route/auto_route.dart";
import "package:flutter/material.dart";

@RoutePage()
class CreateTodoScreen extends StatelessWidget {
  const CreateTodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print("Create Todo Screen");
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Todo"),
      ),
      body: Container(
        child: Text("CreateTodoScreen"),
      ),
    );
  }
}
