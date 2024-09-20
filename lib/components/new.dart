import 'package:Elibrary/layouts/GNav.dart';
import 'package:Elibrary/layouts/appbar.dart';
import 'package:Elibrary/layouts/aside.dart';
import 'package:Elibrary/layouts/featuredbook.dart';
import 'package:Elibrary/layouts/mybookcard.dart';
import 'package:Elibrary/model/book.dart';
import 'package:Elibrary/service/Api_handle.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:khmer_fonts/khmer_fonts.dart';

class MyNew extends StatefulWidget {
  const MyNew({super.key});

  @override
  State<MyNew> createState() => _MyNewState();
}

class _MyNewState extends State<MyNew> {
  List<BookModel> bookItems = [];
  List<BookModel> newItemsThisWeek = [];
  final link = Link();
  bool delayCompleted = false;
  @override
  void initState() {
    super.initState();
    getBookData();
    Future.delayed(Duration(seconds: 5)).then((_) {
      if (mounted) {
        setState(() {
          delayCompleted = true;
        });
      }
    });
  }

  void getBookData() async {
    ApiHandle apiHandle = ApiHandle();
    List<BookModel> fetchBookItem = await apiHandle.fetchBookItems();
    setState(() {
      bookItems = fetchBookItem;
      newItemsThisWeek = filterNewItemsThisWeek(fetchBookItem);
    });
  }

  List<BookModel> filterNewItemsThisWeek(List<BookModel> items) {
    DateTime now = DateTime.now();
    DateTime startOfWeek = now.subtract(Duration(days: now.weekday - 1));

    return items.where((item) {
      DateTime createDate = DateFormat("yyyy-MM-dd").parse(item.create);
      return createDate.isAfter(startOfWeek) ||
          createDate.isAtSameMomentAs(startOfWeek);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 238, 233, 233),
      appBar: MyAppbar(),
      drawer: Aside(
        indexbuttonActive: 2,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (newItemsThisWeek.length > 0)
                MyFedtureBook(mainText: '✨សៀវភៅថ្មីក្នុងសប្តារហ៍នេះ។'),
              const SizedBox(height: 16.0),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 300,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                  childAspectRatio: 0.7,
                ),
                itemCount: newItemsThisWeek.length,
                itemBuilder: (context, index) {
                  return MyBookCard(
                    title: newItemsThisWeek[index].title,
                    star: newItemsThisWeek[index].star,
                    imageUrl: Link.apiUrl(
                        'storage/images/${newItemsThisWeek[index].img}'),
                    bookID: newItemsThisWeek[index],
                    populer: newItemsThisWeek[index].popular,
                  );
                },
              ),
              if (newItemsThisWeek.length == 0 && delayCompleted)
                Container(
                  height: MediaQuery.of(context).size.height - 60,
                  margin: const EdgeInsets.all(0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 20),
                        child: Image.asset(
                          'asset/images/empty_yellow.png',
                          height: 70,
                          width: 70,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const Center(
                        child: Column(
                          children: [
                            Text(
                              'មិនមានទិន្ន័យ',
                              style: TextStyle(
                                fontFamily: KhmerFonts.battambang,
                                package: "khmer_fonts",
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: Colors.black54,
                              ),
                            ),
                            Text(
                              'សូមទៅកាន់ព្រឹត្តិការណ៍ដែទៃដើម្បីចាប់ផ្តើម។',
                              style: TextStyle(
                                fontFamily: KhmerFonts.battambang,
                                package: "khmer_fonts",
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                                color: Colors.black54,
                                height: 3,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              if (newItemsThisWeek.length == 0 && delayCompleted == false)
                Container(
                  margin: const EdgeInsets.all(0),
                  height: MediaQuery.of(context).size.height - 60,
                  child: const Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                          Color.fromARGB(255, 255, 191, 118)),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: screenwidth < 560 ? MyGnnav(textRout: 1) : Text(''),
    );
  }
}
