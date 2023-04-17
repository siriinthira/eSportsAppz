// ignore_for_file: prefer_const_constructors

import 'dart:collection';
import 'package:flutter/material.dart';

import 'Aboutgame.dart';
import 'GamesCat.dart';
import 'GamesCat2.dart';
import 'GamesCat3.dart';

class GamesRec extends StatelessWidget {
  const GamesRec({super.key});

  @override
  Widget build(BuildContext context) {
    var decoration = Decoration;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0x00B42323),
        elevation: 0.0,
        flexibleSpace: ClipPath(
          clipper: _customCliper(),
          child: Container(
            height: 150,
            width: MediaQuery.of(context).size.width,
            color: Color(0xFF19202d),
            child: Center(
              child: Text(
                'Games Category',
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
              ),
            ),
          ),
        ),
        toolbarHeight: 100,
      ),
      // extendBodyBehindAppBar: false,
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          // ค้นหา

          // หมวดหมู่1
          Row(
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => GamesCat()));
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Color(0xFFCE3038),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Center(
                    child: Text('FPS',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15)),
                  ),
                ),
              ),

              // หมวดหมู่2
              InkWell(
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Color(0xFFCE3038),
                          borderRadius: BorderRadius.circular(30)),
                      child: Center(
                        child: Text(
                          'TEAMPLAY',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => GamesCat2()));
                  }),

              // หมวดหมู่3
              InkWell(
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Color(0xFFCE3038),
                          borderRadius: BorderRadius.circular(30)),
                      child: Center(
                        child: Text(
                          'ADVENTURE',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => GamesCat3()));
                  }),

              // หมวดหมู่4
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Color(0xFFCE3038),
                      borderRadius: BorderRadius.circular(30)),
                  child: Center(
                    child: Text(
                      'MOBA',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                  ),
                ),
              ),
            ],
          ),

          // เว้นช่อง
          SizedBox(height: 7),

          Padding(
            padding: const EdgeInsets.all(7.0),
            child: RichText(
              text: TextSpan(
                style: Theme.of(context).textTheme.headline6,
                children: [
                  TextSpan(
                    text: 'Recommend ',
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  const TextSpan(text: 'For You !'),
                ],
              ),
            ),
          ),

          // เว้นช่อง
          SizedBox(height: 10),

          // ค้นหา

          // เว้นช่อง
          SizedBox(height: 3),

          //รูป 1
          InkWell(
              child: Image.asset(
                'images/cs2.jpg',
                height: 199,
                width: 350,
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AboutGame()));
              }),

          // เว้นช่อง
          SizedBox(height: 7),

          //รูป 2 , 3
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'images/val.png',
                height: 100,
                width: MediaQuery.of(context).size.width / 2,
                fit: BoxFit.cover,
              ),
              Image.asset(
                'images/da.jpg',
                height: 100,
                width: MediaQuery.of(context).size.width / 2,
                fit: BoxFit.cover,
              ),
            ],
          ),

          // เว้นช่อง
          SizedBox(height: 5),

          // รูป 4, 5
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,

            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Image.asset(
                'images/tk0.jpg',
                height: 100,
                width: MediaQuery.of(context).size.width / 2,
                fit: BoxFit.cover,
              ),
              Image.asset(
                'images/ron.jpg',
                height: 106,
                width: MediaQuery.of(context).size.width / 2,
                fit: BoxFit.cover,
              ),
            ],
          ),

          //รูป 6
          Center(
            child: Image.asset(
              'images/dz.jpg',
              height: 175,
              width: 355,
            ),
          ),

          // เว้นช่อง
          SizedBox(height: 100),
          Center(
            child: Text(
              "Check More in ' Games Category ' ",
              style: TextStyle(
                color: Color.fromARGB(255, 132, 136, 143),
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
            ),
          ),
          // เว้นช่อง
          SizedBox(height: 5),
          Center(
            child: Text(
              "Updated 07/04/2023' ",
              style: TextStyle(
                color: Color.fromARGB(255, 132, 136, 143),
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

class _customCliper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double height = size.height;
    double width = size.width;

    var path = Path();

    path.lineTo(0, height - 50);
    path.quadraticBezierTo(width / 2, height, width, height - 50);
    path.lineTo(width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
