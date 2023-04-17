// ignore_for_file: prefer_const_constructors

import 'dart:collection';
import 'package:flutter/material.dart';

class AboutGame extends StatelessWidget {
  const AboutGame({super.key});

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
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 122.0,
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            // เว้นช่อง
            SizedBox(height: 7),

            Padding(
              padding: const EdgeInsets.all(15.0),
              child: RichText(
                text: TextSpan(
                  style: Theme.of(context).textTheme.headline6,
                  children: [
                    TextSpan(
                      text: 'About : ',
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    const TextSpan(text: 'Counter-Strike 2'),
                  ],
                ),
              ),
            ),

            // ค้นหา

            // เว้นช่อง
            SizedBox(height: 1),

            //------------------------------------TYPE CS2
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Image.asset(
                    'images/cs2.jpg',
                    height: 190,
                    width: 350,
                  ),
                ],
              ),
            ),
            // เว้นช่อง
            SizedBox(height: 10),

            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Color(0xFFF0F0F1),
                  borderRadius: BorderRadius.circular(30)),
              child: Center(
                // ignore: prefer_const_constructors
                child: Text(
                  '\n Counter-Strike 2(CS2) is a 2023 multiplayer tactical first-person shooter developed by Valve . It is the 5 game in the Counter-Strike series. Developed for over three years, CS2 was released for Windows 10 - 11, Valve still regularly updates the game, both with smaller balancing patches and larger content additions.\n',
                  style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              ),
            ),

            // เว้นช่อง
            SizedBox(height: 25),

            InkWell(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 240, 240, 241),
                      borderRadius: BorderRadius.circular(30)),
                  child: Center(
                    // ignore: prefer_const_constructors
                    child: Text(
                      '\nName : Counter Strike 2 \n\nGenre(s)	 : Tactical first-person shooter \n\nPublisher(s) : Valve\n\nRelease : 2023\n\nEngine : Source\n\nType : FPS\n\nMode(s) : Multiplayer\n',
                      style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ),
                ),
              ),
            ),
            //----------------------
          ]),
        ),
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
