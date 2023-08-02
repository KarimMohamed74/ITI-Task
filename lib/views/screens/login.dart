import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti_course_task/views/bloc/cubit.dart';
import 'package:iti_course_task/views/bloc/states.dart';
import 'package:iti_course_task/views/screens/register.dart';
import '../widgets/button.dart';
import '../widgets/tff.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
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
                    controller: password,
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
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Forgot Password ? '),
                      Text(
                        'Tap Me',
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  myButton(
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        LoginCubit.get(context).signIn(
                            context: context,
                            emailAddress: email.text,
                            password: password.text);
                      }
                    },
                    text: 'Login',
                    color: Colors.blue,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('No Account? '),
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RegisterPage(),
                              ));
                        },
                        child: const Text(
                          'Sign Up',
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
