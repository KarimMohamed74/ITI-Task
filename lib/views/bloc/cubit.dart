import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti_course_task/models/todo_model.dart';
import 'package:iti_course_task/services/todo_service.dart';
import 'package:iti_course_task/views/bloc/states.dart';
import 'package:iti_course_task/views/screens/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TodoCubit extends Cubit<TodoStates> {
  TodoCubit() : super(TodoIntialState());
  static TodoCubit get(context) => BlocProvider.of(context);

  List<TodoListModel> todoList = [];
  int todoId = 1;
  int todoUserId = 1;
  String todoTitle = '';
  bool todoIsCompleted = true;
  Future getTodoList() async {
    try {
      emit(TodoStateIsLoading());
      todoList = await TodoListService().getTodoListService();
      emit(TodoStateIsSuccessful());
    } catch (e) {
      emit(TodoStateIsError());
    }
  }

  void sendData(
      {required int id,
      required int userId,
      required String title,
      required bool isCompleted}) {
    todoId = id;
    todoUserId = userId;
    todoTitle = title;
    todoIsCompleted = isCompleted;
  }
}

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginIntialState());
  static LoginCubit get(context) => BlocProvider.of(context);

  void signUp({
    required BuildContext context,
    required String emailAddress,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Sign Up Successful'),
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Sign Up failed : weak password'),
          ),
        );
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Sign Up failed : email already in use'),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Sign Up failed'),
          ),
        );
      }
    }
  }

  void signIn({
    required BuildContext context,
    required String emailAddress,
    required String password,
  }) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('email', emailAddress);

      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      if (context.mounted) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Sign In failed : user not found'),
          ),
        );
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Sign In failed : wrong password'),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Sign In failed'),
          ),
        );
      }
    }
  }
}
