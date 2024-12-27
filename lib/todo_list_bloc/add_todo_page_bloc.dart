import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc_demo/todo_list/cubit/todo_cubit.dart';
import 'package:todo_bloc_demo/todo_list_bloc/bloc/todo_bloc.dart';

class AddTodoBlocPage extends StatefulWidget {
  const AddTodoBlocPage({super.key});

  @override
  State<AddTodoBlocPage> createState() => _AddTodoBlocPageState();
}

class _AddTodoBlocPageState extends State<AddTodoBlocPage> {
  final todoTitleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Todo'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: todoTitleController,
              decoration: const InputDecoration(hintText: 'Title'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // context
                //     .read<TodoBloc>()
                //     .add(AddToDo(title: todoTitleController.text.toString()));
                // Or use below syntax
                BlocProvider.of<TodoBloc>(context)
                    .add(AddToDo(title: todoTitleController.text.toString()));
                Navigator.of(context).pop();
              },
              child: const Text('Add Todo'),
            ),
          ],
        ),
      ),
    );
  }
}
