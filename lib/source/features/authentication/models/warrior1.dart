import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:yogify/teachable.dart';
import 'package:yogify/source/constants/colors.dart';

class W1P extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Warrior-I Pose',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: tPrimaryColor,
      ),
      home: Warrior1Pose(title: 'TWarrior-I Pose'),
    );
  }
}

class Warrior1Pose extends StatefulWidget {
  Warrior1Pose({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _Warrior1PoseState createState() => _Warrior1PoseState();
}

class _Warrior1PoseState extends State<Warrior1Pose> {
  String pose = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Warrior-I Pose"),centerTitle: true,),
        body: Stack(
          children: [
            Container(
                child: Column(children: <Widget>[
              Expanded(
                child: Container(
                  child: Teachable(
                    path: "pose/index.html",
                    results: (res) {
                      var resp = jsonDecode(res);
                      // print("The values are ${}");
                      setState(() {
                        pose = (resp['warrior 1'] * 100.0).toString();
                      });
                    },
                  ),
                ),
              ),
            ])),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text(
                            "SCORE : ",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            pose,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ],
                  )),
            )
          ],
        ));
  }
}