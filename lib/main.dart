import 'package:flutter/material.dart';
import 'package:sopra_aqui/pages/splash_screen.dart';
import 'package:sopra_aqui/themes/basic.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sopra Aqui',
      theme: AppTheme.light,
      home: SplashScreenPage(),
    );
  }
}