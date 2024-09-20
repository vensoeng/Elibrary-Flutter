import 'package:flutter/material.dart';

class TextListtile extends StatefulWidget {
  final String title;
  final String texticon;

  TextListtile(this.title, this.texticon);

  @override
  _TextListTileState createState() => _TextListTileState();
}

class _TextListTileState extends State<TextListtile> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 15, right: 15, top: 0, bottom: 0),
      child: MouseRegion(
        onEnter: (_) {
          setState(() {
            isHovered = true;
          });
        },
        onExit: (_) {
          setState(() {
            isHovered = false;
          });
        },
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          tileColor: isHovered
              ? Color.fromRGBO(242, 242, 242, 1)
              : const Color(0x00000000),
          onTap: () {
            // Handle onTap event
          },
          leading: Container(
            margin: const EdgeInsets.only(left: 15, right: 0.5),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color.fromRGBO(249, 212, 152, 1),
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
              width: 28.0,
              height: 28.0,
              child: Center(
                child: Text(
                  widget.texticon,
                  style: const TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w500,
                    color: Color.fromRGBO(249, 212, 152, 1),
                  ),
                ),
              ),
            ),
          ),
          title: Padding(
            padding: const EdgeInsets.symmetric(
                vertical: 4.0, horizontal: 8.0), // Padding
            child: Text(
              widget.title,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500, // Font weight
                color: Color.fromRGBO(249, 212, 152, 1), // Text color
              ),
            ),
          ),
        ),
      ),
    );
  }
}
