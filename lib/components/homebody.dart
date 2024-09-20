import 'package:Elibrary/layouts/GNav.dart';
import 'package:Elibrary/layouts/appbar.dart';
import 'package:Elibrary/layouts/aside.dart';
import 'package:Elibrary/layouts/featuredbook.dart';
import 'package:Elibrary/layouts/mybookcard.dart';
import 'package:Elibrary/model/book.dart';
import 'package:Elibrary/service/Api_handle.dart';
import 'package:flutter/material.dart';

class Mybody extends StatefulWidget {
  const Mybody({Key? key}) : super(key: key);

  @override
  State<Mybody> createState() => _MybodyState();
}

class _MybodyState extends State<Mybody> {
  List<BookModel> bookItems = [];
  final link = Link();

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
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 238, 233, 233),
      appBar: MyAppbar(),
      drawer: Aside(
        indexbuttonActive: 1,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyFedtureBook(),
              const SizedBox(height: 16.0),
              bookItems.length > 0
                  ? GridView.builder(
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
                    )
                  : Container(
                      margin: const EdgeInsets.all(0),
                      height: MediaQuery.of(context).size.height - 400,
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
      bottomNavigationBar: screenwidth < 560 ? MyGnnav() : Text(''),
    );
  }
}
