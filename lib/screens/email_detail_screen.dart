import 'package:flutter/material.dart';

class EmailDetailScreen extends StatelessWidget {
  final int emailIndex;

  EmailDetailScreen({required this.emailIndex});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Email $emailIndex'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Email Subject $emailIndex',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('From: sender@example.com'),
            SizedBox(height: 8),
            Text('To: recipient@example.com'),
            SizedBox(height: 16),
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  'Email body for email $emailIndex...',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
