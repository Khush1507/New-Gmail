import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Add a new email to Firestore
  Future<void> addEmail(String subject, String content) {
    return _db.collection('emails').add({
      'subject': subject,
      'content': content,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }

  // Get all emails from Firestore
  Stream<List<Email>> getEmails() {
    return _db.collection('emails').orderBy('timestamp').snapshots().map(
      (snapshot) {
        return snapshot.docs.map((doc) {
          return Email.fromFirestore(doc);
        }).toList();
      },
    );
  }
}

class Email {
  final String subject;
  final String content;
  final DateTime timestamp;

  Email(
      {required this.subject, required this.content, required this.timestamp});

  factory Email.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map;
    return Email(
      subject: data['subject'] ?? '',
      content: data['content'] ?? '',
      timestamp: (data['timestamp'] as Timestamp).toDate(),
    );
  }
}
