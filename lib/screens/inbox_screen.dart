import 'package:flutter/material.dart';
import '../services/firestore_service.dart';
import 'email_detail_screen.dart';

class InboxScreen extends StatelessWidget {
  final FirestoreService _firestoreService = FirestoreService();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Email>>(
      stream: _firestoreService.getEmails(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }

        final emails = snapshot.data!;
        return ListView.builder(
          itemCount: emails.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: CircleAvatar(
                child: Text(emails[index].subject[0]),
              ),
              title: Text(emails[index].subject),
              subtitle: Text(emails[index].content),
              trailing: Text(emails[index].timestamp.toString()),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        EmailDetailScreen(email: emails[index]),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
