import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti_course_task/views/bloc/cubit.dart';
import 'package:iti_course_task/views/bloc/states.dart';
import 'package:iti_course_task/views/screens/todo_details.dart';
import 'package:iti_course_task/views/widgets/separtor.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var todoCubit = TodoCubit.get(context);
    return BlocBuilder<TodoCubit, TodoStates>(builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Todo List Task'),
          centerTitle: true,
        ),
        body: state is TodoStateIsLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : state is TodoStateIsSuccessful
                ? ListView.separated(
                    itemBuilder: (context, index) {
                      return ListTile(
                          onTap: () {
                            todoCubit.sendData(
                                id: todoCubit.todoList[index].id!,
                                userId: todoCubit.todoList[index].userId!,
                                title: todoCubit.todoList[index].title!,
                                isCompleted:
                                    todoCubit.todoList[index].completed!);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const TodoDetailsPage()));
                          },
                          title: Text(todoCubit.todoList[index].title!));
                    },
                    separatorBuilder: (context, index) {
                      return mySepartor();
                    },
                    itemCount: todoCubit.todoList.length)
                : const Center(
                    child: Text('Error'),
                  ),
      );
    });
  }
}
