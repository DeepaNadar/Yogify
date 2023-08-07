import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:yogify/source/constants/sizes.dart';
import 'package:yogify/source/constants/text_strings.dart';
import 'package:yogify/source/features/authentication/screens/dashboard/dashboard.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class SignFormWidget extends StatelessWidget {
  const SignFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();
    final TextEditingController _fullnameController = TextEditingController();

    Future<void> _signup() async {
      try {
        UserCredential userCredential =
            await _auth.createUserWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Dashboard()),
        );
        // Navigate to home screen
      } on FirebaseAuthException catch (e) {
        // Handle sign-up errors
      }
    }

    final _formKey = GlobalKey<FormState>();

    return Container(
        padding: const EdgeInsets.symmetric(vertical: tFormHeight - 10),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your full name.';
                  }
                  return null;
                },
                controller: _fullnameController,
                decoration: InputDecoration(
                  label: Text(tFullName),
                  hintText: tFullName,
                  prefixIcon: Icon(Icons.person_outline_rounded),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: tFormHeight - 20,
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter an email address';
                  }
                  final emailRegex =
                      RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                  if (!emailRegex.hasMatch(value)) {
                    return 'Please enter a valid email address';
                  }
                },
                controller: _emailController,
                decoration: InputDecoration(
                  label: Text(tEmail),
                  hintText: tEmail,
                  prefixIcon: Icon(Icons.email),
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
                height: tFormHeight - 10,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _signup();
                    }
                  },
                  child: Text(tSignup.toUpperCase()),
                ),
              ),
            ],
          ),
        ));
  }
}
