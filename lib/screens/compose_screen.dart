import 'package:flutter/material.dart';
import '../services/firestore_service.dart';

class ComposeScreen extends StatefulWidget {
  @override
  _ComposeScreenState createState() => _ComposeScreenState();
}

class _ComposeScreenState extends State<ComposeScreen> {
  final _subjectController = TextEditingController();
  final _contentController = TextEditingController();
  final FirestoreService _firestoreService = FirestoreService();

  void _sendEmail() {
    final subject = _subjectController.text;
    final content = _contentController.text;

    if (subject.isNotEmpty && content.isNotEmpty) {
      _firestoreService.addEmail(subject, content);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Compose'),
        actions: [
          IconButton(
            icon: Icon(Icons.send),
            onPressed: _sendEmail,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _subjectController,
              decoration: InputDecoration(labelText: 'Subject'),
            ),
            Expanded(
              child: TextField(
                controller: _contentController,
                decoration: InputDecoration(labelText: 'Content'),
                maxLines: null,
                expands: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
