import 'package:cloud_firestore/cloud_firestore.dart';

class ChatService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> createChatRoom(String chatRoomId, String name) async {
    CollectionReference chats = _db.collection('chats');
    await chats.doc(chatRoomId).set({
      'createdAt': Timestamp.now(),
      'name': name,
    });
  }

  Future<void> addMessage(String chatRoomId, String messageId, String messageContent) async {
    CollectionReference messages = _db.collection('chats').doc(chatRoomId).collection('messages');
    await messages.doc(messageId).set({
      'content': messageContent,
      'timestamp': Timestamp.now(),
    });
  }

  Stream<List<Map<String, dynamic>>> getMessages(String chatRoomId) {
    CollectionReference messages = _db.collection('chats').doc(chatRoomId).collection('messages');
    return messages.orderBy('timestamp').snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList());
  }
}
