import 'package:flutter/material.dart';

// themes
import './theme/light_mode.dart';
import './theme/dark_mode.dart';

// screens
import './screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightMode,
      darkTheme: darkMode,
      home: LoginScreen(),
    );
  }
}

// https://www.youtube.com/watch?v=0RWLaJxW7Oc&t=98s&ab_channel=MitchKoko 21:10