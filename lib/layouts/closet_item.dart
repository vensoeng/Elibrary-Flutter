import 'package:Elibrary/components/bookDetail.dart';
import 'package:Elibrary/layouts/gradientText.dart';
import 'package:Elibrary/model/book.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:khmer_fonts/khmer_fonts.dart';

//header
Container headerClosetItem(String title) {
  return Container(
    height: 50,
    decoration: const BoxDecoration(
      border: Border(
          bottom: BorderSide(
        color: Color.fromARGB(255, 249, 191, 0),
        width: 2.1,
        style: BorderStyle.solid,
      )),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          margin: const EdgeInsets.only(
            left: 8,
            right: 5,
          ),
          child: GradientText(
            text: "សៀវភៅទាំងអស់នៃ${title}",
            gradient: const LinearGradient(colors: [
              Color.fromRGBO(245, 203, 57, 1),
              Color.fromRGBO(159, 128, 21, 1),
            ]),
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              fontFamily: KhmerFonts.battambang,
              package: 'khmer_fonts',
            ),
          ),
        ),
        Container(
          height: 35,
          width: 35,
          margin: const EdgeInsets.only(
            left: 5,
            right: 8,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.white,
          ),
          child: Builder(builder: (context) {
            return IconButton(
              iconSize: 15,
              color: Colors.amber,
              icon: const Icon(FontAwesomeIcons.xmark),
              onPressed: () {
                //
              },
            );
          }),
        ),
      ],
    ),
  );
}

//footer
Container footerClosetItem() {
  return Container(
    height: 50,
    decoration: const BoxDecoration(
      border: Border(
          top: BorderSide(
        color: Color.fromARGB(255, 249, 191, 0),
        width: 2.1,
        style: BorderStyle.solid,
      )),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          margin: const EdgeInsets.only(
            left: 8,
            right: 5,
          ),
          child: const Text(
            'ដើម្បីមើលសៀវភៅជាច្រើន',
            style: TextStyle(
              fontSize: 14,
              fontFamily: KhmerFonts.battambang,
              fontWeight: FontWeight.w500,
              package: 'khmer_fonts',
              color: Colors.white,
            ),
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          margin: const EdgeInsets.only(
            left: 5,
            right: 8,
          ),
          constraints: BoxConstraints(
            maxHeight: 30,
            maxWidth: 60,
          ),
          child: OutlinedButton(
            onPressed: () {},
            style: ButtonStyle(
              padding: WidgetStateProperty.all<EdgeInsets>(
                const EdgeInsets.symmetric(
                  vertical: 3.0,
                  horizontal: 8.0,
                ),
              ),
              side: WidgetStateProperty.all<BorderSide>(
                const BorderSide(
                  color: Color.fromARGB(255, 249, 191, 0),
                  width: 1,
                ),
              ),
              shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              backgroundColor: WidgetStateProperty.all<Color>(
                Colors.white,
              ),
            ),
            child: const Text(
              "ស្វែងរក",
              style: TextStyle(
                fontSize: 12,
                fontFamily: KhmerFonts.battambang,
                package: "khmer_fonts",
                color: Color.fromARGB(255, 249, 191, 0),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

//content
class MyClosetItemList extends StatefulWidget {
  final String textTitle;
  final String textDescript;
  final String textStar;
  final String img;
  final BookModel bookindex;
  const MyClosetItemList(
      {super.key,
      required this.textTitle,
      required this.textDescript,
      required this.textStar,
      required this.img,
      required this.bookindex});

  @override
  State<MyClosetItemList> createState() => _MyCloseetItemListState();
}

class _MyCloseetItemListState extends State<MyClosetItemList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5, bottom: 5, left: 5),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Bookdetail(
                bookItem: widget.bookindex,
              ),
            ),
          );
        },
        child: Container(
          margin: const EdgeInsets.only(left: 5, right: 5),
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  widget.img,
                  width: 120,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(left: 5, right: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.textTitle,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontFamily: KhmerFonts.nokora,
                          fontSize: 16,
                          package: 'khmer_fonts',
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        widget.textDescript,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontFamily: KhmerFonts.nokora,
                          fontSize: 12,
                          package: "khmer_fonts",
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'ផ្កាយ:${widget.textStar}',
                        style: const TextStyle(
                          fontFamily: KhmerFonts.nokora,
                          fontSize: 12,
                          package: "khmer_fonts",
                          color: Colors.white,
                        ),
                      ),
                    ],
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
