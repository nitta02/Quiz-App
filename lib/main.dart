import 'package:flutter/material.dart';
import 'package:fravia_app/pages/game_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'State Management APP',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'BricolageGrotesque_18pt_Condensed-Regular',
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.white,
        ),
        scaffoldBackgroundColor: const Color.fromARGB(255, 109, 109, 104),
        useMaterial3: true,
      ),
      home: GamePage(),
    );
  }
}
