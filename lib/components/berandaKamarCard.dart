import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class BerandaKamarCard extends StatelessWidget {
  String kamarName;
  String kamarImg;
  String kamarHarga;
  String kamarType;
  String kamarDeskripsi;

  BerandaKamarCard({
    required this.kamarName,
    required this.kamarImg,
    required this.kamarHarga,
    required this.kamarType,
    required this.kamarDeskripsi,
  });

  Color mainColor = Color.fromRGBO(35, 33, 83, 1);
  Color secColor = Color.fromRGBO(250, 235, 239, 1);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(9.0),
      child: Material(
        color: mainColor,
        borderRadius: BorderRadius.circular(8.0),
        // padding: const EdgeInsets.all(9.0),
        child: InkWell(
          splashColor: secColor,
          onTap: () {
            print(kamarName);
            print(kamarDeskripsi);
          },
          child: Container(
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.transparent,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.015),
                  offset: Offset(3.0, 3.0),
                  blurRadius: 24.0,
                  spreadRadius: 0.0,
                ),
              ],
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white60,
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(kamarImg),
                      ),
                    ),
                    height: 60,
                    width: 120,
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              kamarName,
                              style: GoogleFonts.beVietnamPro(
                                fontSize: 18,
                                color: secColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
