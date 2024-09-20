import 'package:Elibrary/layouts/GNav.dart';
import 'package:Elibrary/layouts/appbar.dart';
import 'package:Elibrary/layouts/aside.dart';
import 'package:Elibrary/layouts/playlistitembody.dart';
import 'package:Elibrary/model/saveplaylist.dart';
import 'package:Elibrary/service/Api_handle.dart';
import 'package:flutter/material.dart';

class MyPlaylistInfo extends StatefulWidget {
  final int Id;
  final String TextPlaylist;
  const MyPlaylistInfo({
    super.key,
    required this.Id,
    required this.TextPlaylist,
  });

  @override
  State<MyPlaylistInfo> createState() => _MyPlaylistInfoState();
}

class _MyPlaylistInfoState extends State<MyPlaylistInfo> {
  List<SaveplaylistModel> bookItems = [];
  final link = Link();

  @override
  void initState() {
    super.initState();
    getBookData();
  }

  void getBookData() async {
    ApiHandleSavePlaylist apiHandle = ApiHandleSavePlaylist(id: widget.Id);
    List<SaveplaylistModel> fetchBookItem =
        await apiHandle.fetchSavePlaylistItems();
    setState(() {
      bookItems = fetchBookItem;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: MyAppbar(
        correntIndex: widget.Id,
        getIndex: widget.Id,
      ),
      drawer: Aside(),
      body: MyPlaylistItemBody(
        id: widget.Id,
        textPlaylist: widget.TextPlaylist,
      ),
      bottomNavigationBar: screenwidth < 560
          ? MyGnnav(
              textRout: 3,
            )
          : Text(''),
    );
  }
}
