import 'package:flutter/material.dart';
import 'package:hotel_flutter/settings/sql_helper.dart';
import 'components/kamarCard.dart';
import 'components/mainAppBar.dart';

class KamarList extends StatefulWidget {
  KamarList({Key? key}) : super(key: key);

  @override
  State<KamarList> createState() => _KamarListState();
}

class _KamarListState extends State<KamarList> {
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
                title: "Kamar List",
             
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
              child: SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 1.4,
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
            // SliverToBoxAdapter(
            //   child: Container(
            //     child: ElevatedButton(
            //       child: Text('test'),
            //       onPressed: () {
            //         // addItems();
            //         // deleteItems(4);
            //         // SQLHelper.insertData();
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
