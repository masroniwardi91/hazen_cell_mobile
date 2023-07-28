import 'package:flutter/material.dart';
import 'package:hazen_cell_mobile/home.dart';
import 'package:hazen_cell_mobile/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hazen.Cell',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF093E61)),
        useMaterial3: true,
      ),
      // home: const SplashScreen(),
      initialRoute: 'splashscreen',
      routes: {
        'splashscreen':(context) => SplashScreen(),
        'home':(context) => HomePage(),
      },
    );
  }
}
