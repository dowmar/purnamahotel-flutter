import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:hotel_flutter/beranda.dart';

Color mainColor = Color(0xFF232343);
Color secColor = Color(0xFF353666);
Color tileColor = Color(0xFF5355a2);
Color boxColor = Color(0xFFBCBEDC);

const bgColor = Color(0xFF212332);

class NavMain extends StatefulWidget {
  const NavMain({Key? key}) : super(key: key);

  @override
  State<NavMain> createState() => _NavMainState();
}

class _NavMainState extends State<NavMain> {
  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = <Widget>[
    BerandaHotel(),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            bgColor.withOpacity(1),
            bgColor.withOpacity(0.8),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: tileColor,
        body: _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: GNav(
            backgroundColor: tileColor,
            color: Colors.white54,
            activeColor: Colors.white,
            hoverColor: Colors.white38,
            tabBackgroundColor: Colors.white38,
            gap: 100,
            padding: EdgeInsets.all(10),
            tabs: const [
              GButton(
                 
                haptic: false,
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.star,
                text: 'Favorite',
              ),
            ],
            selectedIndex: _selectedIndex,
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}


 
 

 
 
 

 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 

 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 

 
 
 
 
 
 
 
 
 
 
 
 
