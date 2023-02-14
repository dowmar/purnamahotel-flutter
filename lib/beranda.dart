import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotel_flutter/components/berandaKamarCard.dart';
import 'package:hotel_flutter/settings/sql_helper.dart';
import 'components/kamarCard.dart';
import 'components/mainAppBar.dart';

Color secColor = Color.fromRGBO(250, 235, 239, 1);

class BerandaHotel extends StatefulWidget {
  BerandaHotel({Key? key}) : super(key: key);

  @override
  State<BerandaHotel> createState() => _BerandaHotelState();
}

class _BerandaHotelState extends State<BerandaHotel> {
  List<Map<String, dynamic>> _kamars = [];
  bool _isloading = true;
  late var nilaikamar = _kamars.length;

  void _refreshKamars() async {
    final data = await SQLHelper.getItems();
    setState(() {
      _kamars = data;
      nilaikamar = data.length;
      _isloading = false;
    });
  }

  void addItems() {
    SQLHelper.createItem(
        "kamarName", "kamarImg", "kamarHarga", "kamarType", "kamarDeskripsi");
  }

  void deleteItems(int id) async {
    await SQLHelper.deleteItem(id);
    print(nilaikamar);
  }

  @override
  void initState() {
    super.initState();
    _refreshKamars();
    print("number items ${_kamars.length}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secColor,
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: MainAppBar(
                title: "Purnama Hotel",
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 70,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Gallery",
                          style: GoogleFonts.beVietnamPro(
                            fontSize: 20,
                            color: mainColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
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
                                      image: index == 0
                                          ? NetworkImage(
                                              'https://purnamabaligehotel.com/wp-content/uploads/2023/02/IMG_0526-1536x1024.png')
                                          : index == 1
                                              ? NetworkImage(
                                                  'https://purnamabaligehotel.com/wp-content/uploads/2023/02/IMG_0529-1536x1083.png')
                                              : NetworkImage(
                                                  'https://purnamabaligehotel.com/wp-content/uploads/2023/02/IMG_0527-1536x1024.png'),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 18,
                                ),
                                Flexible(
                                  child: Text(
                                    'ABCsaadafasdfadfsafasdfaasdasdasdfasdfasdfasdfxxxxxx',
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
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 70,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Rooms",
                          style: GoogleFonts.beVietnamPro(
                            fontSize: 20,
                            color: mainColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            // SliverToBoxAdapter(
            //   child: Container(
            //     child: ElevatedButton(
            //       child: Text('TEst'),
            //       onPressed: () async {
            //         // addItems();
            //         deleteItems(4);
            //         _refreshKamars();
            //         print(_kamars.toString());
            //       },
            //     ),
            //   ),
            // ),
            SliverToBoxAdapter(
              child: SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 1.6,
                child: Column(
                  children: [
                    BerandaKamarCard(
                      kamarName: "Standard Room",
                      kamarImg:
                          "https://purnamabaligehotel.com/wp-content/uploads/2023/02/STANDAR-SINGLE-ROOM-1-1024x461.jpg",
                      kamarHarga: "kamarHarga",
                      kamarType: "kamarType",
                      kamarDeskripsi: "kamarDeskripsi",
                    ),
                    BerandaKamarCard(
                      kamarName: "Deluxe Room",
                      kamarImg:
                          "https://purnamabaligehotel.com/wp-content/uploads/2023/02/1660638916746-1-1024x576.jpg",
                      kamarHarga: "kamarHarga",
                      kamarType: "kamarType",
                      kamarDeskripsi: "kamarDeskripsi",
                    ),
                    BerandaKamarCard(
                      kamarName: "VIP Room",
                      kamarImg:
                          "https://purnamabaligehotel.com/wp-content/uploads/2023/02/VIP-with-View-5.png",
                      kamarHarga: "kamarHarga",
                      kamarType: "kamarType",
                      kamarDeskripsi: "kamarDeskripsi",
                    ),
                  ],
                ),
                // child: ListView.builder(
                //   itemCount: nilaikamar,
                //   itemBuilder: (context, index) {
                //     return HotelDataCard(
                //       kamarName: (_kamars[index]['kamarName']),
                //       kamarImg: (_kamars[index]['kamarImg']),
                //       kamarHarga: (_kamars[index]['kamarHarga']),
                //       kamarType: (_kamars[index]['kamarType']),
                //       kamarDeskripsi: (_kamars[index]['kamarDeskripsi']),
                //     );
                //   },
                // ),
              ),
            ),
            // SliverToBoxAdapter(
            //   child: Container(
            //     child: ElevatedButton(
            //       child: Text('test'),
            //       onPressed: () {
            //         // addItems();
            //         deleteItems(4);
            //         print(_kamars.toString());
            //       },
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
