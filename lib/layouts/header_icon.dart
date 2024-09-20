import 'package:Elibrary/components/search.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class HeaderIcon extends StatelessWidget {
  final String iconName;

  HeaderIcon({required this.iconName});

  @override
  Widget build(BuildContext context) {
    IconData iconData;
    switch (iconName) {
      case 'search':
        iconData = Iconsax.search_normal_1_copy;
        break;
      case 'menu':
        iconData = FontAwesomeIcons.bars;
        break;
      default:
        iconData = Icons.menu;
    }

    void openDrawer() {
      Scaffold.of(context).openDrawer();
    }

    return Container(
      margin: const EdgeInsets.only(right: 8.0),
      width: 35,
      height: 35,
      child: IconButton(
        iconSize: 17,
        // color: Colors.white,
        icon: Icon(iconData),
        onPressed: () {
          iconName == 'search'
              ? Navigator.push(
                  context,
                  PageRouteBuilder(
                    transitionDuration: Duration.zero,
                    pageBuilder: (_, __, ___) => MySearch(),
                  ))
              : openDrawer();
        },
      ),
    );
  }
}
