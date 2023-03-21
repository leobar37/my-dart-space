import "package:auto_route/auto_route.dart";
import 'package:dart/todo-app/routes.gr.dart';
import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import '../state/todos-notifier.dart';
import '../model/Todo.dart';

class ListItem extends StatelessWidget {
  final TodoItem todo;
  final int idx;
  ListItem({super.key, required this.todo, required this.idx});

  @override
  Widget build(BuildContext context) {
    final todosState = Provider.of<TodosState>(context, listen: true);

    return ListTile(
        title: Text(todo.name),
        leading: Checkbox(
            value: todo.isDone,
            onChanged: (value) {
              todosState.updateTodo(idx, (todo) {
                return TodoItem(name: todo.name, isDone: value!);
              });
            }));
  }
}

class ListTodos extends StatelessWidget {
  const ListTodos({super.key});

  @override
  Widget build(BuildContext context) {
    final todosState = Provider.of<TodosState>(context, listen: true);
    final _todos = todosState.todos;
    return Container(
      child: ListView.builder(
        padding: EdgeInsets.all(4),
        itemBuilder: (context, idx) {
          final todo = _todos[idx];
          return ListItem(
            todo: todo,
            key: ValueKey(todo),
            idx: idx,
          );
        },
        itemCount: _todos.length,
      ),
    );
  }
}

class OpenAddTodo extends StatelessWidget {
  const OpenAddTodo({super.key});

  @override
  Widget build(BuildContext context) {
    final router = AutoRouter.of(context);

    return Container(
      alignment: Alignment.center,
      padding: EdgeInsetsDirectional.only(top: 20),
      margin: EdgeInsets.all(8),
      child: FloatingActionButton(
        onPressed: () {
          router.push(CreateTodoRoute());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

@RoutePage()
class ListTodoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TodosState(),
      child: Scaffold(
          appBar: AppBar(title: Consumer<TodosState>(
            builder: (context, todoState, child) {
              final checkedTodos =
                  todoState.todos.where((todo) => todo.isDone).toList();
              return Text(
                  "${checkedTodos.length > 0 ? checkedTodos.length : "No"} checked Todos");
            },
          )),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(children: [Expanded(child: OpenAddTodo())]),
              Expanded(child: ListTodos()),
            ],
          )),
    );
  }
}
