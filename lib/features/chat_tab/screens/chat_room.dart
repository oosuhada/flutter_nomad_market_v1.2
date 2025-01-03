// import 'package:flutter/material.dart';
// import 'package:nomadmarket/models/components/entities/chat_message.dart';

// class ChatRoom extends StatelessWidget {
//   final String recipientName;
//   final List<ChatMessage> messages;
//   final Function(String) onSendMessage;
//   final TextEditingController messageController = TextEditingController();

//   ChatRoom({
//     Key? key,
//     required this.recipientName,
//     required this.messages,
//     required this.onSendMessage,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         // 채팅 메시지 목록
//         Expanded(
//           child: ListView.builder(
//             reverse: true,
//             itemCount: messages.length,
//             itemBuilder: (context, index) {
//               final message = messages[index];
//               return ChatBubble(
//                 message: message.text,
//                 isMe: message.isMe,
//                 timestamp: message.timestamp,
//               );
//             },
//           ),
//         ),
//         // 메시지 입력
//         Container(
//           padding: const EdgeInsets.all(8),
//           decoration: BoxDecoration(
//             color: Colors.white,
//             border: Border(
//               top: BorderSide(
//                 color: Colors.grey[300]!,
//               ),
//             ),
//           ),
//           child: Row(
//             children: [
//               IconButton(
//                 icon: const Icon(Icons.add_photo_alternate),
//                 onPressed: () {
//                   // 이미지 첨부 기능
//                 },
//               ),
//               Expanded(
//                 child: TextField(
//                   controller: messageController,
//                   decoration: const InputDecoration(
//                     hintText: '메시지를 입력하세요',
//                     border: InputBorder.none,
//                   ),
//                 ),
//               ),
//               IconButton(
//                 icon: const Icon(Icons.send),
//                 onPressed: () {
//                   if (messageController.text.isNotEmpty) {
//                     onSendMessage(messageController.text);
//                     messageController.clear();
//                   }
//                 },
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }

// // 채팅 버블 위젯
// class ChatBubble extends StatelessWidget {
//   final String message;
//   final bool isMe;
//   final DateTime timestamp;

//   const ChatBubble({
//     Key? key,
//     required this.message,
//     required this.isMe,
//     required this.timestamp,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Align(
//       alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
//       child: Container(
//         margin: const EdgeInsets.symmetric(
//           horizontal: 8,
//           vertical: 4,
//         ),
//         padding: const EdgeInsets.symmetric(
//           horizontal: 12,
//           vertical: 8,
//         ),
//         decoration: BoxDecoration(
//           color: isMe ? Colors.blue[100] : Colors.grey[300],
//           borderRadius: BorderRadius.circular(12),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(message),
//             Text(
//               DateFormat('HH:mm').format(timestamp),
//               style: TextStyle(
//                 fontSize: 12,
//                 color: Colors.grey[600],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
