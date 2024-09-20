import 'package:flutter/material.dart';
import 'package:khmer_fonts/khmer_fonts.dart';

Table_DataColumn(String text) {
  return Text(
    text,
    style: const TextStyle(
      color: Color.fromARGB(255, 252, 252, 252),
      fontFamily: KhmerFonts.battambang,
      package: "khmer_fonts",
      fontSize: 16,
      fontWeight: FontWeight.w600,
    ),
  );
}

Table_DataCallMain(String text) {
  return Text(
    text,
    style: const TextStyle(
      fontFamily: KhmerFonts.battambang,
      package: "khmer_fonts",
      fontSize: 14,
      height: 3,
      color: Color.fromARGB(246, 44, 42, 24),
      fontWeight: FontWeight.w600,
    ),
  );
}

Table_DataCellsun(String text) {
  return Text(
    text,
    style: const TextStyle(
      color: Color.fromARGB(246, 44, 42, 24),
      fontFamily: KhmerFonts.nokora,
      package: "khmer_fonts",
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),
  );
}
