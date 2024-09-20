import 'package:flutter/material.dart';

class ButtonIconListTile extends StatefulWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;
  final int active;
  ButtonIconListTile(
      {required this.title,
      required this.icon,
      required this.onTap,
      this.active = 0});

  @override
  _HoverListTileState createState() => _HoverListTileState();
}

class _HoverListTileState extends State<ButtonIconListTile> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: widget.active != 0
              ? Color.fromRGBO(229, 229, 229, 1)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.only(
        left: 15,
        right: 15,
        top: 1,
        bottom: 1,
      ),
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
          contentPadding: EdgeInsets.symmetric(
            vertical: 0,
            horizontal: 1,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          tileColor: isHovered
              ? Color.fromRGBO(242, 242, 242, 1)
              : const Color(0x00000000),
          onTap: widget.onTap,
          leading: Container(
            margin: const EdgeInsets.only(left: 15, right: 0.5),
            child: Icon(
              widget.icon,
              size: 17,
              color: const Color.fromARGB(246, 44, 42, 24), // Icon color
            ),
          ),
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0), // Padding
            child: Text(
              widget.title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500, // Font weight
                color: Color.fromARGB(246, 44, 42, 24), // Text color
              ),
            ),
          ),
        ),
      ),
    );
  }
}
