import 'dart:async';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 5), () {
      Navigator.of(context).pushReplacementNamed("home");
    });
    var assetsImage = const AssetImage(
        'assets/images/splash_screen.png'); //<- Creates an object that fetches an image.
    var image = Image(
        image: assetsImage,
        height: 50); //<- Creates a widget that displays an image.

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(color: Color(0xFF093E61)),
        child: Center(
          child: image,
        ),
      ), //<- place where the image appears
    );
  }
}
