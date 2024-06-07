import 'package:flutter/material.dart';
import 'email_detail_screen.dart';

class InboxScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20, // Example email count
      itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(
            child: Text('A'),
          ),
          title: Text('Email Subject $index'),
          subtitle: Text('Email preview text for email $index...'),
          trailing: Text('10:00 AM'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => EmailDetailScreen(emailIndex: index)),
            );
          },
        );
      },
    );
  }
}
