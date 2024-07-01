import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ComposeScreen extends StatelessWidget {
  static const routeName = '/compose';

  final TextEditingController toController = TextEditingController();
  final TextEditingController subjectController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();

  void sendEmail(BuildContext context) {
    print("Sending email...");
    print("To: ${toController.text}");
    print("Subject: ${subjectController.text}");
    print("Body: ${bodyController.text}");

    FirebaseFirestore.instance.collection('emails').add({
      'to': toController.text,
      'subject': subjectController.text,
      'body': bodyController.text,
      'timestamp': FieldValue.serverTimestamp(),
    }).then((value) {
      print("Email Sent");
      Navigator.pop(context);
    }).catchError((error) {
      print("Failed to send email: $error");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Compose Email'),
        actions: [
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () => sendEmail(context),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: toController,
              decoration: InputDecoration(labelText: 'To'),
            ),
            TextField(
              controller: subjectController,
              decoration: InputDecoration(labelText: 'Subject'),
            ),
            TextField(
              controller: bodyController,
              decoration:
                  InputDecoration(labelText: 'Body', alignLabelWithHint: true),
              maxLines: 8,
            ),
          ],
        ),
      ),
    );
  }
}
