import 'package:flutter/material.dart';

import '../model/Todo.dart';

List<TodoItem> makeTodoItems() {
  return List.filled(10, null, growable: true)
      .asMap()
      .map((key, value) => MapEntry(key, TodoItem(name: "Tood $key")))
      .values
      .toList();
}

class TodosState extends ChangeNotifier {
  List<TodoItem> todos = makeTodoItems();

  void updateTodo(int idx, TodoItem updater(TodoItem todo)) {
    List<TodoItem> clonedTodos = List.from(todos);
    clonedTodos[idx] = updater(clonedTodos[idx]);
    todos = clonedTodos;
    notifyListeners();
  }
}
