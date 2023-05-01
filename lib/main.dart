import 'package:chef_kart/view/home/home_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ChefKart',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: "AdobeClean",
          appBarTheme: const AppBarTheme(color: Colors.white, elevation: 0)),
      home: const HomeView(),
    );
  }
}
