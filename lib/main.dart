// import 'package:cryptoapp/models/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:hotel_flutter/navigasi.dart';
import 'package:hotel_flutter/components/bottomNav.dart';
import 'package:hotel_flutter/settings/sampah.dart';

// import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  // await MongoDatabase.connect();
  runApp(
    MaterialApp(
      // home: NavMain(),
      home: NavBottom(),
    ),
  );
}