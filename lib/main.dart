import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import './firebase_options.dart';

// auth screens
import './auth/login_or_register.dart';

// themes
import './theme/light_mode.dart';
import './theme/dark_mode.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
      home: const LoginOrRegister(),
    );
  }
}

// https://www.youtube.com/watch?v=0RWLaJxW7Oc&t=98s&ab_channel=MitchKoko 21:10