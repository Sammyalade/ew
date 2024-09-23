import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import '../services/chat_service.dart';

class ChatPage extends StatefulWidget {
  final String patientId;
  final String doctorId;

  ChatPage({required this.patientId, required this.doctorId});

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  late ChatService _chatService;
  late Future<String> _chatRoomId;
  late Future<types.User> _currentUser;

  @override
  void initState() {
    super.initState();
    _chatService = ChatService(); // Initialize the ChatService
    _chatRoomId = _chatService.createOrGetChatRoom(widget.patientId, widget.doctorId); // Get or create chat room
    _currentUser = _chatService.getCurrentUser(); // Fetch current user
  }

  // Send a new message
  void _handleSendPressed(types.PartialText message, String chatRoomId) async {
    await _chatService.sendMessage(chatRoomId, message.text); // Use chatRoomId to send message
  }

  void _handleAttachmentPressed(BuildContext context, String chatRoomId) {
    _chatService.handleAttachmentPressed(context, chatRoomId);
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Chat")),
      body: FutureBuilder<String>(
        future: _chatRoomId,
        builder: (context, roomSnapshot) {
          if (roomSnapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!roomSnapshot.hasData) {
            return const Center(child: Text("Error loading chat room"));
          }

          final chatRoomId = roomSnapshot.data!;

          return FutureBuilder<types.User>(
            future: _currentUser,
            builder: (context, userSnapshot) {
              if (userSnapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }

              if (!userSnapshot.hasData) {
                return Center(child: Text("Error loading user"));
              }

              final currentUser = userSnapshot.data!;

              return StreamBuilder<List<types.Message>>(
                stream: _chatService.getMessages(chatRoomId),
                builder: (context, messageSnapshot) {
                  if (!messageSnapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  return Chat(
                    messages: messageSnapshot.data!,
                    onSendPressed: (message) => _handleSendPressed(message, chatRoomId),
                    onAttachmentPressed: () => _handleAttachmentPressed(context, chatRoomId),
                    user: currentUser,
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
