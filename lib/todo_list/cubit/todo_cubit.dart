import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc_demo/todo_list/models/todo_models.dart';

class TodoCubit extends Cubit<List<Todo>> {
  TodoCubit() : super([]);

  void addToDo(String title) {
    if (title.isEmpty) {
      addError("Title cannot be empty");
      return;
    }
    final todo = Todo(name: title, createdAt: DateTime.now());
    // state.add(todo);
    //debugPrint('not of todos list : $state'); we can check the same by using onChange method of Cubit
    emit([...state, todo]);
  }

  @override
  void onChange(Change<List<Todo>> change) {
    super.onChange(change);
    debugPrint('no. of todos list : TodoCubit - $change');
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    debugPrint('OnError : TodoCubit - $error');
  }
}
