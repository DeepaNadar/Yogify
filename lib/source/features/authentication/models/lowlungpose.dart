import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:yogify/teachable.dart';
import 'package:yogify/source/constants/colors.dart';

class LP extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Low Lunge Pose',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: tPrimaryColor,
      ),
      home: LowLunge(title: 'Low Lunge Pose'),
    );
  }
}

class LowLunge extends StatefulWidget {
  LowLunge({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _LowLungeState createState() => _LowLungeState();
}

class _LowLungeState extends State<LowLunge> {
  String pose = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Low Lunge Pose"),centerTitle: true,),
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
                        pose = (resp['low lunge'] * 100.0).toString();
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