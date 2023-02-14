//  child: Container(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           children: [
//             SizedBox(
//               width: 120,
//               height: 120,
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(100),
//                 child: Image.network(
//                   photoUrl,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             Text(
//               user!.displayName!,
//               style: GoogleFonts.openSans(
//                 fontSize: 22,
//                 color: Colors.white,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             Text(
//               user!.email!,
//               style: GoogleFonts.openSans(
//                 fontSize: 14,
//                 color: Colors.white,
//                 fontWeight: FontWeight.normal,
//               ),
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             SizedBox(
//               width: 200,
//               height: 40,
//               child: ElevatedButton(
//                 style: TextButton.styleFrom(
//                   backgroundColor: Colors.green.shade500,
//                 ),
//                 onPressed: () async {
//                   imagetest =
//                       await _picker.pickImage(source: ImageSource.camera);
//                   setState(() {
//                     selectedImage = File(imagetest!.path);
//                     uploadData(selectedImage);
//                   });

//                   // print(user!);
//                 },
//                 child: Text('Edit Image'),
//               ),
//             ),
//             const SizedBox(
//               height: 30,
//             ),
//             const Divider(),
//             _ProfileMenu(
//               title: "About",
//               icon: LineAwesomeIcons.info,
//               textColor: Colors.lightBlue,
//               onPress: () {
//                 showDialogAbout();
//               },
//             ),
//             const Divider(
//               color: Colors.grey,
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             _ProfileMenu(
//               title: "Logout",
//               icon: LineAwesomeIcons.alternate_sign_out,
//               textColor: Colors.red,
//               endIcon: false,
//               onPress: () {
//                 AuthService().signOutFromGoogle();
//               },
//             ),
//           ],
//         ),
//       ),