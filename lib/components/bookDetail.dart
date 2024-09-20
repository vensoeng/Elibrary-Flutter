import 'package:Elibrary/layouts/appbar.dart';
import 'package:Elibrary/layouts/aside.dart';
import 'package:Elibrary/layouts/closet_item.dart';
import 'package:Elibrary/layouts/detail_class.dart';
import 'package:Elibrary/layouts/mybookcard.dart';
import 'package:Elibrary/model/book.dart';
import 'package:Elibrary/service/Api_handle.dart';
import 'package:flutter/material.dart';

class Bookdetail extends StatefulWidget {
  final BookModel bookItem;

  const Bookdetail({Key? key, required this.bookItem}) : super(key: key);

  @override
  State<Bookdetail> createState() => _BookdetailState();
}

class _BookdetailState extends State<Bookdetail> {
  final link = Link();
  List<BookModel> bookItems = [];
  List<BookModel> filteredItems = [];
  bool isScreenWide = false;

  @override
  void initState() {
    super.initState();
    getBookData();
  }

  void getBookData() async {
    ApiHandle apiHandle = ApiHandle();
    List<BookModel> fetchBookItem = await apiHandle.fetchBookItems();
    setState(() {
      bookItems = fetchBookItem;
      filteredItems = bookItems
          .where((item) => item.closet_id == widget.bookItem.closet_id)
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 950) {
          return Scaffold(
            backgroundColor: Color.fromARGB(255, 238, 233, 233),
            appBar: MyAppbar(),
            drawer: Aside(),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  MyItemDetailContainer(
                    title: widget.bookItem.title,
                    descript: widget.bookItem.descript,
                    length: widget.bookItem.length,
                    range_id: widget.bookItem.range.title,
                    closet_id: widget.bookItem.closet.title,
                    floor_id: widget.bookItem.floor.title,
                    img: Link.apiUrl('storage/images/${widget.bookItem.img}'),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    margin: const EdgeInsets.only(left: 8, right: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color.fromARGB(255, 138, 120, 78),
                    ),
                    child: Column(
                      children: [
                        headerClosetItem(widget.bookItem.closet.title),
                        Container(
                          margin: const EdgeInsets.only(
                            top: 20,
                            left: 5,
                            right: 5,
                            bottom: 0,
                          ),
                          constraints: BoxConstraints(
                            maxHeight: MediaQuery.of(context).size.height,
                            minHeight: 0,
                          ),
                          child: filteredItems.length > 0
                              ? ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap:
                                      true, // This is important to allow the ListView to size itself
                                  itemCount: filteredItems.length,
                                  itemBuilder: (context, index) =>
                                      MyClosetItemList(
                                    textTitle: filteredItems[index].title,
                                    textDescript: filteredItems[index].descript,
                                    textStar: filteredItems[index].star,
                                    img: Link.apiUrl(
                                        'storage/images/${filteredItems[index].img}'),
                                    bookindex: filteredItems[index],
                                  ),
                                )
                              : Container(
                                  margin: const EdgeInsets.all(0),
                                  height:
                                      MediaQuery.of(context).size.height - 400,
                                  child: const Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                ),
                        ),
                        footerClosetItem(),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    margin: const EdgeInsets.only(
                      left: 8,
                      right: 8,
                    ),
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
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
                          imageUrl: Link.apiUrl(
                              'storage/images/${bookItems[index].img}'),
                          bookID: bookItems[index],
                          populer: bookItems[index].popular,
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          );
        } else {
          return Scaffold(
            backgroundColor: Color.fromARGB(255, 238, 233, 233),
            appBar: MyAppbar(),
            drawer: Aside(),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 8,
                          ),
                          // right element
                          MyItemDetail(
                              title: widget.bookItem.title,
                              descript: widget.bookItem.descript,
                              length: widget.bookItem.length,
                              range_id: widget.bookItem.range.title,
                              closet_id: widget.bookItem.closet.title,
                              floor_id: widget.bookItem.floor.title,
                              img: Link.apiUrl(
                                  'storage/images/${widget.bookItem.img}')),
                          // left elment
                          Expanded(
                            flex: 5,
                            child: Container(
                              margin: const EdgeInsets.only(
                                left: 8,
                                right: 8,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Color.fromARGB(255, 138, 120, 78),
                              ),
                              child: Column(
                                children: [
                                  // this is header
                                  headerClosetItem(
                                      widget.bookItem.closet.title),
                                  // this is content
                                  Container(
                                    margin: const EdgeInsets.all(0),
                                    height: 500,
                                    child: ListView.builder(
                                      itemCount: filteredItems.length,
                                      itemBuilder: (ind, cdx) =>
                                          MyClosetItemList(
                                        textTitle: filteredItems[cdx].title,
                                        textDescript:
                                            filteredItems[cdx].descript,
                                        textStar: filteredItems[cdx].star,
                                        img: Link.apiUrl(
                                            'storage/images/${filteredItems[cdx].img}'),
                                        bookindex: filteredItems[cdx],
                                      ),
                                    ),
                                  ),
                                  // this is footer
                                  footerClosetItem()
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
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
                          imageUrl: Link.apiUrl(
                              'storage/images/${bookItems[index].img}'),
                          bookID: bookItems[index],
                          populer: bookItems[index].popular,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
