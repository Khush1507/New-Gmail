import 'package:flutter/material.dart';
import 'inbox_screen.dart';
import 'compose_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gmail Clone'),
      ),
      body: InboxScreen(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, ComposeScreen.routeName);
        },
        child: Icon(Icons.create),
      ),
    );
  }
}
