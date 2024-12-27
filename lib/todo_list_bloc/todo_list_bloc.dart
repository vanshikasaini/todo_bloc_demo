import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc_demo/todo_list/cubit/todo_cubit.dart';
import 'package:todo_bloc_demo/todo_list/models/todo_models.dart';
import 'package:todo_bloc_demo/todo_list_bloc/bloc/todo_bloc.dart';

class TodoBlocList extends StatelessWidget {
  const TodoBlocList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
      ),
      //   body: BlocBuilder<TodoCubit, List<Todo>>(
      body: BlocBuilder<TodoBloc, List<Todo>>(
        builder: (context, todos) {
          return ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                final Todo todo = todos[index];

                return ListTile(
                  title: Text(todo.name),
                );
              });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add-todo');
        },
        tooltip: 'Add Todo',
        child: const Icon(Icons.add),
      ),
    );
  }
}
