import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EmailDetailedScreen extends StatelessWidget {
  final DocumentSnapshot email;

  EmailDetailedScreen({required this.email});

  @override
  Widget build(BuildContext context) {
    var emailData = email.data() as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(
        title: Text(emailData['subject']),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('To: ${emailData['to']}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text('Subject: ${emailData['subject']}',
                style: TextStyle(fontSize: 16)),
            SizedBox(height: 16),
            Text(emailData['body'], style: TextStyle(fontSize: 14)),
          ],
        ),
      ),
    );
  }
}
