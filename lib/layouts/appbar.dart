import 'package:Elibrary/provider/nav_provider.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:provider/provider.dart';
import 'header_icon.dart';
import 'navbutton.dart';
import 'package:khmer_fonts/khmer_fonts.dart';

class MyAppbar extends StatelessWidget implements PreferredSizeWidget {
  final int getIndex;
  final int correntIndex;
  const MyAppbar({Key? key, this.getIndex = 0, this.correntIndex = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: 98,
      backgroundColor: Colors.white,
      elevation: 0,
      scrolledUnderElevation: 0,
      forceMaterialTransparency: false,
      titleSpacing: 0,
      title: Container(
        color: const Color.fromRGBO(15, 15, 15, 255),
        margin: const EdgeInsets.all(0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 10, right: 8.0),
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(245, 203, 57, 1),
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                      width: 35.0,
                      height: 30.0,
                      child: const Center(
                        child: Text(
                          'ប',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w800,
                            fontFamily: KhmerFonts.battambang,
                            package: 'khmer_fonts',
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(0),
                      child: const Text(
                        "កូនបណ្ណាល័យ",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontFamily: KhmerFonts.battambang,
                          package: 'khmer_fonts',
                          color: Color.fromRGBO(245, 203, 57, 1),
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    HeaderIcon(iconName: 'search'),
                    Container(
                      margin: const EdgeInsets.only(right: 8.0),
                      width: 35,
                      height: 35,
                      child: Builder(builder: (context) {
                        return IconButton(
                          iconSize: 15,
                          icon: Icon(Iconsax.element_3_copy),
                          onPressed: () {
                            Scaffold.of(context).openDrawer();
                          },
                        );
                      }),
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            Consumer<PlaylistProvider>(
              builder: (context, playlistProvider, child) {
                final playlistItems = playlistProvider.playlistItems;
                return Row(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            MyNavButton(text: 'All', itemId: correntIndex),
                            ...playlistItems
                                .map((e) => MyNavButton(
                                      text: e.title,
                                      itemId: e.id,
                                      active: getIndex,
                                    ))
                                .toList(),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(98);
}
