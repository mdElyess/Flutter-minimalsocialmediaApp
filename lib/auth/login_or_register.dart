import 'package:flutter/material.dart';

// screens
import '../screens/login_screen.dart';
import '../screens/register_screen.dart';

class LoginOrRegister extends StatefulWidget {
  static String screenId = '/profile_screen';

  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  // initially, show login screen
  bool showLoginScreen = true;

  // toggle between login and register screens
  void toggleScreens() {
    setState(() {
      showLoginScreen = !showLoginScreen;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginScreen) {
      return LoginScreen(onTap: toggleScreens);
    } else {
      return RegisterScreen(onTap: toggleScreens);
    }
  }
}
