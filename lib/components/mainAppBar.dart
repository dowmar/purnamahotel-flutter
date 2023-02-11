// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MainAppBar extends StatelessWidget with PreferredSizeWidget {
  String title;
  String subtitle;

  MainAppBar({
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        // padding: const EdgeInsets.symmetric(horizontal: 5.0),
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                  color: Colors.white.withOpacity(.64),
                  fontWeight: FontWeight.w400,
                  fontSize: 18),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  subtitle,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w400),
                ),
                (title == "Home")
                    ? IconButton(
                        onPressed: () {
                          // AuthService().signOutFromGoogle();
                        },
                        icon: Icon(
                          size: 25,
                          Icons.logout,
                          color: Colors.white,
                        ),
                      )
                    : IconButton(
                        onPressed: () {
                        
                        },
                        icon: Icon(
                          size: 25,
                          Icons.star,
                          color: Colors.white,
                        ),
                      )
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(100);
}
