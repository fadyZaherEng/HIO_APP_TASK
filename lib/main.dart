import 'package:flutter/material.dart';
import 'package:task_design/task/home/home_screen.dart';

void main() {
  runApp( const HioApp());
}
class HioApp extends StatelessWidget {
  const HioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blueAccent,
        primarySwatch:Colors.blue,
      ),
      home:HomeScreen(),
    );
  }
}
