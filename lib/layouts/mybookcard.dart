import 'package:Elibrary/components/bookDetail.dart';
import 'package:Elibrary/layouts/texstyle.dart';
import 'package:Elibrary/model/book.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyBookCard extends StatelessWidget {
  final String title;
  final String star;
  final BookModel bookID;
  final String imageUrl;
  final int populer;
  const MyBookCard({
    required this.title,
    required this.star,
    required this.imageUrl,
    required this.bookID,
    this.populer = 0,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            transitionDuration: Duration.zero,
            pageBuilder: (_, __, ___) => Bookdetail(
              bookItem: bookID,
            ),
          ),
        );
      },
      child: Container(
        constraints: const BoxConstraints(
          maxWidth: double.infinity,
        ),
        margin: const EdgeInsets.all(0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    child: Image.network(
                      imageUrl,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                  Positioned(
                    top: 5,
                    right: 5,
                    child: populer > 0
                        ? Container(
                            width: 29,
                            height: 20,
                            decoration: BoxDecoration(
                                color: Colors.amber,
                                borderRadius: BorderRadius.circular(5)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Top',
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.white,
                                    height: 0,
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Text(''),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(right: 5),
                      constraints: const BoxConstraints(
                        maxWidth: 150,
                      ),
                      child: Text(
                        title,
                        style: simple_style_text(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 2),
                        child: const FaIcon(
                          FontAwesomeIcons.solidStar,
                          size: 11,
                          color: Color.fromARGB(246, 44, 42, 24),
                        ),
                      ),
                      Text(
                        star,
                        style: simple_style_text(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
