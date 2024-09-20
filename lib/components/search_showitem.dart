import 'package:Elibrary/layouts/mybookcard.dart';
import 'package:Elibrary/layouts/search_appbar.dart';
import 'package:Elibrary/model/book.dart';
import 'package:Elibrary/service/Api_handle.dart';
import 'package:flutter/material.dart';
import 'package:khmer_fonts/khmer_fonts.dart';

class MySearchShowItem extends StatefulWidget {
  final String txt_input;
  const MySearchShowItem({Key? key, required this.txt_input}) : super(key: key);

  @override
  State<MySearchShowItem> createState() => _MySearchShowItemState();
}

class _MySearchShowItemState extends State<MySearchShowItem> {
  List<BookModel> bookItems = [];
  bool delayCompleted = false;
  void initState() {
    super.initState();
    getBookData();
    Future.delayed(Duration(seconds: 1)).then((_) {
      if (mounted) {
        setState(() {
          delayCompleted = true;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  void getBookData() async {
    print(widget.txt_input);
    ApiHandleSearch apiHandle = ApiHandleSearch(text: widget.txt_input);
    List<BookModel> fetchBookItem = await apiHandle.fetchSearch();
    setState(() {
      bookItems = fetchBookItem;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 50,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        titleSpacing: 0,
        title: MySearchAppBar(
          getText: widget.txt_input,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (bookItems.length > 0)
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 300,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                    childAspectRatio: 0.7,
                  ),
                  itemCount: bookItems.length,
                  itemBuilder: (context, index) {
                    return MyBookCard(
                      title: bookItems[index].title,
                      star: bookItems[index].star,
                      imageUrl:
                          Link.apiUrl('storage/images/${bookItems[index].img}'),
                      bookID: bookItems[index],
                    );
                  },
                ),
              if (bookItems.length == 0 && delayCompleted)
                Container(
                  height: MediaQuery.of(context).size.height - 80,
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
                              'រកមិនឃើញ',
                              style: TextStyle(
                                fontFamily: KhmerFonts.battambang,
                                package: "khmer_fonts",
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: Colors.black54,
                              ),
                            ),
                            Text(
                              'សូមបន្ថែមព្រឹត្តិការណ៍ថ្មីដើម្បីចាប់ផ្តើម។',
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
              if (bookItems.length == 0 && delayCompleted == false)
                Container(
                  margin: const EdgeInsets.all(0),
                  height: MediaQuery.of(context).size.height - 70,
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
    );
  }
}
