import 'package:Elibrary/components/search_showitem.dart';
import 'package:Elibrary/layouts/featuredbook.dart';
import 'package:Elibrary/layouts/mybookcard.dart';
import 'package:Elibrary/layouts/search_appbar.dart';
import 'package:Elibrary/model/book.dart';
import 'package:Elibrary/service/Api_handle.dart';
import 'package:flutter/material.dart';
import 'package:khmer_fonts/khmer_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MySearch extends StatefulWidget {
  final String getText;
  const MySearch({Key? key, this.getText = ''});
  @override
  State<MySearch> createState() => _MySearchState();
}

class _MySearchState extends State<MySearch> {
  List<String> myList = [];
  List<BookModel> bookItems = [];
  List<BookModel> bookPupolars = [];
  late TextEditingController searchController;
  late String text;
  final link = Link();
  @override
  void initState() {
    super.initState();
    getBookData();
    _loadList();
    // searchController = TextEditingController(text: widget.getText);
  }

  // @override
  // void dispose() {
  //   searchController.dispose();
  //   super.dispose();
  // }

  void getBookData() async {
    if (widget.getText == "") {
      ApiHandle apiHandle = ApiHandle();
      List<BookModel> fetchBookItem = await apiHandle.fetchBookItems();
      setState(() {
        bookItems = fetchBookItem;
        bookPupolars = bookItems.where((item) => item.popular == 1).toList();
      });
    } else {
      ApiHandleSearch apiHandle = ApiHandleSearch(text: widget.getText);
      List<BookModel> fetchBookItem = await apiHandle.fetchSearch();
      setState(() {
        bookItems = fetchBookItem;
      });
    }
  }

  Future<void> _saveList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('myList', myList);
  }

  Future<void> _loadList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? storedList = prefs.getStringList('myList');
    if (storedList != null) {
      setState(() {
        myList = storedList;
      });
    }
  }

  Future<void> _clearList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('myList');
  }

  bool _buttonIshover = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 238, 233, 233),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 50,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        titleSpacing: 0,
        title: MySearchAppBar(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //history search
              if (myList.length > 0)
                ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: myList.length,
                    itemBuilder: (etx, ind) {
                      return ListTile(
                        contentPadding: EdgeInsets.only(left: 8, right: 8),
                        title: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                PageRouteBuilder(
                                    pageBuilder: (_, __, ___) =>
                                        MySearchShowItem(
                                          txt_input: myList[ind],
                                        )));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin:
                                    const EdgeInsets.only(left: 8, right: 8),
                                child: Icon(
                                  Icons.history,
                                  size: 25,
                                  color: Colors.black54,
                                ),
                              ),
                              Container(
                                child: Text(
                                  myList[ind],
                                  style: TextStyle(
                                    fontFamily: KhmerFonts.battambang,
                                    fontWeight: FontWeight.w500,
                                    package: "khmer_fonts",
                                    fontSize: 14,
                                    height: 2.5,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        trailing: IconButton(
                          icon: Icon(
                            Icons.close,
                            size: 19,
                          ),
                          onPressed: () {
                            setState(() {
                              myList.removeAt(ind);
                            });
                            // Update SharedPreferences to reflect the change
                            _saveList();
                          },
                        ),
                      );
                    }),
              //clear all item history
              if (myList.length > 0)
                Container(
                  child: Center(
                    child: MouseRegion(
                      onEnter: (_) => setState(() => _buttonIshover = true),
                      onExit: (_) => setState(() => _buttonIshover = false),
                      child: TextButton(
                        onPressed: () {
                          _clearList();
                          setState(() {
                            myList.clear();
                          });
                        },
                        child: Text(
                          'សំអាតទាំងអស់',
                          style: TextStyle(
                            fontFamily: KhmerFonts.battambang,
                            fontWeight: FontWeight.w500,
                            package: "khmer_fonts",
                            fontSize: 13,
                            color: _buttonIshover
                                ? Colors.red[200]
                                : Colors.black45,
                          ),
                        ),
                        style: ButtonStyle(
                          overlayColor:
                              WidgetStateProperty.all(Colors.transparent),
                        ),
                      ),
                    ),
                  ),
                ),
              // this is suggestion
              Container(
                margin: const EdgeInsets.only(
                  left: 10,
                  bottom: 5,
                  top: 10,
                ),
                child: Text(
                  'អ្នកប្រហែលជាចូលចិត្ត',
                  style: TextStyle(
                    fontFamily: KhmerFonts.battambang,
                    fontWeight: FontWeight.w600,
                    package: "khmer_fonts",
                    fontSize: 14,
                  ),
                ),
              ),
              if (bookPupolars.length > 0)
                ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount:
                        bookPupolars.length > 6 ? 6 : bookPupolars.length,
                    itemBuilder: (etx, ind) {
                      return ListTile(
                        contentPadding: EdgeInsets.only(left: 0, right: 8),
                        title: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                PageRouteBuilder(
                                    pageBuilder: (_, __, ___) =>
                                        MySearchShowItem(
                                          txt_input: bookPupolars[ind].title,
                                        )));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin:
                                    const EdgeInsets.only(left: 8, right: 10),
                                child: Icon(
                                  Icons.circle,
                                  size: 10,
                                  color:
                                      const Color.fromARGB(255, 255, 191, 118),
                                ),
                              ),
                              Container(
                                child: Text(
                                  bookPupolars[ind].title,
                                  style: TextStyle(
                                    fontFamily: KhmerFonts.battambang,
                                    fontWeight: FontWeight.w500,
                                    package: "khmer_fonts",
                                    fontSize: 14,
                                    height: 2.5,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
              if (bookPupolars.length == 0)
                Container(
                  margin: const EdgeInsets.all(0),
                  height: 250,
                  child: const Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                          Color.fromARGB(255, 255, 191, 118)),
                    ),
                  ),
                ),
              if (bookPupolars.length > 0)
                MyFedtureBook(mainText: '📙នេះជាសៀវភៅដែលសំណើរសម្រាប់អ្នក'),
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
                itemCount: bookPupolars.length < 0
                    ? bookItems.length
                    : bookPupolars.length,
                itemBuilder: (context, index) {
                  return bookPupolars.length < 0
                      ? MyBookCard(
                          title: bookItems[index].title,
                          star: bookItems[index].star,
                          imageUrl: Link.apiUrl(
                              'storage/images/${bookItems[index].img}'),
                          bookID: bookItems[index],
                        )
                      : MyBookCard(
                          title: bookPupolars[index].title,
                          star: bookPupolars[index].star,
                          imageUrl: Link.apiUrl(
                              'storage/images/${bookPupolars[index].img}'),
                          bookID: bookPupolars[index]);
                },
              ),
              if (bookPupolars.length == 0)
                Container(
                  margin: const EdgeInsets.all(0),
                  height: 250,
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
