import 'package:flutter/material.dart';

import './ui/screens/login_screen.dart';
import './ui/screens/home_screen.dart';

class RecipesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Recipes',
      initialRoute: '/login',
      routes: {
        '/': (context) => HomeScreen(),
        '/login': (context) => LoginScreen(),
      },
    );
  }
}
