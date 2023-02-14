import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class BerandaGalleryCard extends StatelessWidget {
  String galleryName;
  String galleryImg;

  BerandaGalleryCard({
    required this.galleryName,
    required this.galleryImg,
  });

  Color mainColor = Color.fromRGBO(35, 33, 83, 1);
  Color secColor = Color.fromRGBO(250, 235, 239, 1);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: 3,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsetsDirectional.symmetric(
                    horizontal: 8, vertical: 8),
                child: Container(
                  padding: const EdgeInsets.all(12),
                  height: 280,
                  width: 255,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: secColor,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.15),
                        offset: Offset(3.0, 3.0),
                        blurRadius: 12.0,
                        spreadRadius: 0.0,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 164,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          // color: Colors.white,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(galleryImg),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 18,
                      ),
                      Flexible(
                        child: Text(
                          galleryName,
                          style: GoogleFonts.beVietnamPro(
                            fontSize: 20,
                            color: mainColor,
                            fontWeight: FontWeight.w600,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
