import 'package:flutter/material.dart';
import 'package:hotel_flutter/settings/sql_helper.dart';
import 'components/kamarCard.dart';
import 'components/mainAppBar.dart';

class BerandaHotel extends StatefulWidget {
  BerandaHotel({Key? key}) : super(key: key);

  @override
  State<BerandaHotel> createState() => _BerandaHotelState();
}

class _BerandaHotelState extends State<BerandaHotel> {
  List<Map<String, dynamic>> _kamars = [];
  bool _isloading = true;

  void _refreshKamars() async {
    final data = await SQLHelper.getItems();
    setState(() {
      _kamars = data;
      _isloading = false;
    });
  }

  void addItems() {
    SQLHelper.createItem(
        "kamarName", "kamarImg", "kamarHarga", "kamarType", "kamarDeskripsi");
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
      backgroundColor: Colors.red,
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: MainAppBar(
                title: "Favorite",
                subtitle: "Milik ",
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 1.3,
                child: ListView.builder(
                  itemCount: _kamars.length,
                  // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  //     crossAxisCount: 3),
                  itemBuilder: (context, index) {
                    return HotelDataCard(
                      kamarName: (_kamars[index]['kamarName']),
                      kamarImg: (_kamars[index]['kamarImg']),
                      kamarHarga: (_kamars[index]['kamarHarga']),
                      kamarType: (_kamars[index]['kamarType']),
                      kamarDeskripsi: (_kamars[index]['kamarDeskripsi']),
                    );
                  },
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                child: ElevatedButton(
                  child: Text('TEst'),
                  onPressed: () {
                    // addItems();
                    print(_kamars.toString());
                  },
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                child: ElevatedButton(
                  child: Text('test'),
                  onPressed: () {
                    // addItems();
                    print(_kamars.toString());
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
