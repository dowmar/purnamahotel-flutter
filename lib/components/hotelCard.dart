import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HotelDataCard extends StatelessWidget {
  final _mongoDb = MongoDatabase();
  String user;
  String email;
  String coinName;
  String coinId;
  String coinImg;
  String dateTaken;

  HotelDataCard({
    required this.user,
    required this.email,
    required this.coinName,
    required this.coinId,
    required this.coinImg,
    required this.dateTaken,
  });

  Color mainColor = Color(0xFF232343);
  Color secColor = Color(0xFF353666);
  Color tileColor = Color(0xFF5355a2);
  Color boxColor = Color(0xFFBCBEDC);

  checkDupes() async {
    var delete = await _mongoDb.checkDuplicateDel(email, coinId);
  }

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
            _dialogBuilder(
              context,
              user,
              email,
              coinImg,
              coinName,
              dateTaken,
            );
          },
          child: Container(
            height: 100,
            decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border(bottom: BorderSide())),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white60,
                        borderRadius: BorderRadius.circular(8.0)),
                    height: 90,
                    width: 90,
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Image.network(coinImg),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _dialogBuilder(
    BuildContext context,
    String user,
    String email,
    String coinImg,
    String coinName,
    String dateTaken,
  ) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: tileColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0)), //this right here
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white60,
                      borderRadius: BorderRadius.circular(8.0)),
                  height: 90,
                  width: 90,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Image.network(coinImg),
                  ),
                ),
                Text(
                  coinName,
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Favorit oleh :',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Text(
                      user,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Tgl diambil :',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Text(
                      dateTaken,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  onPressed: () {
                    checkDupes();
                  },
                  child: Text("Delete"),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Colors.red[500],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}