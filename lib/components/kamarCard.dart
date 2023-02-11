import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class HotelDataCard extends StatelessWidget {
  String kamarName;
  String kamarImg;
  String kamarHarga;
  String kamarType;
  String kamarDeskripsi;

  HotelDataCard({
    required this.kamarName,
    required this.kamarImg,
    required this.kamarHarga,
    required this.kamarType,
    required this.kamarDeskripsi,
  });
  Color mainColor = Color(0xFF232343);
  Color secColor = Color(0xFF353666);
  Color tileColor = Color(0xFF5355a2);
  Color boxColor = Color(0xFFBCBEDC);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(9.0),
      child: Material(
        color: tileColor,
        borderRadius: BorderRadius.circular(8.0),
        // padding: const EdgeInsets.all(9.0),
        child: InkWell(
          onTap: () {
            // var snackBar = SnackBar(content: Text(name));

            print(kamarName);
            print(kamarDeskripsi);
            // Navigator.of(context).push(MaterialPageRoute(
            //     builder: (context) => CoinDetailPage(coinId: id)));
          },
          child: Container(
            height: 100,
            decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border(bottom: BorderSide())),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white60,
                        borderRadius: BorderRadius.circular(8.0)),
                    height: 60,
                    width: 60,
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Image.network(kamarImg),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Column(
                        // onTap: () {},
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              kamarName,
                              style: GoogleFonts.openSans(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                height: 20,
                                width: 20,
                                color: Colors.white.withOpacity(.30),
                                child: Center(
                                  child: Text(
                                    kamarDeskripsi,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "1",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              )
                            ],
                          )
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
