import 'package:Elibrary/components/homebody.dart';
import 'package:Elibrary/components/new.dart';
import 'package:Elibrary/components/playlist.dart';
import 'package:Elibrary/components/popular.dart';
import 'package:Elibrary/layouts/icon_listtile.dart';
import 'package:Elibrary/layouts/vesion.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:khmer_fonts/khmer_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class Aside extends StatelessWidget {
  final int indexbuttonActive;
  const Aside({Key? key, this.indexbuttonActive = 0}) : super(key: key);

  void _launchURL(String txtUrl) async {
    final Uri url = Uri.parse(txtUrl);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      backgroundColor: Colors.white,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  DecoratedBox(
                    decoration: const BoxDecoration(
                        // color: Color.,
                        ),
                    child: Container(
                      height: 55,
                      margin: const EdgeInsets.only(left: 15, right: 5),
                      child: Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 8.0),
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
                                    color: Colors.white,
                                    fontFamily: KhmerFonts.battambang,
                                    package: 'Khmer_fonts'),
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
                    ),
                  ),
                  text_menu("YOURMENU"),
                  ButtonIconListTile(
                    title: 'Home',
                    icon: Iconsax.home_copy,
                    onTap: () {
                      Navigator.push(
                          context,
                          PageRouteBuilder(
                            transitionDuration: Duration.zero,
                            pageBuilder: (_, __, ___) => Mybody(),
                          ));
                    },
                    active: indexbuttonActive == 1 ? indexbuttonActive : 0,
                  ),

                  ButtonIconListTile(
                    title: "New",
                    icon: Iconsax.flash_1_copy,
                    onTap: () {
                      Navigator.push(
                          context,
                          PageRouteBuilder(
                            transitionDuration: Duration.zero,
                            pageBuilder: (_, __, ___) => MyNew(),
                          ));
                    },
                    active: indexbuttonActive == 2 ? indexbuttonActive : 0,
                  ),

                  ButtonIconListTile(
                    title: "Popular",
                    icon: Iconsax.star_1_copy,
                    onTap: () {
                      Navigator.push(
                          context,
                          PageRouteBuilder(
                            transitionDuration: Duration.zero,
                            pageBuilder: (_, __, ___) => Mypopular(),
                          ));
                    },
                    active: indexbuttonActive == 3 ? indexbuttonActive : 0,
                  ),

                  ButtonIconListTile(
                    title: "playlists",
                    icon: Iconsax.folder_2_copy,
                    onTap: () {
                      Navigator.push(
                          context,
                          PageRouteBuilder(
                            transitionDuration: Duration.zero,
                            pageBuilder: (_, __, ___) => MyPlaylist(),
                          ));
                    },
                    active: indexbuttonActive == 4 ? indexbuttonActive : 0,
                  ),
                  text_menu("OUR MENU"),
                  // TextListtile('About', 'A'),
                  // TextListtile('me', 'C'),
                  ButtonIconListTile(
                    title: "About",
                    icon: Iconsax.personalcard_copy,
                    onTap: () {
                      _launchURL('https://web.facebook.com/vensoeng');
                    },
                  ),
                  ButtonIconListTile(
                    title: "Contact",
                    icon: Iconsax.favorite_chart_copy,
                    onTap: () {
                      _launchURL(
                          'https://web.facebook.com/profile.php?id=100041547633244');
                    },
                  ),
                  //this is fotter
                  // const Spacer(),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 25,
            left: 15,
            right: 15,
            child: AppVesion(),
          )
        ],
      ),
    );
  }

  Container text_menu(String text) {
    return Container(
      alignment: Alignment.topLeft,
      margin: const EdgeInsets.only(
        left: 18,
        top: 5,
        bottom: 5,
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
      ),
    );
  }
}
