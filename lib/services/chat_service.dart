import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:mime/mime.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';

class ChatService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<types.User> getCurrentUser() async {
    final user = _auth.currentUser;

    if (user == null) {
      throw Exception("User not logged in");
    }

    return types.User(
      id: user.uid,
      firstName: user.displayName ?? 'Anonymous',
      imageUrl: user.photoURL ?? '',
    );
  }

  Future<void> sendMessage(String chatRoomId, String text) async {
    final user = await getCurrentUser();
    final messageId = const Uuid().v4();

    final message = types.TextMessage(
      id: messageId,
      author: user,
      text: text,
      createdAt: DateTime.now().millisecondsSinceEpoch,
    );

    await _firestore.collection('chats/$chatRoomId/messages').add({
      'id': message.id,
      'authorId': message.author.id,
      'text': message.text,
      'createdAt': message.createdAt,
    });
  }

  Stream<List<types.Message>> getMessages(String chatRoomId) {
    return _firestore
        .collection('chats/$chatRoomId/messages')
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        final data = doc.data();

        if (data.containsKey('text')) {
          return types.TextMessage(
            id: data['id'],
            author: types.User(id: data['authorId']),
            text: data['text'],
            createdAt: data['createdAt'],
          );
        } else if (data.containsKey('imageUrl')) {
          return types.ImageMessage(
            id: data['id'],
            author: types.User(id: data['authorId']),
            uri: data['imageUrl'],
            height: data['imageHeight'].toDouble(),
            width: data['imageWidth'].toDouble(),
            createdAt: data['createdAt'],
            name: data['name'],
            size: data['size'],
          );
        } else {
          return types.FileMessage(
            id: data['id'],
            author: types.User(id: data['authorId']),
            name: data['name'],
            size: data['size'],
            uri: data['uri'],
            createdAt: data['createdAt'],
            mimeType: data['mimeType']
          );
        }
      }).toList();
    });
  }

  Future<String?> findChatRoom(String patientId, String doctorId) async {
    final query = await _firestore
        .collection('chats')
        .where('participants', arrayContains: patientId)
        .get();

    for (var doc in query.docs) {
      List<dynamic> participants = doc['participants'];
      if (participants.contains(patientId) && participants.contains(doctorId)) {
        return doc.id;
      }
    }
    return null;
  }

  Future<String> createOrGetChatRoom(String patientId, String doctorId) async {
    final existingRoomId = await findChatRoom(patientId, doctorId);

    if (existingRoomId != null) {
      return existingRoomId;
    }

    final newChatRoom = await _firestore.collection('chats').add({
      'participants': [patientId, doctorId],
      'createdAt': DateTime.now(),
    });

    return newChatRoom.id;
  }

  void handleAttachmentPressed(BuildContext context, String chatRoomId) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) => SafeArea(
        child: SizedBox(
          height: 144,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  _handleImageSelection(context, chatRoomId);
                },
                child: const Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text('Photo'),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  _handleFileSelection(context, chatRoomId);
                },
                child: const Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text('File'),
                ),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text('Cancel'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleFileSelection(BuildContext context, String chatRoomId) async {
    final result = await FilePicker.platform.pickFiles(type: FileType.any);
    final user = await getCurrentUser();

    if (result != null && result.files.single.path != null) {
      final message = types.FileMessage(
        author: user,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        id: const Uuid().v4(),
        mimeType: lookupMimeType(result.files.single.path!),
        name: result.files.single.name,
        size: result.files.single.size,
        uri: result.files.single.path!,

      );

      await addMessage(message, chatRoomId);
    }
  }

  Future<void> addMessage(types.FileMessage message, String chatRoomId) async {
    await _firestore.collection('chats/$chatRoomId/messages').add({
      'id': message.id,
      'authorId': message.author.id,
      'fileName': message.name,
      'fileSize': message.size,
      'fileUri': message.uri,
      'createdAt': message.createdAt,
    });
  }

  void _handleImageSelection(BuildContext context, String chatRoomId) async {
    final result = await ImagePicker().pickImage(
      imageQuality: 70,
      maxWidth: 1440,
      source: ImageSource.gallery,
    );
    final user = await getCurrentUser();

    if (result != null) {
      final bytes = await result.readAsBytes();
      final image = await decodeImageFromList(bytes);

      final message = types.ImageMessage(
        author: user,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        height: image.height.toDouble(),
        id: const Uuid().v4(),
        name: result.name,
        size: bytes.length,
        uri: result.path,
        width: image.width.toDouble(),
      );

      await sendImageMessage(message, chatRoomId);
    }
  }

  Future<void> sendImageMessage(types.ImageMessage message, String chatRoomId) async {
    await _firestore.collection('chats/$chatRoomId/messages').add({
      'id': message.id,
      'authorId': message.author.id,
      'imageUrl': message.uri,
      'createdAt': message.createdAt,
      'imageHeight': message.height,
      'imageWidth': message.width,
      'name': message.name,
      'size': message.size
    });
  }
}
