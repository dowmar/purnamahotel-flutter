import 'package:flutter/material.dart';
import 'package:hotel_flutter/settings/sql_helper.dart';
import 'components/kamarCard.dart';
import 'components/mainAppBar.dart';

class BerandaHotel2 extends StatefulWidget {
  BerandaHotel2({Key? key}) : super(key: key);

  @override
  State<BerandaHotel2> createState() => _BerandaHotel2State();
}

class _BerandaHotel2State extends State<BerandaHotel2> {
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
      backgroundColor: Colors.green,
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
              child: Container(
                child: ElevatedButton(
                  child: Text('TEst'),
                  onPressed: () async {
                    // addItems();
                    deleteItems(4);
                    _refreshKamars();
                    print(_kamars.toString());
                  },
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 1.6,
                child: ListView.builder(
                  itemCount: nilaikamar,
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
                  child: Text('test'),
                  onPressed: () {
                    // addItems();
                    deleteItems(4);
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
