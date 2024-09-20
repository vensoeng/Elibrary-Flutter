import 'package:Elibrary/layouts/search_appbar.dart';
import 'package:flutter/material.dart';

class MyEmpty extends StatefulWidget {
  final String txt_input;
  const MyEmpty({super.key, required this.txt_input});

  @override
  State<MyEmpty> createState() => _MyEmptyState();
}

class _MyEmptyState extends State<MyEmpty> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 50,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        titleSpacing: 0,
        title: MySearchAppBar(
          getText: widget.txt_input,
        ),
      ),
    );
  }
}
