import 'package:Elibrary/components/search.dart';
import 'package:Elibrary/components/search_showitem.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:khmer_fonts/khmer_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MySearchAppBar extends StatefulWidget {
  final String getText;
  const MySearchAppBar({Key? key, this.getText = ''}) : super(key: key);

  @override
  State<MySearchAppBar> createState() => _MySearchAppBarState();
}

class _MySearchAppBarState extends State<MySearchAppBar> {
  List<String> myList = [];
  late TextEditingController _controller;
  String txt_for = '';

  @override
  void initState() {
    super.initState();
    _loadList();
    _controller = TextEditingController(text: widget.getText);
    txt_for = widget.getText;
    _controller.addListener(() {
      setState(() {
        txt_for = _controller.text;
      });
    });
  }

  Future<void> _saveList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('myList', myList);
  }

  Future<void> _addItemToList(String value) async {
    setState(() {
      myList.add(value);
    });
    await _saveList();
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

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          IconButton(
            iconSize: 22,
            color: Color.fromARGB(255, 95, 95, 99),
            icon: const Icon(Iconsax.arrow_left_copy),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          Expanded(
            child: Container(
              height: 35,
              margin: const EdgeInsets.only(left: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Color.fromRGBO(242, 242, 242, 1),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    padding: EdgeInsets.zero,
                    icon: const Icon(
                      Iconsax.search_normal_1_copy,
                      size: 17,
                    ),
                    color: const Color.fromRGBO(192, 192, 193, 1),
                    onPressed: () {
                      //
                    },
                  ),
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      cursorColor: Colors.black54,
                      style: const TextStyle(
                        color: Colors.black87,
                        fontFamily: KhmerFonts.battambang,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        package: "khmer_fonts",
                      ),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'ស្វែងរកសៀវភៅ..',
                        hintStyle: TextStyle(
                          height: 1,
                          color: Color.fromRGBO(192, 192, 193, 1),
                        ),
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 8,
                        ),
                      ),
                      onSubmitted: (value) {
                        _addItemToList(value);
                        Navigator.push(
                            context,
                            PageRouteBuilder(
                              transitionDuration: Duration.zero,
                              pageBuilder: (_, __, ___) => MySearchShowItem(
                                txt_input: value,
                              ),
                            ));
                      },
                    ),
                  ),
                  if (txt_for.isNotEmpty)
                    IconButton(
                      padding: EdgeInsets.zero,
                      icon: const Icon(
                        Iconsax.close_circle,
                        size: 20,
                      ),
                      color: const Color.fromRGBO(192, 192, 193, 1),
                      onPressed: () {
                        _controller.clear();
                      },
                    ),
                ],
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              txt_for == ''
                  ? Navigator.push(
                      context,
                      PageRouteBuilder(
                        transitionDuration: Duration.zero,
                        pageBuilder: (_, __, ___) => MySearch(),
                      ))
                  : Navigator.push(
                      context,
                      PageRouteBuilder(
                        transitionDuration: Duration.zero,
                        pageBuilder: (_, __, ___) =>
                            MySearchShowItem(txt_input: txt_for),
                      ));
            },
            child: Text(
              'ស្វែងរក',
              style: TextStyle(
                fontSize: 13,
                fontFamily: KhmerFonts.battambang,
                package: "khmer_fonts",
                fontWeight: FontWeight.w600,
                color: Color.fromRGBO(245, 203, 57, 1),
              ),
            ),
            style: ButtonStyle(
              overlayColor: WidgetStateProperty.all(Colors.transparent),
            ),
          ),
        ],
      ),
    );
  }
}
