import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc_demo/todo_list/add_todo_page.dart';
import 'package:todo_bloc_demo/todo_list/cubit/todo_cubit.dart';
import 'package:todo_bloc_demo/todo_list/todo_list.dart';
import 'package:todo_bloc_demo/todo_list_bloc/add_todo_page_bloc.dart';
import 'package:todo_bloc_demo/todo_list_bloc/bloc/todo_bloc.dart';
import 'package:todo_bloc_demo/todo_list_bloc/todo_list_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      //create: (context) => TodoCubit(),
      create: (context) => TodoBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: '/',
        routes: {
          // for todo_list using cubit
          // '/': (_) => const TodoList(),
          // '/add-todo': (_) => const AddTodoPage(),
          /// for todo_list_bloc using bloc for state management
          '/': (_) => const TodoBlocList(),
          '/add-todo': (_) => const AddTodoBlocPage(),
        },
      ),
    );
  }
}
