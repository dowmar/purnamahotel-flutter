import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:hotel_flutter/settings/sql_helper.dart';
import 'components/kamarCard.dart';
import 'components/mainAppBar.dart';

class KamarGallery extends StatefulWidget {
  KamarGallery({Key? key}) : super(key: key);

  @override
  State<KamarGallery> createState() => _KamarGalleryState();
}

class _KamarGalleryState extends State<KamarGallery> {
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
                title: "Gallery",
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
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 1.4,
                  child: courseLayout(context),
                  // child: ListView.builder(
                  //   itemCount: nilaikamar,
                  //   // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  //   //     crossAxisCount: 3),
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

Widget courseLayout(BuildContext context) {
  List<String> imageFileList = [
    "https://purnamabaligehotel.com/wp-content/uploads/2023/02/STANDAR-SINGLE-ROOM-1-1024x461.jpg",
    "https://purnamabaligehotel.com/wp-content/uploads/2023/02/Standard-double2-1024x819.png",
    "https://purnamabaligehotel.com/wp-content/uploads/2023/02/1660642765621-461x1024.jpg",
    "https://purnamabaligehotel.com/wp-content/uploads/2023/02/1660638916746-1-1024x576.jpg",
    "https://purnamabaligehotel.com/wp-content/uploads/2023/02/WhatsApp-Image-2023-01-16-at-18.51.03-1024x768.jpeg",
    "https://purnamabaligehotel.com/wp-content/uploads/2023/02/WhatsApp-Image-2023-01-16-at-18.51.01.jpeg",
    "https://purnamabaligehotel.com/wp-content/uploads/2023/02/VIP-with-View2-1024x819.png",
    "https://purnamabaligehotel.com/wp-content/uploads/2023/02/VIP-with-View3-1024x819.png",
    "https://purnamabaligehotel.com/wp-content/uploads/2023/02/VIP-with-View-5.png",
    "https://purnamabaligehotel.com/wp-content/uploads/2023/02/WhatsApp-Image-2023-01-13-at-20.43.53.jpeg",
    "https://purnamabaligehotel.com/wp-content/uploads/2023/02/VIP4-1024x819.png",
    "https://purnamabaligehotel.com/wp-content/uploads/2023/02/IMG_0526-1536x1024.png",
    "https://purnamabaligehotel.com/wp-content/uploads/2023/02/IMG_0524-1536x1024.png",
    "https://purnamabaligehotel.com/wp-content/uploads/2023/02/IMG_0536-1536x1024.png",
    "https://purnamabaligehotel.com/wp-content/uploads/2023/02/IMG_0529-1536x1083.png",
    "https://purnamabaligehotel.com/wp-content/uploads/2023/02/WhatsApp-Image-2023-01-13-at-20.43.56-1536x1152.jpeg"
  ];
  return MasonryGridView.count(
    crossAxisCount: 2,
    mainAxisSpacing: 10,
    crossAxisSpacing: 10,
    itemCount: imageFileList.length,
    itemBuilder: (context, index) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.network("${imageFileList[index]}"),
      );
    },
  );
}
