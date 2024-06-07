import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(GmailCloneApp());
}

class GmailCloneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gmail Clone',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: HomeScreen(),
    );
  }
}
