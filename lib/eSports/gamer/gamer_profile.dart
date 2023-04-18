import 'package:flutter/material.dart';

import '../profile/views/size_config.dart';
import '../profile/views/styles.dart';
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
  GamersModel? gamersData;
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

      await Future.delayed(Duration(seconds: 2));
      setState(() {
        isLoading = false;
      }); //rebuild line 42 after readData();
    });
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text(widget.id),
  //     ),
  //     body: isLoading
  //         ? Center(child: CircularProgressIndicator())
  //         : Text(gamersData.name),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      backgroundColor: kLighterWhite,
      body: Column(
        children: [
          if (isLoading) Center(child: CircularProgressIndicator()),
          Visibility(
            visible: !isLoading && gamersData != null,
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
              ),
              child: SafeArea(
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          height: 70,
                          width: 70,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(
                              kBorderRadius,
                            ),
                            child: Image.network(
                              gamersData?.image_url ?? '',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: SizeConfig.blockSizeHorizontal! * 2,
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    gamersData!.name,
                                    style: kPoppinsBold.copyWith(
                                        color: kDarkBlue,
                                        fontSize:
                                            SizeConfig.blockSizeHorizontal! *
                                                4),
                                  ),
                                  Text(
                                    widget.id,
                                    style: kPoppinsRegular.copyWith(
                                        color: kDarkBlue,
                                        fontSize:
                                            SizeConfig.blockSizeHorizontal! *
                                                3),
                                  )
                                ],
                              ),
                              Container(
                                constraints: BoxConstraints(
                                  maxHeight: 42,
                                  maxWidth:
                                      SizeConfig.blockSizeHorizontal! * 60,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    kBorderRadius,
                                  ),
                                  color: kBlue,
                                ),
                                child: Text(
                                  'Following',
                                  style: kPoppinsMedium.copyWith(
                                      color: kWhite,
                                      fontSize:
                                          SizeConfig.blockSizeHorizontal! * 3),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: SizeConfig.blockSizeVertical! * 2.5,
                    ),
                    Text(
                      gamersData!.experience,
                      style: kPoppinsMedium.copyWith(
                          color: Colors.black,
                          fontSize: SizeConfig.blockSizeHorizontal! * 4),
                    ),
                    SizedBox(
                      height: SizeConfig.blockSizeVertical! * 2.5,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.blockSizeHorizontal! * 3,
                        vertical: SizeConfig.blockSizeVertical! * 3.5,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(kBorderRadius),
                        color: kDarkBlue,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  gamersData!.followers.toString(),
                                  style: kPoppinsBold.copyWith(
                                      color: kWhite,
                                      fontSize:
                                          SizeConfig.blockSizeHorizontal! * 4),
                                ),
                                Text(
                                  'followers',
                                  style: kPoppinsMedium.copyWith(
                                      color: kWhite,
                                      fontSize:
                                          SizeConfig.blockSizeHorizontal! * 3),
                                )
                              ],
                            ),
                          ),
                          Container(
                            width: 1,
                            height: SizeConfig.blockSizeVertical! * 4,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2),
                              color: kLightBlue,
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  gamersData!.posts,
                                  style: kPoppinsBold.copyWith(
                                      color: kWhite,
                                      fontSize:
                                          SizeConfig.blockSizeHorizontal! * 4),
                                ),
                                Text(
                                  'Posts',
                                  style: kPoppinsMedium.copyWith(
                                      color: kWhite,
                                      fontSize:
                                          SizeConfig.blockSizeHorizontal! * 3),
                                )
                              ],
                            ),
                          ),
                          Container(
                            width: 1,
                            height: SizeConfig.blockSizeVertical! * 4,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2),
                              color: kLightBlue,
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  gamersData!.following,
                                  style: kPoppinsBold.copyWith(
                                      color: kWhite,
                                      fontSize:
                                          SizeConfig.blockSizeHorizontal! * 4),
                                ),
                                Text(
                                  'following',
                                  style: kPoppinsMedium.copyWith(
                                      color: kWhite,
                                      fontSize:
                                          SizeConfig.blockSizeHorizontal! * 3),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.blockSizeVertical! * 2.5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Games',
                          style: kPoppinsBold.copyWith(
                              color: kDarkBlue,
                              fontSize: SizeConfig.blockSizeHorizontal! * 3.8),
                        ),
                        Text(
                          'View All',
                          style: kPoppinsBold.copyWith(
                              color: kDarkBlue,
                              fontSize: SizeConfig.blockSizeHorizontal! * 3),
                        ),
                      ],
                    ),
                    SizedBox(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: 2,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          String gameName, gameImage;
                          if (index == 0) {
                            gameName = gamersData!.game;
                            gameImage = gamersData!.game_image;
                          } else {
                            gameName = gamersData!.game2;
                            gameImage = gamersData!.game2_image;
                          }
                          return Container(
                            height: 100,
                            margin: EdgeInsets.only(
                              bottom: SizeConfig.blockSizeVertical! * 2.5,
                            ),
                            child: Row(children: [
                              Container(
                                height: 100,
                                width: 100,
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    color: kWhite,
                                    borderRadius:
                                        BorderRadius.circular(kBorderRadius),
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 24,
                                        spreadRadius: 0,
                                        offset: const Offset(0, 3),
                                        color: kDarkBlue.withOpacity(0.051),
                                      )
                                    ]),
                                child: ClipRRect(
                                  borderRadius:
                                      BorderRadius.circular(kBorderRadius),
                                  child: Image.network(
                                    gameImage,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: SizeConfig.blockSizeVertical! * 2.5,
                              ),
                              Expanded(
                                  child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Interests',
                                    style: kPoppinsRegular.copyWith(
                                        color: kDarkBlue,
                                        fontSize:
                                            SizeConfig.blockSizeHorizontal! *
                                                2.5),
                                  ),
                                  SizedBox(
                                    height: SizeConfig.blockSizeVertical! * 1,
                                  ),
                                  Text(
                                    gameName,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: kPoppinsSemibold.copyWith(
                                        color: kDarkBlue,
                                        fontSize:
                                            SizeConfig.blockSizeHorizontal! *
                                                3),
                                  ),
                                  SizedBox(
                                    height: SizeConfig.blockSizeVertical! * 1,
                                  ),
                                ],
                              ))
                            ]),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
