import 'package:flutter/material.dart';
import 'components/hotelCard.dart';
import 'components/mainAppBar.dart';

class BerandaHotel extends StatefulWidget {
  const BerandaHotel({Key? key}) : super(key: key);

  @override
  State<BerandaHotel> createState() => _BerandaHotelState();
}

class _BerandaHotelState extends State<BerandaHotel> {
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
              child: FutureBuilder(
                future: _mongoDb.getData(user!.email),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    if (snapshot.hasData) {
                      return LiquidPullToRefresh(
                        color: Colors.transparent,
                        backgroundColor: Colors.black54,
                        springAnimationDurationInMilliseconds: 500,
                        showChildOpacityTransition: false,
                        onRefresh: () async {
                          await _mongoDb.connect();
                        },
                        child: SizedBox(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height / 1.0,
                          child: GridView.builder(
                            itemCount: snapshot.data.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3),
                            itemBuilder: (context, index) {
                              return MongoDataCard(
                                  user: (snapshot.data[index]['user']),
                                  email: (snapshot.data[index]['email']),
                                  coinName: (snapshot.data[index]['coinName']),
                                  coinId: (snapshot.data[index]['coinId']),
                                  coinImg: (snapshot.data[index]['coinImg']),
                                  dateTaken: (snapshot.data[index]['dateTaken'])
                                  // MongoDbModel.fromJson(snapshot.data[index]),
                                  );
                            },
                          ),
                        ),
                      );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                       
                      );
                    }
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
