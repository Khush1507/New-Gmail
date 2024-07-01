import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'email_detailed_screen.dart';
import 'compose_screen.dart';

class InboxScreen extends StatelessWidget {
  static const routeName = '/inbox';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inbox'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('emails')
            .orderBy('timestamp', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          final emails = snapshot.data!.docs;

          return ListView.builder(
            itemCount: emails.length,
            itemBuilder: (context, index) {
              var email = emails[index];
              var emailData = email.data() as Map<String, dynamic>;

              // Check if the required fields exist
              if (!emailData.containsKey('to') ||
                  !emailData.containsKey('subject') ||
                  !emailData.containsKey('body')) {
                return ListTile(
                  title: Text('Invalid email data'),
                  subtitle: Text('Missing fields in the document.'),
                );
              }

              return ListTile(
                title: Text(emailData['subject']),
                subtitle: Text(emailData['to']),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EmailDetailedScreen(email: email),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, ComposeScreen.routeName);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
