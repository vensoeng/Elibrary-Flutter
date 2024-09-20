import 'package:Elibrary/layouts/GNav.dart';
import 'package:Elibrary/layouts/appbar.dart';
import 'package:Elibrary/layouts/aside.dart';
import 'package:Elibrary/layouts/featuredbook.dart';
import 'package:Elibrary/layouts/playlistitem.dart';
import 'package:Elibrary/model/playlist.dart';
import 'package:Elibrary/service/Api_handle.dart';
import 'package:flutter/material.dart';

class MyPlaylist extends StatefulWidget {
  const MyPlaylist({super.key});

  @override
  State<MyPlaylist> createState() => _PlaylistState();
}

class _PlaylistState extends State<MyPlaylist> {
  List<PlaylistModel> playlistItems = [];
  final link = Link();
  @override
  void initState() {
    super.initState();
    getBookData();
  }

  void getBookData() async {
    ApiHandlePlaylist apiHandle = ApiHandlePlaylist();
    List<PlaylistModel> fetchBookItem = await apiHandle.fetchPlaylistItems();
    setState(() {
      playlistItems = fetchBookItem;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 238, 233, 233),
      appBar: MyAppbar(),
      drawer: Aside(
        indexbuttonActive: 4,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              MyFedtureBook(
                mainText: '📚ទីនេះ! បញ្ចីនៃសៀវភៅទាំងអស់',
              ),
              const SizedBox(
                height: 10,
              ),
              if (playlistItems.length > 0)
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 500,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                    childAspectRatio: 1.9,
                  ),
                  itemCount: playlistItems.length,
                  itemBuilder: (context, index) {
                    return MyPlaylistItem(
                      textTitle: playlistItems[index].title,
                      itemCount: playlistItems[index].count.toString(),
                      img: Link.apiUrl(
                          'storage/images/${playlistItems[index].img}'),
                      itemID: playlistItems[index].id,
                    );
                  },
                ),
              if (playlistItems.length == 0)
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
              textRout: 3,
            )
          : Text(''),
    );
  }
}
