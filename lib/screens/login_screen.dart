import 'package:flutter/material.dart';

// components
import '../components/my_textfield.dart';

class LoginScreen extends StatelessWidget {
  // text controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // logo
              Icon(
                Icons.person,
                size: 80,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),

              const SizedBox(height: 25),
              // app name
              const Text(
                "M I N I M A L",
                style: TextStyle(fontSize: 20),
              ),

              // email textfield
              MyTextField(
                hintText: "",
                obscureText: false,
                controller: emailController,
              ),

              // password textfield

              // forgot password

              // sign in button

              // don't have an account? Register here
            ],
          ),
        ));
  }
}
