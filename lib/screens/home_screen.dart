import 'package:flutter/material.dart';

// components
import '../components/my_drawer.dart';

class HomeScreen extends StatelessWidget {
  static String screenId = '/home_screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 0,
      ),
      drawer: const MyDrawer(),
    );
  }
}
