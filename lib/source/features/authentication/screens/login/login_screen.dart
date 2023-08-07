import 'package:flutter/material.dart';
import 'package:yogify/source/constants/sizes.dart';
import 'package:yogify/source/features/authentication/screens/login/login_footer_widget.dart';
import 'package:yogify/source/features/authentication/screens/login/login_form_widget.dart';
import 'package:yogify/source/features/authentication/screens/login/login_header_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(tDefaultSize),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const[
                LoginHeaderWidget(),
                LoginForm(),
                LoginFooterWidget()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
