import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:staff_food/components/circular_progress.dart';
import 'package:staff_food/pages/order_list.dart';
class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late int counter=0;
  String Saying = "";
  Random random = Random();
  List<String> Sayings = [
    "#Markhor🦌",
    "#MeTheLoneWolf🐺",
    "#thuglife☠️👽⚔️🔪⛓",
    "#nothingbox🙇🤷🏽‍♂️🕸🎁",
    "#hakunamatata🐅",
    "#maulahjat🏋🏾‍⚔",
    "#deadman💀⚰️",
    "#deadwillriseagain⚔",
    "#istandalone👑",
    "#istandaloneforjustic🐅☘️",
    "#nøfate⚓️🚀⚰️",
    "#bornfreeandwild👅💪",
    "#bornfreeandlivefree🐅🐆🐈",
    "#brutaltactician🎖",
    "#holysinner🕊",
    "#devilhunter😇",
    "#khalaimakhlooq👻☠️😈🦅👽",
    "#aakhrichittan👻🚶🏽‍♂️🦁🐆🐅🌊🧗🏼‍♂️🥇🎖🏆🗻",
    "#KoiJalGiaKisiNayDuaDi👤🔥🎃☠️🤯😇🙏📦",
    "#ZakhmiDillJallaDon🤦🏻‍♂️🤕🔥💔👿☠️👻",
    "#WhatHappensToTheSoulsWhoLookInTheEyesOfDragon🦖🐉☃️🌊⛈💥🔥🌪🐲☠️👻"
  ];
  void loadingState(){
    Future.delayed(Duration(seconds: 2)).then((_){
      setState(() {
        counter+=25;
        Saying = Sayings[random.nextInt(18)];
      });
      loadingState();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadingState();
    Timer(Duration(seconds: 10),
            ()=>Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>
            OrderList()
            ))
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/phinux.jpg"),
            //fit: BoxFit.scaleDown,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgress(),
              SizedBox(height: 10.0,),
              Text(
                  'Loading $counter%',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                    color: Colors.blueAccent,
                  ),
              ),
              SizedBox(height: 10.0,),
              Text(
                '$Saying',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.green,
                ),
              ),
              SizedBox(height: 10.0,),
              Text('App powered by Muhammad Rameez',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.indigo,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
