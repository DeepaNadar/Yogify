import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:yogify/source/constants/colors.dart';
import 'package:yogify/source/constants/image_strings.dart';
import 'package:yogify/source/constants/sizes.dart';
import 'package:yogify/source/features/authentication/models/dancepose.dart';
import 'package:yogify/source/features/authentication/models/mountpose.dart';
import 'package:yogify/source/features/authentication/models/lowlungpose.dart';
import 'package:yogify/source/features/authentication/models/treepose.dart';
import 'package:yogify/source/features/authentication/models/warrior1.dart';
import 'package:yogify/source/features/authentication/models/warrior2.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {


final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<void> _signOut() async {
    try {
      await _auth.signOut();

      await _googleSignIn.signOut();

      Navigator.of(context).pop(); 
    } catch (e) {
      print("Error during sign out: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    final txtTheme = Theme.of(context).textTheme;
    return Scaffold(
        appBar: AppBar(
          leading: const Icon(null),
          title: const Text(
            "Yoga Postures",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          actions: [
            Container(
              margin: const EdgeInsets.only(right: 5, top: 3),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: tPrimaryColor),
              child: IconButton(
                onPressed: () {
                  _signOut();
                },
                icon: Icon(Icons.logout),
             ),
            )
          ],
        ),
        body: SingleChildScrollView(
              child: Container(
                      padding: const EdgeInsets.all(tDashboardPadding),
                      child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                     //Text("Namaste, Deepa", style: txtTheme.headline6),
                //     Text(
                //       tDashboardHeading,
                //       style: txtTheme.headlineSmall,
                //     ),
                const SizedBox(height: tDashboardPadding),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: tCardBgColor),
                        padding:
                            const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Flexible(
                                    child: Image(
                                      image: AssetImage(tdancepose),
                                      width: 100.0,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Natarajasana",
                                style: txtTheme.bodyText1,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                "Dance Pose",
                                style: txtTheme.bodyText2,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => DP()),
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      elevation: 5,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            12), // <-- Radius
                                      ),
                                    ),
                                    child: const Text("Start"),
                                  ))
                            ]),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: tCardBgColor),
                          padding:
                              const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children:const [
                                    Flexible(
                                      child: Image(
                                        image: AssetImage(ttreepose),
                                        width: 60.0,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Vrikshasana",
                                  style: txtTheme.bodyText1,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  "Tree Pose",
                                  style: txtTheme.bodyText2,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => TP()),
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                        elevation: 5,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              12), // <-- Radius
                                        ),
                                      ),
                                      child: const Text("Start"),
                                    ))
                              ]),
                        ),
                      ],
                    )),
                  ],
                ),
                const SizedBox(height: tDashboardPadding),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: tCardBgColor),
                        padding:
                            const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Flexible(
                                    child: Image(
                                      image: AssetImage(tlowlunge),
                                      width: 100.0,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Anjaneyasana",
                                style: txtTheme.bodyText1,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                "Low Lunge Pose",
                                style: txtTheme.bodyText2,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => LP()),
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      elevation: 5,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            12), // <-- Radius
                                      ),
                                    ),
                                    child: const Text("Start"),
                                  ))
                            ]),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: tCardBgColor),
                          padding:
                              const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Flexible(
                                      child: Image(
                                        image: AssetImage(tmountainpose),
                                        width: 50.0,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Tadasana",
                                  style: txtTheme.bodyText1,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  "Mountain Pose",
                                  style: txtTheme.bodyText2,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => MP()),
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                        elevation: 5,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              12), // <-- Radius
                                        ),
                                      ),
                                      child: const Text("Start"),
                                    ))
                              ]),
                        ),
                      ],
                    )),
                  ],
                ),
                const SizedBox(height: tDashboardPadding),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: tCardBgColor),
                        padding:
                            const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Flexible(
                                    child: Image(
                                      image: AssetImage(twarrior1),
                                      width: 80.0,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Virabhadrasana-I",
                                style: txtTheme.bodyText1,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                "Warrior-I Pose",
                                style: txtTheme.bodyText2,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => W1P()),
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      elevation: 5,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            12), // <-- Radius
                                      ),
                                    ),
                                    child: const Text("Start"),
                                  ))
                            ]),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: tCardBgColor),
                          padding:
                              const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Flexible(
                                      child: Image(
                                        image: AssetImage(twarrior2),
                                        width: 115.0,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Virabhadrasana-II",
                                  style: txtTheme.bodyText1,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  "Warrior-II Pose",
                                  style: txtTheme.bodyText2,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => W2P()),
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                        elevation: 5,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              12), // <-- Radius
                                        ),
                                      ),
                                      child: const Text("Start"),
                                    ))
                              ]),
                        ),
                      ],
                    )),
                  ],
                )
              ],
                      ),
                    ),
            ));
  }
}
