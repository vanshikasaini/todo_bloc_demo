import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc_demo/todo_list/models/todo_models.dart';

part 'todo_event.dart';

class TodoBloc extends Bloc<TodoEvent, List<Todo>> {
  TodoBloc() : super([]) {
    on<AddToDo>((event, emit) {
      if (event.title.isEmpty) {
        addError('Title should not be empty in bloc statemanagement');
        return;
      }
      final Todo todo = Todo(name: event.title, createdAt: DateTime.now());
      emit([...state, todo]);
    });
  }
  @override
  void onChange(Change<List<Todo>> change) {
    super.onChange(change);
    debugPrint('TodoBloc  $change');
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    debugPrint('TodoBloc  $error');
  }
}
