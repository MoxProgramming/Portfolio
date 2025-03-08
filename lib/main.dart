import 'package:flutter/material.dart';
import 'package:portfolio/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mox Portfolio',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey[900],
        cardColor: Colors.blueGrey[900],
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyan, brightness: Brightness.dark, surface: Colors.grey[900]),
        brightness: Brightness.dark,
      ),
      home: const HomePage(),
    );
  }
}