
// Userlist

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:hexcolor/hexcolor.dart';
// import 'package:machinetestt/View/widgets/alertbox.dart';
// import 'package:machinetestt/View/widgets/bottomsheet.dart';
//
// class UserLists extends StatefulWidget {
//   UserLists({Key? key}) : super(key: key);
//
//   @override
//   State<UserLists> createState() => _UserListsState();
// }
//
// class _UserListsState extends State<UserLists> {
//   final CollectionReference usersCollection =
//   FirebaseFirestore.instance.collection('users');
//
//   late List<Map<String, dynamic>> allUsers = []; // New list to hold all users
//   late List<Map<String, dynamic>> foundUsers = []; // List to hold filtered users
//   late bool isOlder = false;
//
//
//   @override
//
//   void _sortUsers(bool? isOlder) {
//     setState(() {
//       if (isOlder == null) {
//         foundUsers = List.from(allUsers);
//       } else {
//         this.isOlder = isOlder;
//         foundUsers.sort((a, b) {
//           final ageA = int.parse(a['age'].toString());
//           final ageB = int.parse(b['age'].toString());
//           if (isOlder) {
//             return ageB.compareTo(ageA);
//           } else {
//             return ageA.compareTo(ageB);
//           }
//         });
//    }
//       });
//     }
//
//   // void _sortUsers(bool isOlder) {
//   //   setState(() {
//   //     this.isOlder = isOlder;
//   //     foundUsers.sort((a, b) {
//   //       final ageA = int.parse(a['age'].toString());
//   //       final ageB = int.parse(b['age'].toString());
//   //       if (isOlder) {
//   //         return ageB.compareTo(59);
//   //       } else {
//   //         return ageA.compareTo(60);
//   //       }
//   //     });
//   //   });
//   // }
//
//
//
//   void initState() {
//     super.initState();
//     _fetchUsers();
//   }
//
//   Future<void> _fetchUsers() async {
//     final snapshot = await usersCollection.get();
//     setState(() {
//       allUsers = snapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
//       foundUsers = List.from(allUsers); // Initialize foundUsers with all users initially
//     });
//   }
//
//   void _runFilter(String enteredKeyword) {
//     if (enteredKeyword.isEmpty) {
//       setState(() {
//         foundUsers = List.from(allUsers); // Reset foundUsers to all users when search is empty
//       });
//       return;
//     }
//     setState(() {
//       foundUsers = allUsers.where((user) =>
//           user["name"].toString().toLowerCase().contains(enteredKeyword.toLowerCase())).toList();
//     });
//
// }
//
//   @override
//   Widget build(BuildContext context) {
//     final height = MediaQuery.of(context).size.height;
//     final width = MediaQuery.of(context).size.width;
//
//     return Scaffold(
//       backgroundColor: HexColor("#EBEBEB"),
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         backgroundColor: HexColor("#100E09"),
//         title: Row(
//           children: [
//             const Icon(
//               Icons.location_pin,
//               color: Colors.white,
//             ),
//             Expanded(
//               child: Text(
//                 "Nilambur",
//                 style: TextStyle(color: Colors.white, fontSize: height * 0.02),
//               ),
//             )
//           ],
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 12),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(
//               height: height * 0.017,
//             ),
//             Row(
//               children: [
//                 Expanded(
//                   child: TextFormField(
//                     keyboardType: TextInputType.text,
//                     onChanged: _runFilter,
//                     decoration: InputDecoration(
//                       contentPadding: EdgeInsets.symmetric(vertical: 12),
//                       enabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(25),
//                         borderSide: BorderSide(
//                           strokeAlign: BorderSide.strokeAlignInside,
//                           color: HexColor("#000000").withOpacity(0.5),
//                         ),
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(25),
//                         borderSide: const BorderSide(color: Colors.grey),
//                       ),
//                       prefixIcon: const Padding(
//                         padding: EdgeInsets.only(left: 15, right: 14),
//                         child: Icon(
//                           Icons.search,
//                           size: 29,
//                         ),
//                       ),
//                       hintText: "Search by name",
//                       hintStyle: TextStyle(
//                         color: Colors.black.withOpacity(0.4),
//                         fontFamily: GoogleFonts.montserrat().fontFamily,
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   width: width * 0.034,
//                 ),
//                 IconButton(
//                   style: ButtonStyle(
//                     backgroundColor:
//                     MaterialStateProperty.all(HexColor("#100E09")),
//                     shape: MaterialStateProperty.all(
//                       RoundedRectangleBorder(
//                         side: BorderSide.none,
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                     ),
//                   ),
//                   onPressed: () {
//                     settingModalBottomSheet(context,isOlder,_sortUsers);
//                     ;
//                   },
//                   icon: const Icon(
//                     Icons.filter_list,
//                     color: Colors.white,
//                     size: 26,
//                   ),
//                 )
//               ],
//             ),
//             SizedBox(
//               height: height * 0.018,
//             ),
//             Padding(
//               padding: const EdgeInsets.only(left: 4),
//               child: Text(
//                 "Users Lists",
//                 style: TextStyle(
//                   color: Colors.black,
//                   fontWeight: FontWeight.bold,
//                   fontSize: 17,
//                   fontFamily: GoogleFonts.montserrat().fontFamily,
//                 ),
//               ),
//             ),
//             const SizedBox(
//               height: 5,
//             ),
//             Expanded(
//               child: StreamBuilder<QuerySnapshot>(
//                   stream: usersCollection.snapshots(),
//                   builder: (context, snapshot) {
//                     if (!snapshot.hasData) {
//                       return const CircularProgressIndicator();
//                     }
//                     final docs = snapshot.data!.docs;
//                   return ListView.builder(
//                     physics: const BouncingScrollPhysics(),
//                     itemCount: foundUsers.length,
//                     itemBuilder: (context, index) {
//                       final user = foundUsers[index];
//
//                       if ((isOlder && int.parse(user['age'].toString()) > 59) ||
//                           (!isOlder && int.parse(user['age'].toString()) <
//                               60)) {
//                         return Card(
//                           color: HexColor("#FFFFFF"),
//                           child: ListTile(
//                             leading: CircleAvatar(
//                               radius: 25,
//                               backgroundImage: NetworkImage(user["image"]),
//                             ),
//                             title: Text(
//                               user["name"],
//                               style: const TextStyle(
//                                   fontWeight: FontWeight.w500),
//                             ),
//                             subtitle: Text(
//                               user["age"],
//                               style: const TextStyle(
//                                   fontWeight: FontWeight.w400),
//                             ),
//                           ),
//                         );
//                       }
//                     });
//                 }
//               ),
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 15),
//         child: FloatingActionButton(
//           onPressed: () {
//             showDialog(
//               context: context,
//               builder: (context) {
//                 return AlertBox();
//               },
//             );
//           },
//           backgroundColor: HexColor("#100E09"),
//           shape: const CircleBorder(),
//           child: const Center(
//             child: Icon(
//               Icons.add,
//               color: Colors.white,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }