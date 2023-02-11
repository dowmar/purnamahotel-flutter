// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color mainColor = Color.fromRGBO(35, 33, 83, 1);
Color secColor = Color.fromRGBO(250, 235, 239, 1);
Color tileColor = Color(0xFF5355a2);
Color boxColor = Color(0xFFBCBEDC);
const bgColor = Color(0xFF212332);

class MainAppBar extends StatelessWidget with PreferredSizeWidget {
  String title;
  String subtitle;

  MainAppBar({
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      // padding: const EdgeInsets.symmetric(horizontal: 5.0),

      child: Container(
        decoration: BoxDecoration(
          color: mainColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 8,
              ),
              Text(
                title,
                style: GoogleFonts.beVietnamPro(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 8,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(100);
}
