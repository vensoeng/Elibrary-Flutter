import 'package:flutter/material.dart';
import 'package:khmer_fonts/khmer_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class MyFedtureBook extends StatefulWidget {
  final String mainText;
  final String sonText;
  const MyFedtureBook({
    super.key,
    this.mainText = 'អានសៀវភៅឥឡូវនេះដើម្បីកម្ពុជា។',
    this.sonText = 'អំណាន់ជាផ្នែកមួយដ៏សំខាន់នៅក្នុងជីវិតរបស់។',
  });

  @override
  State<MyFedtureBook> createState() => _MyFedtureBookState();
}

class _MyFedtureBookState extends State<MyFedtureBook> {
  void _launchURL() async {
    final Uri url =
        Uri.parse('https://web.facebook.com/profile.php?id=100041547633244');
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        gradient: LinearGradient(
            transform: GradientRotation(65 * 3.14159 / 180),
            colors: [
              Color.fromRGBO(245, 142, 57, 1),
              Color.fromRGBO(245, 203, 57, 1),
            ]),
        borderRadius: BorderRadius.circular(10),
      ),
      constraints: const BoxConstraints(
        minHeight: 200, // Setting minimum height
      ),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 0.8),
                  child: Row(
                    children: [
                      Expanded(
                        child: ListTile(
                          title: FittedBox(
                            alignment: Alignment.centerLeft,
                            fit: BoxFit.scaleDown,
                            child: Text(
                              widget.mainText,
                              style: const TextStyle(
                                fontFamily: KhmerFonts.battambang,
                                fontSize: 19,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                                package: 'khmer_fonts',
                                height: 3,
                              ),
                              maxLines: null,
                            ),
                          ),
                          subtitle: FittedBox(
                            alignment: Alignment.centerLeft,
                            fit: BoxFit.scaleDown,
                            child: Text(
                              widget.sonText,
                              style: const TextStyle(
                                fontFamily: KhmerFonts.battambang,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.white70,
                                package: 'khmer_fonts',
                              ),
                              maxLines: 1,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(
                                color: Colors.white,
                                width: 3,
                                style: BorderStyle.solid)),
                        margin: const EdgeInsets.only(
                            left: 5, right: 15, top: 5, bottom: 5),
                        child: const CircleAvatar(
                          radius: 25,
                          backgroundImage: AssetImage(
                            'asset/images/admin_profile.jpg',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(left: 15),
                  child: OutlinedButton(
                    onPressed: _launchURL,
                    style: ButtonStyle(
                      padding: WidgetStateProperty.all<EdgeInsets>(
                        const EdgeInsets.symmetric(
                          vertical: 3.0,
                          horizontal: 9.0,
                        ),
                      ),
                      side: WidgetStateProperty.all<BorderSide>(
                        const BorderSide(
                          color: Colors.white70,
                          width: 2.0,
                        ),
                      ),
                      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      backgroundColor:
                          WidgetStateProperty.all<Color>(Colors.transparent),
                    ),
                    child: Container(
                      padding: EdgeInsets.only(left: 5, right: 5),
                      child: const Text(
                        "មើលបន្ថែម",
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: KhmerFonts.battambang,
                          package: "khmer_fonts",
                          fontWeight: FontWeight.w600,
                          height: 0,
                          color: Color.fromRGBO(225, 225, 229, 1),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
