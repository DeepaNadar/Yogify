import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:yogify/source/common_widgets/forms/form_header_widget.dart';
import 'package:yogify/source/constants/image_strings.dart';
import 'package:yogify/source/constants/sizes.dart';
import 'package:yogify/source/constants/text_strings.dart';
import 'package:yogify/source/features/authentication/screens/dashboard/dashboard.dart';
import 'package:yogify/source/features/authentication/screens/login/login_screen.dart';
import 'package:yogify/source/features/authentication/screens/signup/signup_form_widget.dart';


class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    signInWithGoogle() async{
    GoogleSignInAccount? googleUser=await GoogleSignIn().signIn();
    GoogleSignInAuthentication? googleAuth=await googleUser?.authentication;
    AuthCredential credential=GoogleAuthProvider.credential(
      accessToken:googleAuth?.accessToken ,
      idToken: googleAuth?.idToken,
    );
    UserCredential userCredential=await FirebaseAuth.instance.signInWithCredential(credential);

    //print(userCredential.user?.displayName);
    if(userCredential.user!=null){
      Navigator.push(context,MaterialPageRoute(builder: (context) => const Dashboard()));
    }
  }
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FormHeaderWidget(
                    heading: tSignup.toUpperCase(),
                    title: tSignUpTitle,
                    subtitle: tSignUpSubTitle),
                SignFormWidget(),
                Column(
                  children: [
                    const Text("OR"),
                    SizedBox(
                      height: tFormHeight - 20,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton.icon(
                        onPressed: () {
                          signInWithGoogle();
                        },
                        icon: Image(
                          image: AssetImage(tGoogleLogoImage),
                          width: 25.0,
                        ),
                        label: Text("Sign-In with Google"),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                      },
                      child: Text.rich(TextSpan(
                          text: tAlreadyHaveAnAccount,
                          style: Theme.of(context).textTheme.bodyText1,
                          children: [
                            TextSpan(
                                text: tLogin.toUpperCase(),
                                style: TextStyle(color: Colors.blue))
                          ])),
                    ),
                  ],
                )
              ],
            )),
      )),
    );
  }
}
