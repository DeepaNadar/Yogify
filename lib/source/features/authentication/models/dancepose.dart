import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:yogify/teachable.dart';
import 'package:yogify/source/constants/colors.dart';

class DP extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dance Pose',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: tPrimaryColor,
      ),
      home: DancePose(title: 'Dance Pose'),
    );
  }
}

class DancePose extends StatefulWidget {
  DancePose({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _DancePoseState createState() => _DancePoseState();
}

class _DancePoseState extends State<DancePose> {
  String pose = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Dance Pose"),centerTitle: true,),
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
                        pose = (resp['dance pose'] * 100.0).toString();
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
                            textAlign: TextAlign.center,
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