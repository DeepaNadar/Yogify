import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:yogify/source/constants/image_strings.dart';
import 'package:yogify/source/constants/sizes.dart';
import 'package:yogify/source/constants/text_strings.dart';
import 'package:yogify/source/features/authentication/screens/dashboard/dashboard.dart';
import 'package:yogify/source/features/authentication/screens/signup/signup_screen.dart';

class LoginFooterWidget extends StatelessWidget {
  const LoginFooterWidget({super.key});

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
      Navigator.push(context,MaterialPageRoute(builder: (context) => Dashboard()));
    }
  }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text("OR"),
        const SizedBox(
          height: tFormHeight - 20,
        ),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            icon: const Image(
              image: AssetImage(tGoogleLogoImage),
              width: 25.0,
            ),
            onPressed: () {
              signInWithGoogle();
            },
            label: const Text(tSignInWithGoogle),
          ),
        ),
        const SizedBox(
          height: tFormHeight - 20,
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SignUpScreen()),
                      );
          },
          child: Text.rich(TextSpan(
              text: tDontHaveAnAcc,
              style: Theme.of(context).textTheme.bodyText1,
              children:  [
                TextSpan(text: tSignup.toUpperCase(),style: const TextStyle(color: Colors.blue))
              ])),
        ),
      ],
    );
  }
}
