import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class AppVesion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
            transform: GradientRotation(65 * 3.14159 / 180),
            colors: [
              Color.fromRGBO(245, 142, 57, 1),
              Color.fromRGBO(245, 203, 57, 1),
            ]),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 5,
            right: 5,
            child: Icon(
              Iconsax.magic_star,
              color: Colors.amber,
              size: 18,
            ),
          ),
          ListTile(
            title: Text(
              'Copyright Khl All service',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            subtitle: Text(
              'KhmerLibrary v3.5.20',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
