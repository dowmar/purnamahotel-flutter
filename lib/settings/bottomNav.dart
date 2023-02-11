import 'package:flutter/material.dart';

import '../beranda.dart';
import '../beranda2.dart';

class NavBottom extends StatefulWidget {
  const NavBottom({Key? key}) : super(key: key);
  @override
  NavBottomState createState() => NavBottomState();
}

class NavBottomState extends State<NavBottom> {
  int selectedIndex = 0;
  final List<Widget> _widgetOptions = <Widget>[
    BerandaHotel(),
    BerandaHotel2(),
  ];
  List<IconData> data = [
    Icons.home_outlined,
    // Icons.search,
    // Icons.add_box_outlined,
    Icons.favorite_outline_sharp,
    Icons.person_outline_sharp
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        _widgetOptions.elementAt(selectedIndex),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Align(
            alignment: Alignment(0.0, 1.0),
            child: ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
              child: BottomNavigationBar(
                selectedItemColor: Colors.white,
                unselectedItemColor: Colors.grey,
                showSelectedLabels: true,
                showUnselectedLabels: false,
                backgroundColor: Colors.black,
                currentIndex: selectedIndex,
                onTap: (int index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home_outlined),
                    label: "Home",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.bed_outlined),
                    label: "Kamar",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person_outline_sharp),
                    label: "Profile",
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    )
        // backgroundColor: Colors.transparent,
        // body: _widgetOptions.elementAt(selectedIndex),
        // bottomNavigationBar: Padding(
        //   padding: const EdgeInsets.all(20),
        //   child: Material(
        //     elevation: 10,
        //     borderRadius: BorderRadius.circular(20),
        //     color: Colors.black,
        //     child: Container(
        //       height: 70,
        //       width: double.infinity,
        //       child: ListView.builder(
        //         itemCount: data.length,
        //         padding: EdgeInsets.symmetric(horizontal: 10),
        //         itemBuilder: (ctx, i) => Padding(
        //           padding: const EdgeInsets.symmetric(horizontal: 20),
        //           child: GestureDetector(
        //             onTap: () {
        //               setState(() {
        //                 selectedIndex = i;
        //               });
        //             },
        //             child: AnimatedContainer(
        //               duration: Duration(milliseconds: 250),
        //               width: 35,
        //               decoration: BoxDecoration(
        //                 border: i == selectedIndex
        //                     ? Border(
        //                         top: BorderSide(width: 3.0, color: Colors.white))
        //                     : null,
        //                 gradient: i == selectedIndex
        //                     ? LinearGradient(
        //                         colors: [Colors.grey.shade800, Colors.black],
        //                         begin: Alignment.topCenter,
        //                         end: Alignment.bottomCenter)
        //                     : null,
        //               ),
        //               child: Icon(
        //                 data[i],
        //                 size: 35,
        //                 color: i == selectedIndex
        //                     ? Colors.white
        //                     : Colors.grey.shade800,
        //               ),
        //             ),
        //           ),
        //         ),
        //         scrollDirection: Axis.horizontal,
        //       ),
        //     ),
        //   ),
        // ),
        );
  }
}
