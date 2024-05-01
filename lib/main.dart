import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import './firebase_options.dart';

// screens
import './auth/login_or_register.dart';
import './screens/home_screen.dart';
import './screens/profile_screen.dart';
import './screens/users_screen.dart';

// auth screens
import './auth/auth.dart';

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
      title: "Social Media App",
      debugShowCheckedModeBanner: false,
      theme: lightMode,
      darkTheme: darkMode,
      initialRoute: AuthScreen.screenId,
      routes: {
        AuthScreen.screenId: (context) => const AuthScreen(),
        LoginOrRegister.screenId: (context) => const LoginOrRegister(),
        HomeScreen.screenId: (context) => HomeScreen(),
        ProfileScreen.screenId: (context) => ProfileScreen(),
        UsersScreen.screenId: (context) => const UsersScreen(),
      },
    );
  }
}
