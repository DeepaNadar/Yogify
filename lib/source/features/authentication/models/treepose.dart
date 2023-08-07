import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:yogify/teachable.dart';
import 'package:yogify/source/constants/colors.dart';

class TP extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tree Pose',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: tPrimaryColor,
      ),
      home: TreePose(title: 'Tree Pose'),
    );
  }
}

class TreePose extends StatefulWidget {
  TreePose({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _TreePoseState createState() => _TreePoseState();
}

class _TreePoseState extends State<TreePose> {
  String pose = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Tree Pose"),centerTitle: true,),
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
                        pose = (resp['tree pose'] * 100.0).toString();
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