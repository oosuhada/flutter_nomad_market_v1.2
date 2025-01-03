// import 'package:flutter/material.dart';

// class ProductDetailView extends StatelessWidget {
//   final String title;
//   final double price;
//   final List<String> images;
//   final String description;
//   final String sellerName;
//   final Function() onChatPressed;
//   final Function() onPurchasePressed;

//   const ProductDetailView({
//     Key? key,
//     required this.title,
//     required this.price,
//     required this.images,
//     required this.description,
//     required this.sellerName,
//     required this.onChatPressed,
//     required this.onPurchasePressed,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return CustomScrollView(
//       slivers: [
//         // 이미지 슬라이더
//         SliverToBoxAdapter(
//           child: ImageSlider(images: images),
//         ),

//         // 상품 정보
//         SliverToBoxAdapter(
//           child: Padding(
//             padding: const EdgeInsets.all(16),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   title,
//                   style: const TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 const SizedBox(height: 8),
//                 Row(
//                   children: [
//                     CircleAvatar(
//                       child: Text(sellerName[0]),
//                     ),
//                     const SizedBox(width: 8),
//                     Text(sellerName),
//                   ],
//                 ),
//                 const SizedBox(height: 16),
//                 Text(
//                   '₩${price.toStringAsFixed(0)}',
//                   style: const TextStyle(
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 const SizedBox(height: 16),
//                 const Divider(),
//                 const SizedBox(height: 16),
//                 Text(description),
//               ],
//             ),
//           ),
//         ),
//       ],
//       // 하단 버튼
//       bottomNavigationBar: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(16),
//           child: Row(
//             children: [
//               Expanded(
//                 child: ElevatedButton(
//                   onPressed: onChatPressed,
//                   child: const Text('채팅하기'),
//                 ),
//               ),
//               const SizedBox(width: 16),
//               Expanded(
//                 child: ElevatedButton(
//                   onPressed: onPurchasePressed,
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.black,
//                   ),
//                   child: const Text('구매하기'),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// // 이미지 슬라이더 위젯
// class ImageSlider extends StatelessWidget {
//   final List<String> images;

//   const ImageSlider({
//     Key? key,
//     required this.images,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 300,
//       child: PageView.builder(
//         itemCount: images.length,
//         itemBuilder: (context, index) {
//           return Image.network(
//             images[index],
//             fit: BoxFit.cover,
//           );
//         },
//       ),
//     );
//   }
// }
