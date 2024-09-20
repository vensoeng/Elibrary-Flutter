import 'package:Elibrary/layouts/featuredbook.dart';
import 'package:Elibrary/layouts/mybookcard.dart';
import 'package:Elibrary/model/saveplaylist.dart';
import 'package:Elibrary/service/Api_handle.dart';
import 'package:flutter/material.dart';
import 'package:khmer_fonts/khmer_fonts.dart';

class MyPlaylistItemBody extends StatefulWidget {
  final int id;
  final String textPlaylist;
  const MyPlaylistItemBody({
    super.key,
    required this.id,
    required this.textPlaylist,
  });

  @override
  State<MyPlaylistItemBody> createState() => _MyPlaylistItemBodyState();
}

class _MyPlaylistItemBodyState extends State<MyPlaylistItemBody> {
  List<SaveplaylistModel> bookItems = [];
  final link = Link();

  @override
  void initState() {
    super.initState();
    getBookData();
  }

  void getBookData() async {
    ApiHandleSavePlaylist apiHandle = ApiHandleSavePlaylist(id: widget.id);
    List<SaveplaylistModel> fetchBookItem =
        await apiHandle.fetchSavePlaylistItems();
    setState(() {
      bookItems = fetchBookItem;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyFedtureBook(
                mainText: 'សៀវភៅទាំងអស់ក្នុងបញ្ជី${widget.textPlaylist}'),
            const SizedBox(height: 16.0),
            if (bookItems.length == 0)
              Container(
                margin: const EdgeInsets.all(0),
                height: MediaQuery.of(context).size.height - 500,
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
                            'មិនមានទិន្នន័យ',
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
                  if (bookItems.isEmpty) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return MyBookCard(
                      title: bookItems[index].book.title,
                      star: bookItems[index].book.star,
                      imageUrl: Link.apiUrl(
                          'storage/images/${bookItems[index].book.img}'),
                      bookID: bookItems[index].book,
                      populer: bookItems[index].book.popular,
                    );
                  }
                },
              ),
          ],
        ),
      ),
    );
  }
}
