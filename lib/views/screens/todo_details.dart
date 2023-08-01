import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti_course_task/views/bloc/cubit.dart';
import 'package:iti_course_task/views/bloc/states.dart';

class TodoDetailsPage extends StatelessWidget {
  const TodoDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    var todoCubit = TodoCubit.get(context);
    return BlocBuilder<TodoCubit, TodoStates>(builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Todo Task Details'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'ID : ${todoCubit.todoId}',
                style: const TextStyle(fontSize: 24),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'User ID : ${todoCubit.todoUserId}',
                style: const TextStyle(fontSize: 24),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Title : ${todoCubit.todoTitle}',
                maxLines: 3,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 24,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              todoCubit.todoIsCompleted
                  ? const Text(
                      'Task is Completed',
                      style: TextStyle(fontSize: 24),
                    )
                  : const Text(
                      'Task is not Completed',
                      style: TextStyle(fontSize: 24),
                    )
            ],
          ),
        ),
      );
    });
  }
}
