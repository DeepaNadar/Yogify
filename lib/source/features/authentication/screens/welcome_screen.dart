import 'package:flutter/material.dart';
import 'package:yogify/source/constants/image_strings.dart';
import 'package:yogify/source/constants/sizes.dart';
import 'package:yogify/source/constants/text_strings.dart';
import 'package:yogify/source/features/authentication/screens/login/login_screen.dart';
import 'package:yogify/source/features/authentication/screens/signup/signup_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var brightness = mediaQuery.platformBrightness;
    var height = mediaQuery.size.height;
    //final isDarkMode=brightness==Brightness.dark;
    return Scaffold(
        body: Container(
      padding: EdgeInsets.all(tDefaultSize),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image(image: AssetImage(tWelcomeScreenImage), height: height * 0.5),
          Column(
            children: [
              Text(tWelcomeTitle, style: Theme.of(context).textTheme.headline4),
              Text(
                tWelcomeSubTitle,
                style: Theme.of(context).textTheme.bodyText1,
                textAlign: TextAlign.center,
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                  child: Text(tLogin.toUpperCase()),
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpScreen()),
                    );
                  },
                  child: Text(tSignup.toUpperCase()),
                ),
              ),
            ],
          )
        ],
      ),
    ));
  }
}
