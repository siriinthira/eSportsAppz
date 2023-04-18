import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FollowButton extends StatefulWidget {
  final String id;
  final String followers;

  FollowButton({
    required this.id,
    required this.followers,
  });

  @override
  _FollowButtonState createState() => _FollowButtonState();
}

class _FollowButtonState extends State<FollowButton> {
  bool isFollowing = false;

  void toggleFollow() {
    setState(() {
      if (isFollowing) {
        // decrease followers by 1
        FirebaseFirestore.instance
            .collection('proplayers')
            .doc(widget.id)
            .update(
                {'followers': (int.parse(widget.followers) - 1).toString()});
      } else {
        // increase followers by 1
        FirebaseFirestore.instance
            .collection('proplayers')
            .doc(widget.id)
            .update(
                {'followers': (int.parse(widget.followers) + 1).toString()});
      }
      isFollowing = !isFollowing;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test follower'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 150.0),
            child: ElevatedButton(
              onPressed: () {
                toggleFollow();
              },
              child: Text(
                isFollowing ? 'Unfollow' : 'Follow',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
