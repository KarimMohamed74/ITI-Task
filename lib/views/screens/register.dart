import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti_course_task/views/bloc/cubit.dart';
import 'package:iti_course_task/views/bloc/states.dart';
import 'package:iti_course_task/views/screens/login.dart';
import '../widgets/button.dart';
import '../widgets/tff.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginStates>(builder: (context, state) {
      return Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  const SizedBox(
                    height: 150,
                  ),
                  Image.asset(
                    'assets/logo.png',
                    width: 150,
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  const Text(
                    'My First Application',
                    style: TextStyle(fontSize: 24),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  myTFF(
                    controller: email,
                    validate: (String? value) {
                      if (value!.isEmpty || !value.contains('@')) {
                        return "enter a valid e-mail";
                      }
                      return null;
                    },
                    label: 'E-mail',
                    prefix: Icons.email,
                    context: context,
                    color: Colors.black,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  myTFF(
                    validate: (String? value) {
                      if (value!.isEmpty || value.length < 8) {
                        return 'passwword is too short';
                      }
                      return null;
                    },
                    label: 'Password',
                    prefix: Icons.lock,
                    context: context,
                    color: Colors.black,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  myButton(
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        LoginCubit.get(context).signUp(
                            context: context,
                            emailAddress: email.text,
                            password: password.text);
                      }
                    },
                    text: 'Sign Up',
                    color: Colors.blue,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Already have an account? '),
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginPage(),
                              ));
                        },
                        child: const Text(
                          'Sign In',
                          style: TextStyle(color: Colors.blue),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
