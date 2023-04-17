import 'package:app/eSports/profile/views/profile.dart';
import 'package:app/eSports/profile/views/styles.dart';
import 'package:flutter/material.dart';
import 'cartoon/show_cartoon_list.dart';

import 'eSports/newblog/views/newblog.dart';
import 'eSports/reccomend/views/GamesRec.dart';
import 'flutter_firebase_test1/data.dart';
import 'eSports/blogchat/views/blogchat.dart';
import 'eSports/newblog/views/newblog_post.dart';
import 'eSports/gamer/gamers.dart';
import 'eSports/news/views/news.dart';
import 'eSports/reccomend/views/reccomend.dart';
import 'eSports/sponsor/sponsors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:app/eSports/authentication/views/LoginPage.dart';
import 'package:flutter_gif/flutter_gif.dart';
import 'dart:async';

// import 'firebase_options.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      // home: GamesRec(),

      //home: DataHome(), //flutter_firebase_test1
      // home: const ShowCartoonList(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _imageIndex = 0;
  List<String> _imageList = [
    'images/game1.gif',
    'images/game2.gif',
    'images/game3.gif'
  ];

  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _stopTimer();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      setState(() {
        _imageIndex = (_imageIndex + 1) % _imageList.length;
      });
    });
  }

  void _stopTimer() {
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/bluecity.gif"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Expanded(
              flex: 2,
              child: Center(
                child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    return SizedBox(
                      height: constraints.maxHeight,
                      width: constraints.maxWidth,
                      child: Image.asset(
                        'images/transparent.png',
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                ),
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 18.0),
              child: FloatingActionButton.extended(
                onPressed: () {
                  // Add your onPressed code here!
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
                },
                label: const Text('Join Us'),
                icon: const Icon(Icons.sports_esports),
                backgroundColor: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*
update on github
 git add *
 git commit -m "Add existing file"
 git push origin main
 */

/*

        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 110.0),
            child: InkWell(
                child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(30)),
                    child: const Center(
                      child: Text(
                        'Join A Community',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    )),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
                }),
          ),
        ]));
  }
}

 */