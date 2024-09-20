import 'package:Elibrary/components/homebody.dart';
import 'package:Elibrary/components/playlistinfor.dart';
import 'package:flutter/material.dart';
import 'package:khmer_fonts/khmer_fonts.dart';

class MyNavButton extends StatefulWidget {
  final String text;
  final int itemId;
  final int active;
  const MyNavButton(
      {super.key, required this.text, required this.itemId, this.active = 0});

  @override
  State<MyNavButton> createState() => _MyNavButtonState();
}

class _MyNavButtonState extends State<MyNavButton> {
  EdgeInsetsGeometry padding =
      const EdgeInsets.symmetric(vertical: 3.0, horizontal: 9.0);
  Color backgroundColor = Color.fromRGBO(242, 242, 242, 1);
  TextStyle textStyle = const TextStyle(
    fontSize: 12,
    fontFamily: KhmerFonts.battambang,
    package: 'khmer_fonts',
    fontWeight: FontWeight.w500,
  );
  Color foregroundColor = Colors.black;

  @override
  void initState() {
    super.initState();
    if (widget.text == "All" && widget.itemId == 00 && widget.active == 00) {
      foregroundColor = foregroundColor = const Color.fromRGBO(245, 203, 57, 1);
      backgroundColor = const Color.fromARGB(246, 44, 42, 24);
    }
    if (widget.itemId == widget.active) {
      backgroundColor = const Color.fromARGB(246, 44, 42, 24);
      foregroundColor = foregroundColor = const Color.fromRGBO(245, 203, 57, 1);
    }
  }

  double borderRadius = 6.0;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          left: widget.text == "All" ? 10 : 0, right: 9.0, bottom: 2),
      padding: const EdgeInsets.all(0),
      constraints: BoxConstraints(
        maxHeight: 32,
        minWidth: widget.text == 'All' ? 38.0 : 0.0,
        maxWidth: widget.text == 'All' ? 38.0 : double.infinity,
      ),
      // height: 35,
      child: ElevatedButton(
        onPressed: () {
          if (widget.text == 'All') {
            Navigator.push(
                context,
                PageRouteBuilder(
                  transitionDuration: Duration.zero,
                  pageBuilder: (_, __, ___) => Mybody(),
                ));
          } else {
            Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                transitionDuration: Duration.zero,
                pageBuilder: (_, __, ___) => MyPlaylistInfo(
                  Id: widget.itemId,
                  TextPlaylist: widget.text,
                ),
              ),
            );
          }
        },
        style: ButtonStyle(
          padding: WidgetStateProperty.all(padding),
          backgroundColor: WidgetStateProperty.all(backgroundColor),
          textStyle: WidgetStateProperty.all(textStyle),
          foregroundColor: WidgetStateProperty.all(foregroundColor),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
          elevation: WidgetStateProperty.all(0),
        ),
        child: Text(
          widget.text,
        ),
      ),
    );
  }
}
