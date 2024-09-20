import 'package:Elibrary/layouts/GNav.dart';
import 'package:Elibrary/layouts/appbar.dart';
import 'package:Elibrary/layouts/aside.dart';
import 'package:Elibrary/layouts/featuredbook.dart';
import 'package:Elibrary/layouts/mybookcard.dart';
import 'package:Elibrary/model/book.dart';
import 'package:Elibrary/service/Api_handle.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class Mypopular extends StatefulWidget {
  const Mypopular({super.key});

  @override
  State<Mypopular> createState() => _popularState();
}

class _popularState extends State<Mypopular> {
  List<BookModel> bookItems = [];
  List<BookModel> bookPupolars = [];
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
      bookPupolars = bookItems.where((item) => item.popular == 1).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 238, 233, 233),
      appBar: MyAppbar(),
      drawer: Aside(
        indexbuttonActive: 3,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyFedtureBook(mainText: '🎉ទទួលការចាប់អារម្មណ៍ពីអ្នកអាន🎉'),
              const SizedBox(height: 16.0),
              if (bookPupolars.length > 0)
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 300, // Similar to minmax(300px, 1fr)
                    crossAxisSpacing: 10.0, // Similar to gap
                    mainAxisSpacing: 10.0, // Similar to gap
                    childAspectRatio: 0.7,
                  ),
                  itemCount: bookPupolars
                      .length, // For demonstration, adjust as needed
                  itemBuilder: (context, index) {
                    return MyBookCard(
                      title: bookPupolars[index].title,
                      star: bookPupolars[index].star,
                      imageUrl: Link.apiUrl(
                          'storage/images/${bookPupolars[index].img}'),
                      bookID: bookPupolars[index],
                      populer: 1,
                    );
                  },
                ),
              if (bookPupolars.length == 0)
                Container(
                  margin: const EdgeInsets.all(0),
                  height: MediaQuery.of(context).size.height - 500,
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
      bottomNavigationBar: screenwidth < 560
          ? MyGnnav(
              textRout: 2,
            )
          : Text(''),
    );
  }
}
