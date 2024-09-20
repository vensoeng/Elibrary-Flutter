// import 'package:Elibrary/layouts/texstyle.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// class BookCard extends StatelessWidget {
//   final String imageUrl;
//   final String title;

//   const BookCard({required this.imageUrl, required this.title});

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         // Navigator.push(context,
//         //     MaterialPageRoute(builder: (context) => const Bookdetail()));
//       },
//       child: Container(
//         constraints: const BoxConstraints(
//           maxWidth: double.infinity,
//         ),
//         margin: const EdgeInsets.all(0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Expanded(
//               child: ClipRRect(
//                 borderRadius: const BorderRadius.all(Radius.circular(10)),
//                 child: ConstrainedBox(
//                   constraints: const BoxConstraints(
//                     minHeight: 150,
//                     maxHeight: 150,
//                   ),
//                   child: Image.network(
//                     imageUrl,
//                     fit: BoxFit.cover,
//                     width: double.infinity,
//                     height: 150,
//                   ),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Expanded(
//                     child: Container(
//                       margin: const EdgeInsets.only(right: 5),
//                       constraints: const BoxConstraints(
//                         maxWidth: 150,
//                       ),
//                       child: Text(
//                         title,
//                         style: simple_style_text(),
//                         maxLines: 1,
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                     ),
//                   ),
//                   Row(
//                     children: [
//                       Container(
//                         margin: const EdgeInsets.only(right: 2),
//                         child: const FaIcon(
//                           FontAwesomeIcons.solidStar,
//                           size: 11,
//                           color: Color.fromARGB(255, 252, 252, 252),
//                         ),
//                       ),
//                       Text(
//                         '៥.៥',
//                         style: simple_style_text(),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
