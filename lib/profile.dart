import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotel_flutter/settings/sql_helper.dart';
import 'components/mainAppBar.dart';

class Profile extends StatefulWidget {
  Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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

  Color mainColor = Color.fromRGBO(35, 33, 83, 1);
  Color secColor = Color.fromRGBO(250, 235, 239, 1);

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
      backgroundColor: mainColor,
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: MainAppBar(
                title: "About Us",
              ),
            ),
            // SliverToBoxAdapter(
            //   child: Container(
            //     child: ElevatedButton(
            //       child: Text('abc'),
            //       onPressed: () async {
            //         // addItems();
            //         deleteItems(3);
            //         _refreshKamars();
            //         print(_kamars.toString());
            //       },
            //     ),
            //   ),
            // ),
            SliverToBoxAdapter(
              child: Container(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    SizedBox(
                      width: 240,
                      height: 200,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          "assets/gambar/purnama.jpeg",
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Welcome to Purnama Balige Hotel, a true oasis of luxury and relaxation placed right on the waterfront of the stunning Lake Toba.\nSoak in the natural beauty of the world’s largest volcanic lake while enjoying world-class amenities such as our swimming pool, sauna, and on-site restaurant. Explore the lake itself with our jet skis and speed boat rentals.\nOur hotel is located in Balige, a charming historic town steeped in the rich cultural heritage of the Batak people. At an altitude of 1000 meters, we experience cooler temperatures all year round. With Silangit International Airport just half an hour away it has never been easier to get away.\nWhether you’re coming for business or pleasure, in a group or on your own, our variety of modern guestrooms and suites are designed for stress-free comfort. Whatever you may need, our friendly and professional staff is always on hand to ensure your stay is nothing short of perfect.",
                      style: GoogleFonts.openSans(
                        fontSize: 16,
                        color: secColor,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: 200,
                      height: 40,
                      child: ElevatedButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.red.shade500,
                        ),
                        onPressed: () async {},
                        child: Text('Logout'),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Divider(),
                    const Divider(
                      color: Colors.grey,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
