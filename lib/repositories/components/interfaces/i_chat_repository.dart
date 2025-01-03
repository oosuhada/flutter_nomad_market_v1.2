import '../../../core/entities/chat_message.dart';
import '../../../core/entities/chat_room.dart';

abstract class IChatRepository {
  Future<ChatRoom> createChatRoom(ChatRoom chatRoom);
  Future<ChatRoom?> getChatRoomById(String id);
  Future<List<ChatRoom>> getChatRoomsByUser(String userId);

  Future<ChatMessage> sendMessage(ChatMessage message);
  Future<List<ChatMessage>> getMessagesByChatRoom(String chatRoomId);
  Future<void> markMessagesAsRead(String chatRoomId, String userId);
}
