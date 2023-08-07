import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:yogify/source/constants/sizes.dart';
import 'package:yogify/source/constants/text_strings.dart';

import '../dashboard/dashboard.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();
    Future<void> _login() async {
      try {
        UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
        );
        // Navigate to home screen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Dashboard()),
        );
      } on FirebaseAuthException catch (e) {
        // Handle sign-in errors
      }
    }

    final _formKey = GlobalKey<FormState>();

    return Form(
      key: _formKey,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: tFormHeight - 10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          TextFormField(
            validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter an email address';
                  }
                  final emailRegex =
                      RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                  if (!emailRegex.hasMatch(value)) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
            controller: _emailController,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.email),
              labelText: tEmail,
              hintText: tEmail,
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(
            height: tFormHeight - 20,
          ),
          TextFormField(
            validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a password';
                  }
                  if (value.length < 6) {
                    return 'Password must be at least 6 characters';
                  }
                  return null;
                },
            controller: _passwordController,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.lock_outline),
              labelText: tPassword,
              hintText: tPassword,
              border: OutlineInputBorder(),
            ),
            obscureText: true,
          ),
          SizedBox(
            height: tFormHeight - 20,
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _login();
                }
              },
              child: Text(tLogin.toUpperCase()),
            ),
          ),
        ]),
      ),
    );
  }
}
