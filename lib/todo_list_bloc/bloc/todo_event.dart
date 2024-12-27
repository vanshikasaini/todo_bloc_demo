part of 'todo_bloc.dart';

@immutable
sealed class TodoEvent {}

final class AddToDo extends TodoEvent {
  final String title;

  AddToDo({required this.title});
}
