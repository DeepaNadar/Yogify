import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:yogify/source/constants/text_strings.dart';
import 'package:yogify/source/features/authentication/screens/dashboard/dashboard.dart';



class LoginHeaderWidget extends StatelessWidget {
  const LoginHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          tLogin.toUpperCase(),
          style: Theme.of(context).textTheme.headline3,
        ),
        SizedBox(
          height: 10,
        ),
        //Image(image: const AssetImage(tFrontImage),height:size.height*0.2,),
        Text(
          
          tLoginTitle,
          style: Theme.of(context).textTheme.headline5,
        ),
        Text(
          tLoginSubTitle,
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ],
    );
  }
}
