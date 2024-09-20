// import 'package:flutter/material.dart';
// import 'package:Elibrary/components/homebody.dart';
// import 'package:Elibrary/layouts/featuredbook.dart';
// import 'package:Elibrary/layouts/mybookcard.dart';
// import 'package:Elibrary/model/book.dart';
// import 'package:Elibrary/service/Api_handle.dart';
// import 'package:iconsax_flutter/iconsax_flutter.dart';
// import 'package:khmer_fonts/khmer_fonts.dart';
// import 'package:Elibrary/components/homebody.dart';
// import 'package:Elibrary/components/search.dart';
// import 'package:Elibrary/components/search_showitem.dart';
// import 'package:flutter/material.dart';
// import 'package:iconsax_flutter/iconsax_flutter.dart';
// import 'package:khmer_fonts/khmer_fonts.dart';

// Container button() {
//   return Container(
//     margin: const EdgeInsets.only(left: 15),
//     decoration: BoxDecoration(
//       border: Border.all(
//         color: const Color.fromRGBO(192, 192, 193, 1),
//       ),
//       borderRadius: BorderRadius.circular(50),
//     ),
//     width: 80.0,
//     height: 35.0,
//     child: const Center(
//       child: Text(
//         'មើលបន្ថែម',
//         style: TextStyle(
//           fontFamily: KhmerFonts.battambang,
//           fontSize: 12,
//           fontWeight: FontWeight.w800,
//           color: Color.fromRGBO(192, 192, 193, 1),
//           package: 'khmer_fonts',
//         ),
//       ),
//     ),
//   );
// }

// import 'package:copy/layouts/appbar.dart';
// import 'package:copy/layouts/aside.dart';
// import 'package:copy/layouts/book_card.dart';
// import 'package:copy/layouts/featuredbook.dart';
// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Khmer library',
//       home: Scaffold(
//         backgroundColor: const Color.fromRGBO(15, 15, 15, 1),
//         appBar: myappbar(),
//         drawer: const Aside(),
//         body: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 FeaturedBook(),
//                 const SizedBox(height: 16.0),
//                 GridView.builder(
//                   shrinkWrap: true,
//                   physics: const NeverScrollableScrollPhysics(),
//                   gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
//                     maxCrossAxisExtent: 300, // Similar to minmax(300px, 1fr)
//                     crossAxisSpacing: 10.0, // Similar to gap
//                     mainAxisSpacing: 10.0, // Similar to gap
//                     childAspectRatio: 0.7,
//                   ),
//                   itemCount: 8, // For demonstration, adjust as needed
//                   itemBuilder: (context, index) {
//                     return const BookCard(
//                       imageUrl:
//                           'https://letsenhance.io/static/8f5e523ee6b2479e26ecc91b9c25261e/1015f/MainAfter.jpg', // Replace with actual image URLs
//                       title: 'អំណានជាអំណាច',
//                     );
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:Elibrary/components/homebody.dart';
// import 'package:Elibrary/layouts/featuredbook.dart';
// import 'package:Elibrary/layouts/mybookcard.dart';
// import 'package:Elibrary/model/book.dart';
// import 'package:Elibrary/service/Api_handle.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// class MySearch extends StatefulWidget {
//   final String getText;
//   const MySearch({Key? key, this.getText = ''});
//   @override
//   State<MySearch> createState() => _MySearchState();
// }

// class _MySearchState extends State<MySearch> {
//   List<BookModel> bookItems = [];
//   List<BookModel> bookPupolars = [];
//   late TextEditingController searchController;
//   late String text;
//   final link = Link();
//   @override
//   void initState() {
//     super.initState();
//     getBookData();
//     searchController = TextEditingController(text: widget.getText);
//   }

//   @override
//   void dispose() {
//     searchController.dispose();
//     super.dispose();
//   }

//   void getBookData() async {
//     if (widget.getText == "") {
//       ApiHandle apiHandle = ApiHandle();
//       List<BookModel> fetchBookItem = await apiHandle.fetchBookItems();
//       setState(() {
//         bookItems = fetchBookItem;
//         bookPupolars = bookItems.where((item) => item.popular == 1).toList();
//       });
//     } else {
//       ApiHandleSearch apiHandle = ApiHandleSearch(text: widget.getText);
//       List<BookModel> fetchBookItem = await apiHandle.fetchSearch();
//       setState(() {
//         bookItems = fetchBookItem;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           toolbarHeight: 0,
//           backgroundColor: Colors.transparent,
//         ),
//         backgroundColor: Color.fromARGB(255, 238, 233, 233),
//         body: Container(
//             margin: const EdgeInsets.all(0),
//             height: double.infinity,
//             child: Stack(
//               children: [
//                 // Header Section
//                 Expanded(
//                   child: SingleChildScrollView(
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           const SizedBox(
//                             height: 160,
//                           ),
//                           MyFedtureBook(
//                               mainText: '📙នេះជាសៀវភៅដែលសំណើរសម្រាប់អ្នក'),
//                           const SizedBox(height: 16.0),
//                           GridView.builder(
//                             shrinkWrap: true,
//                             physics: const NeverScrollableScrollPhysics(),
//                             gridDelegate:
//                                 const SliverGridDelegateWithMaxCrossAxisExtent(
//                               maxCrossAxisExtent: 300,
//                               crossAxisSpacing: 10.0,
//                               mainAxisSpacing: 10.0,
//                               childAspectRatio: 0.7,
//                             ),
//                             itemCount: bookItems.length > 0
//                                 ? bookItems.length
//                                 : bookPupolars.length,
//                             itemBuilder: (context, index) {
//                               return bookItems.length > 0
//                                   ? MyBookCard(
//                                       title: bookItems[index].title,
//                                       star: bookItems[index].star,
//                                       imageUrl: Link.apiUrl(
//                                           'storage/images/${bookItems[index].img}'),
//                                       bookID: bookItems[index],
//                                     )
//                                   : MyBookCard(
//                                       title: bookPupolars[index].title,
//                                       star: bookPupolars[index].star,
//                                       imageUrl: Link.apiUrl(
//                                           'storage/images/${bookPupolars[index].img}'),
//                                       bookID: bookPupolars[index]);
//                             },
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   top: 0,
//                   left: 0,
//                   right: 0,
//                   child: Container(
//                     width: double.infinity,
//                     height: 160,
//                     decoration: const BoxDecoration(
//                         borderRadius: BorderRadius.only(
//                           bottomLeft: Radius.circular(30),
//                           bottomRight: Radius.circular(30),
//                         ),
//                         gradient: LinearGradient(
//                           begin: Alignment.topRight,
//                           end: Alignment.bottomLeft,
//                           colors: [
//                             Color.fromARGB(255, 37, 25, 8),
//                             Color.fromRGBO(16, 22, 29, 1),
//                           ],
//                         )),
//                     child: Column(
//                       children: [
//                         // Row for back button and profile image
//                         Padding(
//                           padding: const EdgeInsets.symmetric(
//                             horizontal: 16,
//                             vertical: 8,
//                           ),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               Container(
//                                 width: 38,
//                                 height: 38,
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(50),
//                                 ),
//                                 child: IconButton(
//                                   icon: const Icon(
//                                     FontAwesomeIcons.chevronLeft,
//                                     size: 17,
//                                     color: Color.fromRGBO(192, 192, 193, 1),
//                                   ),
//                                   onPressed: () {
//                                     Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                         builder: (context) => const Mybody(),
//                                       ),
//                                     );
//                                   },
//                                 ),
//                               ),
//                               Container(
//                                 width: 38,
//                                 height: 38,
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(50),
//                                   color: Colors.amber,
//                                 ),
//                                 child: const CircleAvatar(
//                                   radius: 20,
//                                   backgroundImage: AssetImage(
//                                     'asset/images/admin_profile.jpg',
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         // Search Bar Section
//                         Container(
//                           height: 45,
//                           margin: const EdgeInsets.symmetric(horizontal: 16),
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(50),
//                             border: Border.all(
//                               color: Color.fromRGBO(192, 192, 193, 1),
//                               width: 2,
//                             ),
//                           ),
//                           child: Row(
//                             children: [
//                               Container(
//                                 width: 38,
//                                 height: 38,
//                                 margin: const EdgeInsets.only(left: 1),
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(50),
//                                 ),
//                                 child: IconButton(
//                                   icon: const Icon(
//                                     FontAwesomeIcons.search,
//                                     size: 17,
//                                   ),
//                                   color: const Color.fromRGBO(192, 192, 193, 1),
//                                   onPressed: () {
//                                     Navigator.pushReplacement(
//                                       context,
//                                       MaterialPageRoute(
//                                         builder: (context) => MySearch(
//                                           getText: text,
//                                         ),
//                                       ),
//                                     );
//                                   },
//                                 ),
//                               ),
//                               const SizedBox(width: 8),
//                               Expanded(
//                                 child: Container(
//                                   margin: const EdgeInsets.only(
//                                       right: 10, bottom: 5),
//                                   child: TextField(
//                                     style: const TextStyle(color: Colors.white),
//                                     controller: searchController,
//                                     decoration: const InputDecoration(
//                                       border: InputBorder.none,
//                                       hintText: 'Search books...',
//                                       hintStyle: TextStyle(
//                                           color:
//                                               Color.fromRGBO(192, 192, 193, 1)),
//                                     ),
//                                     onSubmitted: (value) {
//                                       Navigator.pushReplacement(
//                                         context,
//                                         MaterialPageRoute(
//                                           builder: (context) => MySearch(
//                                             getText: value,
//                                           ),
//                                         ),
//                                       );
//                                     },
//                                     onChanged: (value) {
//                                       text = value;
//                                     },
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             )));
//   }
// }


// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: SearchScreen(),
//     );
//   }
// }

// class SearchScreen extends StatefulWidget {
//   @override
//   _SearchScreenState createState() => _SearchScreenState();
// }

// class _SearchScreenState extends State<SearchScreen> {
//   final TextEditingController _controller = TextEditingController();
//   final List<String> _recentSearches = [
//     'paparazzi',
//     'jukma',
//     'creatine ជាតិ',
//     'mach Davy',
//     'creatine khmer',
//     'VenSoeng',
//     'Gojo eyes',
//     'ksos video',
//     'tvb',
//     'fyp',
//     'ala ala',
//     'alaala',
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Search'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: _controller,
//               decoration: InputDecoration(
//                 prefixIcon: Icon(Icons.search),
//                 hintText: 'Search',
//               ),
//             ),
//             SizedBox(height: 16.0),
//             Expanded(
//               child: ListView(
//                 children: [
//                   ..._recentSearches.map((search) {
//                     return ListTile(
//                       leading: Icon(Icons.history),
//                       title: Text(search),
//                       trailing: IconButton(
//                         icon: Icon(Icons.clear),
//                         onPressed: () {
//                           setState(() {
//                             _recentSearches.remove(search);
//                           });
//                         },
//                       ),
//                     );
//                   }).toList(),
//                   ListTile(
//                     title: Text('You may like'),
//                   ),
//                   ListTile(
//                     title: Text('creatine ជាតិ'),
//                     trailing: Text('Searched'),
//                   ),
//                   ListTile(
//                     title: Text('พยายามที่สุดแล้ว - เชน มะยม'),
//                   ),
//                   ListTile(
//                     title: Text('넌 참 좋은 사람이었어 - Kassy'),
//                   ),
//                   ListTile(
//                     title: Text('Baby Mama - VannDa'),
//                   ),
//                   ListTile(
//                     title: Text('paparazzi trend'),
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

// class MySearch extends StatefulWidget {
//   final String getText;
//   const MySearch({Key? key, this.getText = ''});
//   @override
//   State<MySearch> createState() => _MySearchState();
// }

// class _MySearchState extends State<MySearch> {
//   List<BookModel> bookItems = [];
//   List<BookModel> bookPupolars = [];
//   late TextEditingController searchController;
//   late String text;
//   final link = Link();
//   @override
//   void initState() {
//     super.initState();
//     getBookData();
//     searchController = TextEditingController(text: widget.getText);
//   }

//   @override
//   void dispose() {
//     searchController.dispose();
//     super.dispose();
//   }

//   void getBookData() async {
//     if (widget.getText == "") {
//       ApiHandle apiHandle = ApiHandle();
//       List<BookModel> fetchBookItem = await apiHandle.fetchBookItems();
//       setState(() {
//         bookItems = fetchBookItem;
//         bookPupolars = bookItems.where((item) => item.popular == 1).toList();
//       });
//     } else {
//       ApiHandleSearch apiHandle = ApiHandleSearch(text: widget.getText);
//       List<BookModel> fetchBookItem = await apiHandle.fetchSearch();
//       setState(() {
//         bookItems = fetchBookItem;
//       });
//     }
//   }

//   bool _buttonIshover = false;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color.fromARGB(255, 238, 233, 233),
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         toolbarHeight: 50,
//         scrolledUnderElevation: 0,
//         backgroundColor: Colors.white,
//         titleSpacing: 0,
//         title: Container(
//           margin: const EdgeInsets.symmetric(horizontal: 10),
//           child: Row(
//             children: [
//               IconButton(
//                 iconSize: 22,
//                 color: Color.fromARGB(255, 95, 95, 99),
//                 icon: const Icon(Iconsax.arrow_left_copy),
//                 onPressed: () {
//                   Navigator.pushReplacement(
//                     context,
//                     PageRouteBuilder(
//                       transitionDuration: Duration.zero,
//                       pageBuilder: (_, __, ___) => Mybody(),
//                     ),
//                   );
//                 },
//               ),
//               Expanded(
//                 child: Container(
//                   height: 35,
//                   margin: const EdgeInsets.only(left: 5),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(8),
//                     color: Color.fromRGBO(242, 242, 242, 1),
//                   ),
//                   child: Row(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       IconButton(
//                         padding: EdgeInsets.zero,
//                         icon: const Icon(
//                           Iconsax.search_normal_1_copy,
//                           size: 17,
//                         ),
//                         color: const Color.fromRGBO(192, 192, 193, 1),
//                         onPressed: () {
//                           Navigator.pushReplacement(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => MySearch(
//                                 getText: text,
//                               ),
//                             ),
//                           );
//                         },
//                       ),
//                       Expanded(
//                         child: TextField(
//                           cursorColor: Colors.black54,
//                           style: const TextStyle(
//                             color: Colors.black87,
//                             fontFamily: KhmerFonts.battambang,
//                             fontSize: 13,
//                             fontWeight: FontWeight.w500,
//                             package: "khmer_fonts",
//                           ),
//                           controller: searchController,
//                           decoration: const InputDecoration(
//                             border: InputBorder.none,
//                             hintText: 'ស្វែងរកសៀវភៅ..',
//                             hintStyle: TextStyle(
//                               height: 1,
//                               color: Color.fromRGBO(192, 192, 193, 1),
//                             ),
//                             isDense: true,
//                             contentPadding: EdgeInsets.symmetric(
//                               vertical: 8,
//                             ),
//                           ),
//                           onSubmitted: (value) {
//                             Navigator.pushReplacement(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => MySearch(
//                                   getText: value,
//                                 ),
//                               ),
//                             );
//                           },
//                           onChanged: (value) {
//                             text = value;
//                           },
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               TextButton(
//                 onPressed: () {
//                   //
//                 },
//                 child: Text(
//                   'ស្វែងរក',
//                   style: TextStyle(
//                     fontSize: 13,
//                     fontFamily: KhmerFonts.battambang,
//                     package: "khmer_fonts",
//                     fontWeight: FontWeight.w600,
//                     color: Color.fromRGBO(245, 203, 57, 1),
//                   ),
//                 ),
//                 style: ButtonStyle(
//                   overlayColor: WidgetStateProperty.all(Colors.transparent),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               //history search
//               ListView.builder(
//                   shrinkWrap: true,
//                   physics: const NeverScrollableScrollPhysics(),
//                   itemCount: 5,
//                   itemBuilder: (etx, ind) {
//                     return ListTile(
//                       contentPadding: EdgeInsets.only(left: 8, right: 8),
//                       title: InkWell(
//                         onTap: () {
//                           //
//                         },
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             Container(
//                               margin: const EdgeInsets.only(left: 8, right: 8),
//                               child: Icon(
//                                 Icons.history,
//                                 size: 25,
//                                 color: Colors.black54,
//                               ),
//                             ),
//                             Container(
//                               child: Text(
//                                 'ដំណើរស្វែងរកខ្លួនឯង',
//                                 style: TextStyle(
//                                   fontFamily: KhmerFonts.battambang,
//                                   fontWeight: FontWeight.w500,
//                                   package: "khmer_fonts",
//                                   fontSize: 14,
//                                   height: 2.5,
//                                 ),
//                               ),
//                             )
//                           ],
//                         ),
//                       ),
//                       trailing: IconButton(
//                         icon: Icon(
//                           Icons.close,
//                           size: 19,
//                         ),
//                         onPressed: () {
//                           setState(() {
//                             //
//                           });
//                         },
//                       ),
//                     );
//                   }),
//               //clear all item history
//               Container(
//                 child: Center(
//                   child: MouseRegion(
//                     onEnter: (_) => setState(() => _buttonIshover = true),
//                     onExit: (_) => setState(() => _buttonIshover = false),
//                     child: TextButton(
//                       onPressed: () {},
//                       child: Text(
//                         'សំអាតទាំងអស់',
//                         style: TextStyle(
//                           fontFamily: KhmerFonts.battambang,
//                           fontWeight: FontWeight.w500,
//                           package: "khmer_fonts",
//                           fontSize: 13,
//                           color:
//                               _buttonIshover ? Colors.red[200] : Colors.black45,
//                         ),
//                       ),
//                       style: ButtonStyle(
//                         overlayColor:
//                             WidgetStateProperty.all(Colors.transparent),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               // this is suggestion
//               Container(
//                 margin: const EdgeInsets.only(
//                   left: 10,
//                   bottom: 5,
//                   top: 20,
//                 ),
//                 child: Text(
//                   'អ្នកប្រហែលជាចូលចិត្ត',
//                   style: TextStyle(
//                     fontFamily: KhmerFonts.battambang,
//                     fontWeight: FontWeight.w600,
//                     package: "khmer_fonts",
//                     fontSize: 14,
//                   ),
//                 ),
//               ),
//               ListView.builder(
//                   shrinkWrap: true,
//                   physics: const NeverScrollableScrollPhysics(),
//                   itemCount: bookPupolars.length > 6 ? 6 : bookPupolars.length,
//                   itemBuilder: (etx, ind) {
//                     return ListTile(
//                       contentPadding: EdgeInsets.only(left: 0, right: 8),
//                       title: InkWell(
//                         onTap: () {
//                           //
//                         },
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             Container(
//                               margin: const EdgeInsets.only(left: 8, right: 10),
//                               child: Icon(
//                                 Icons.circle,
//                                 size: 10,
//                                 color: const Color.fromARGB(255, 255, 191, 118),
//                               ),
//                             ),
//                             Container(
//                               child: Text(
//                                 bookPupolars[ind].title,
//                                 style: TextStyle(
//                                   fontFamily: KhmerFonts.battambang,
//                                   fontWeight: FontWeight.w500,
//                                   package: "khmer_fonts",
//                                   fontSize: 14,
//                                   height: 2.5,
//                                 ),
//                               ),
//                             )
//                           ],
//                         ),
//                       ),
//                     );
//                   }),
//               MyFedtureBook(mainText: '📙នេះជាសៀវភៅដែលសំណើរសម្រាប់អ្នក'),
//               const SizedBox(height: 16.0),
//               GridView.builder(
//                 shrinkWrap: true,
//                 physics: const NeverScrollableScrollPhysics(),
//                 gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
//                   maxCrossAxisExtent: 300,
//                   crossAxisSpacing: 10.0,
//                   mainAxisSpacing: 10.0,
//                   childAspectRatio: 0.7,
//                 ),
//                 itemCount: bookPupolars.length < 0
//                     ? bookItems.length
//                     : bookPupolars.length,
//                 itemBuilder: (context, index) {
//                   return bookPupolars.length < 0
//                       ? MyBookCard(
//                           title: bookItems[index].title,
//                           star: bookItems[index].star,
//                           imageUrl: Link.apiUrl(
//                               'storage/images/${bookItems[index].img}'),
//                           bookID: bookItems[index],
//                         )
//                       : MyBookCard(
//                           title: bookPupolars[index].title,
//                           star: bookPupolars[index].star,
//                           imageUrl: Link.apiUrl(
//                               'storage/images/${bookPupolars[index].img}'),
//                           bookID: bookPupolars[index]);
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class MySearchAppBar extends StatefulWidget {
//   final String getText;
//   const MySearchAppBar({Key? key, this.getText = ''}) : super(key: key);

//   @override
//   State<MySearchAppBar> createState() => _MySearchAppBarState();
// }

// class _MySearchAppBarState extends State<MySearchAppBar> {
//   @override
//   @override
//   Widget build(BuildContext context) {
//     String txt_for = '';
//     return AppBar(
//       automaticallyImplyLeading: false,
//       toolbarHeight: 50,
//       scrolledUnderElevation: 0,
//       backgroundColor: Colors.white,
//       titleSpacing: 0,
//       title: Container(
//         margin: const EdgeInsets.symmetric(horizontal: 10),
//         child: Row(
//           children: [
//             IconButton(
//               iconSize: 22,
//               color: Color.fromARGB(255, 95, 95, 99),
//               icon: const Icon(Iconsax.arrow_left_copy),
//               onPressed: () {
//                 Navigator.pushReplacement(
//                   context,
//                   PageRouteBuilder(
//                     transitionDuration: Duration.zero,
//                     pageBuilder: (_, __, ___) => Mybody(),
//                   ),
//                 );
//               },
//             ),
//             Expanded(
//               child: Container(
//                 height: 35,
//                 margin: const EdgeInsets.only(left: 5),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(8),
//                   color: Color.fromRGBO(242, 242, 242, 1),
//                 ),
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     IconButton(
//                       padding: EdgeInsets.zero,
//                       icon: const Icon(
//                         Iconsax.search_normal_1_copy,
//                         size: 17,
//                       ),
//                       color: const Color.fromRGBO(192, 192, 193, 1),
//                       onPressed: () {
//                         //
//                       },
//                     ),
//                     Expanded(
//                       child: TextField(
//                         controller: TextEditingController()
//                           ..text = '${widget.getText}',
//                         cursorColor: Colors.black54,
//                         style: const TextStyle(
//                           color: Colors.black87,
//                           fontFamily: KhmerFonts.battambang,
//                           fontSize: 13,
//                           fontWeight: FontWeight.w500,
//                           package: "khmer_fonts",
//                         ),
//                         decoration: const InputDecoration(
//                           border: InputBorder.none,
//                           hintText: 'ស្វែងរកសៀវភៅ..',
//                           hintStyle: TextStyle(
//                             height: 1,
//                             color: Color.fromRGBO(192, 192, 193, 1),
//                           ),
//                           isDense: true,
//                           contentPadding: EdgeInsets.symmetric(
//                             vertical: 8,
//                           ),
//                         ),
//                         onSubmitted: (value) {
//                           txt_for = value;
//                           Navigator.push(
//                               context,
//                               PageRouteBuilder(
//                                 transitionDuration: Duration.zero,
//                                 pageBuilder: (_, __, ___) => MySearchShowItem(
//                                   txt_input: value,
//                                 ),
//                               ));
//                         },
//                         onChanged: (value) => {
//                           txt_for = value,
//                         },
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             TextButton(
//               onPressed: () {
//                 txt_for == ''
//                     ? Navigator.push(
//                         context,
//                         PageRouteBuilder(
//                           transitionDuration: Duration.zero,
//                           pageBuilder: (_, __, ___) => MySearch(),
//                         ))
//                     : Navigator.push(
//                         context,
//                         PageRouteBuilder(
//                           transitionDuration: Duration.zero,
//                           pageBuilder: (_, __, ___) =>
//                               MySearchShowItem(txt_input: txt_for),
//                         ));
//               },
//               child: Text(
//                 'ស្វែងរក',
//                 style: TextStyle(
//                   fontSize: 13,
//                   fontFamily: KhmerFonts.battambang,
//                   package: "khmer_fonts",
//                   fontWeight: FontWeight.w600,
//                   color: Color.fromRGBO(245, 203, 57, 1),
//                 ),
//               ),
//               style: ButtonStyle(
//                 overlayColor: WidgetStateProperty.all(Colors.transparent),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
