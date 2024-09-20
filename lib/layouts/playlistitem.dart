import 'package:Elibrary/components/playlistinfor.dart';
import 'package:Elibrary/function/changeEnumtoKnum.dart';
import 'package:flutter/material.dart';
import 'package:khmer_fonts/khmer_fonts.dart';

class MyPlaylistItem extends StatefulWidget {
  final String textTitle;
  final String itemCount;
  final String img;
  final int itemID;
  const MyPlaylistItem({
    super.key,
    required this.textTitle,
    required this.itemCount,
    required this.img,
    required this.itemID,
  });
  @override
  State<MyPlaylistItem> createState() => _MyPlaylistItemState();
}

class _MyPlaylistItemState extends State<MyPlaylistItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: () {
        Navigator.pushReplacement(
            context,
            PageRouteBuilder(
                transitionDuration: Duration.zero,
                pageBuilder: (_, __, ___) => MyPlaylistInfo(
                      Id: widget.itemID,
                      TextPlaylist: widget.textTitle,
                    )));
      },
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color.fromARGB(255, 219, 200, 157),
                ),
                child: const Text(""),
              ),
            ),
            Positioned(
                top: 8,
                left: 5,
                right: 0,
                bottom: 0,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    widget.img,
                    height: double.maxFinite,
                    width: double.maxFinite,
                    fit: BoxFit.cover,
                  ),
                )),
            Positioned(
              top: 8,
              left: 5,
              right: 0,
              bottom: 0,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: const LinearGradient(
                    colors: [
                      Color.fromARGB(255, 219, 200, 157),
                      Colors.transparent,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.topRight,
                    stops: [
                      0.0,
                      3.0
                    ], // Adjust stops for more control over gradient appearance
                  ),
                ),
                child: const Text(""),
              ),
            ),
            Positioned(
                top: 0,
                left: 15,
                right: 0,
                bottom: 0,
                child: Center(
                  child: ListTile(
                    title: Text(
                      widget.textTitle,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        fontFamily: KhmerFonts.battambang,
                        package: "khmer_fonts",
                        color: Color.fromARGB(255, 252, 252, 252),
                      ),
                    ),
                    subtitle: Text(
                      '${convertToKhmerNumerals(widget.itemCount.toString())}ចំណងជើង',
                      style: const TextStyle(
                        fontSize: 14,
                        height: 2,
                        fontWeight: FontWeight.w600,
                        fontFamily: KhmerFonts.battambang,
                        package: "khmer_fonts",
                        color: Color.fromRGBO(245, 235, 200, 1),
                      ),
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
