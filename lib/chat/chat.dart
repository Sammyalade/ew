import 'package:cloud_firestore/cloud_firestore.dart';

class ChatService {
  Stream<List<Map<String, dynamic>>> getMessages(String chatRoomId) {
    return FirebaseFirestore.instance
        .collection('chats')
        .doc(chatRoomId)
        .collection('messages')
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => doc.data()).toList());
  }

  Future<void> addMessage(
    String chatRoomId,
    String timestamp,
    String content, {
    required bool isSentByCurrentUser,
  }) async {
    await FirebaseFirestore.instance
        .collection('chats')
        .doc(chatRoomId)
        .collection('messages')
        .add({
      'timestamp': Timestamp.fromDate(DateTime.parse(timestamp)),
      'content': content,
      'isSentByCurrentUser': isSentByCurrentUser,
    });
  }
}
