import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hazen_cell_mobile/home.dart';
import 'package:hazen_cell_mobile/splash_screen.dart';

import 'pages/cart_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
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
        primaryColor: const Color(0xFF093E61),
        scaffoldBackgroundColor: Color.fromARGB(255, 255, 255, 255),
      ),
      // home: const SplashScreen(),
      initialRoute: 'splashscreen',
      routes: {
        'splashscreen': (context) => SplashScreen(),
        'home': (context) => HomePage(),
        'cartpage': (context) => CartPage(),
      },
    );
  }
}
