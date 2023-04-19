// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// //  create a Firestore instance which you can use to read and write data to and from the database.
// final FirebaseFirestore _firestore = FirebaseFirestore.instance;

// //Ui Profile
// class ProfileScreen extends StatefulWidget {
//   @override
//   _ProfileScreenState createState() => _ProfileScreenState();
// }

// class _ProfileScreenState extends State<ProfileScreen> {


// // Get the current user ID
//   String getCurrentUserId() {
//     User? currentUser = FirebaseAuth.instance.currentUser;
//     return currentUser!.uid;
//   }

//   bool isFollowing = false;

//   void _toggleFollow() {
//     setState(() {
//       isFollowing = !isFollowing;
//     });

//     // get the current user ID and pro player ID
//     final String userId = getCurrentUserId();
//     final String proPlayerId = widget.id ;

//     // update the pro players table
//     DocumentReference proPlayerRef =
//         _firestore.collection('proplayers').doc(proPlayerId);
//     proPlayerRef.update({
//       'followers':
//           isFollowing ? FieldValue.increment(1) : FieldValue.increment(-1),
//     });

//     // update the users table
//     DocumentReference userRef = _firestore.collection('users').doc(userId);
//     userRef.update({
//       'following': isFollowing
//           ? FieldValue.arrayUnion([proPlayerId])
//           : FieldValue.arrayRemove([proPlayerId]),
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Profile'),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: <Widget>[
//           CircleAvatar(
//             radius: 50,
//             backgroundImage: NetworkImage(
//               'https://via.placeholder.com/150',
//             ),
//           ),
//           SizedBox(height: 20),
//           Text(
//             'Pro Player Name',
//             style: TextStyle(
//               fontSize: 24,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           SizedBox(height: 20),
//           Text(
//             'Pro Player Description',
//             style: TextStyle(fontSize: 18),
//           ),
//           SizedBox(height: 20),
//           ElevatedButton(
//             onPressed: _toggleFollow,
//             child: Text(isFollowing ? 'Unfollow' : 'Follow'),
//           ),
//         ],
//       ),
//     );
//   }
// }
