import 'package:Elibrary/components/homebody.dart';
import 'package:Elibrary/components/new.dart';
import 'package:Elibrary/components/playlist.dart';
import 'package:Elibrary/components/popular.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class MyGnnav extends StatelessWidget {
  final int textRout;
  const MyGnnav({super.key, this.textRout = 0});
  @override
  Widget build(BuildContext context) {
    return GNav(
        backgroundColor: Colors.white,
        selectedIndex: textRout,
        rippleColor: Color.fromARGB(246, 208, 198, 113),
        hoverColor: Colors.transparent,
        haptic: true,
        tabBorderRadius: 80,
        // tabShadow: [BoxShadow(color: Color.fromARGB(255, 21, 30, 39))],
        curve: Curves.easeInOut,
        duration: Duration(milliseconds: 50),
        gap: 9,
        color: const Color.fromARGB(246, 44, 42, 24),
        activeColor: Colors.white,
        iconSize: 18,
        tabBackgroundColor: Color.fromRGBO(245, 203, 57, 1),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        tabMargin: EdgeInsets.only(left: 13, right: 13, bottom: 38, top: 10),
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        tabs: [
          GButton(
            icon: Iconsax.home_copy,
            text: 'Home',
            onPressed: () {
              Navigator.push(
                  context,
                  PageRouteBuilder(
                    transitionDuration: Duration.zero,
                    pageBuilder: (_, __, ___) => Mybody(),
                  ));
            },
          ),
          GButton(
            icon: Iconsax.flash_1_copy,
            text: 'New',
            onPressed: () {
              Navigator.push(
                  context,
                  PageRouteBuilder(
                    transitionDuration: Duration.zero,
                    pageBuilder: (_, __, ___) => MyNew(),
                  ));
            },
          ),
          GButton(
            icon: Iconsax.star_1_copy,
            text: 'Popular',
            onPressed: () {
              Navigator.push(
                  context,
                  PageRouteBuilder(
                    transitionDuration: Duration.zero,
                    pageBuilder: (_, __, ___) => Mypopular(),
                  ));
            },
          ),
          GButton(
            icon: Iconsax.folder_2_copy,
            text: 'Playlist',
            onPressed: () {
              Navigator.push(
                  context,
                  PageRouteBuilder(
                    transitionDuration: Duration.zero,
                    pageBuilder: (_, __, ___) => MyPlaylist(),
                  ));
            },
          )
        ]);
  }
}
