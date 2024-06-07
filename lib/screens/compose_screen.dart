import 'package:flutter/material.dart';

class ComposeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Compose Email'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'To',
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Subject',
              ),
            ),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Compose email',
                ),
                maxLines: null,
                expands: true,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Send email logic
        },
        child: Icon(Icons.send),
        backgroundColor: Colors.red,
      ),
    );
  }
}
