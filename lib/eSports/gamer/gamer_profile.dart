import 'package:flutter/material.dart';

import 'gamers_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class GamerProfile extends StatefulWidget {
  GamerProfile({super.key, required this.id});

  final String id;

  @override
  State<GamerProfile> createState() => _GamerProfileState();
}

class _GamerProfileState extends State<GamerProfile> {
  late GamersModel gamersData;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    readData();
  }

  Future<void> readData() async {
    await Firebase.initializeApp().then((value) async {
      print("Initialize Success");
      var x = await FirebaseFirestore.instance
          .collection('proplayers')
          .doc(widget.id)
          .get();

      x.data();
      GamersModel model = GamersModel.fromMap(x.data()!, x.id);
      gamersData = model;

      await Future.delayed(Duration(seconds: 3));
      setState(() {
        isLoading = false;
      }); //rebuild line 42 after readData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.id),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Text(gamersData.url),
    );
  }
}
