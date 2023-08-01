import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti_course_task/firebase_options.dart';
import 'package:iti_course_task/views/bloc/cubit.dart';
import 'package:iti_course_task/views/screens/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TodoCubit>(
          create: (BuildContext context) => TodoCubit()..getTodoList(),
        ),
        BlocProvider<LoginCubit>(
          create: (BuildContext context) => LoginCubit(),
        ),
      ],
      child: MaterialApp(
        home: LoginPage(),
      ),
    );
  }
}
