import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../core/entities/chat_message.dart';
import '../../../core/entities/chat_room.dart';

class ChatRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<ChatRoom> createChatRoom(ChatRoom chatRoom) async {
    final docRef =
        await _firestore.collection('chat_rooms').add(chatRoom.toJson());
    return chatRoom.copyWith(id: docRef.id);
  }

  Future<ChatMessage> sendMessage(ChatMessage message) async {
    final docRef =
        await _firestore.collection('chat_messages').add(message.toJson());
    return message.copyWith(id: docRef.id);
  }

  Future<List<ChatMessage>> getMessagesByRoom(String roomId) async {
    final querySnapshot = await _firestore
        .collection('chat_messages')
        .where('room_id', isEqualTo: roomId)
        .orderBy('created_at')
        .get();
    return querySnapshot.docs
        .map((doc) => ChatMessage.fromJson(doc.data()))
        .toList();
  }

  Future<List<ChatRoom>> getChatRoomsByUser(String userId) async {
    final querySnapshot = await _firestore
        .collection('chat_rooms')
        .where('participants', arrayContains: userId)
        .get();
    return querySnapshot.docs
        .map((doc) => ChatRoom.fromJson(doc.data()))
        .toList();
  }

  Future<void> markMessagesAsRead(String roomId, String userId) async {
    final batch = _firestore.batch();
    final querySnapshot = await _firestore
        .collection('chat_messages')
        .where('room_id', isEqualTo: roomId)
        .where('is_read', isEqualTo: false)
        .where('sender_id', isNotEqualTo: userId)
        .get();

    for (var doc in querySnapshot.docs) {
      batch.update(doc.reference, {'is_read': true});
    }

    await batch.commit();
  }
}
