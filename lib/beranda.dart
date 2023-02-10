import 'package:flutter/material.dart';
import 'package:hotel_flutter/settings/sql_helper.dart';
import 'components/hotelCard.dart';
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

  @override
  void initState() {
    super.initState();
    _refreshKamars();
    print("number items ${_kamars.length}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
              child: GridView.builder(
                itemCount: _kamars.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (context, index) {
                  return HotelDataCard(
                    kamarName: (_kamars[index]['kamarName']),
                    kamarImg: (_kamars[index]['kamarImg']),
                    kamarHarga: (_kamars[index]['kamarHarga']),
                    kamarType: (_kamars[index]['kamarType']),
                    kamarDeskripsi: (_kamars[index]['kamarDeskripsi']),
                  );
                  // return MongoDataCard(
                  //     user: (snapshot.data[index]['user']),
                  //     email: (snapshot.data[index]['email']),
                  //     coinName: (snapshot.data[index]['coinName']),
                  //     coinId: (snapshot.data[index]['coinId']),
                  //     coinImg: (snapshot.data[index]['coinImg']),
                  //     dateTaken: (snapshot.data[index]['dateTaken'])
                  //     // MongoDbModel.fromJson(snapshot.data[index]),
                  //     );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
