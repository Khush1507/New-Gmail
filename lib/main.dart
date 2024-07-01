import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'compose_screen.dart';
import 'firebase_options.dart'; // Ensure you have this file
import 'inbox_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gmail Clone',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: InboxScreen(),
      routes: {
        ComposeScreen.routeName: (context) => ComposeScreen(),
        InboxScreen.routeName: (context) => InboxScreen(),
      },
    );
  }
}
