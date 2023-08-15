import 'package:flutter/material.dart';
import 'package:my_portifolio/res/color_schemes.g.dart';
import 'package:my_portifolio/ui/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Portifolio',
      theme: ThemeData(
          colorScheme: darkColorScheme,
          useMaterial3: true,
          fontFamily: 'Roboto'),
      home: HomePage(),
    );
  }
}
