import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:yogify/firebase_options.dart';
import 'package:yogify/source/features/authentication/screens/welcome_screen.dart';
import 'package:yogify/source/utils/theme/theme.dart';
import 'package:permission_handler/permission_handler.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: 'yogify',
    options: DefaultFirebaseOptions.currentPlatform);
  await Permission.camera.request();
  await Permission.microphone.request();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: TAppTheme.lightTheme,
        darkTheme: TAppTheme.darkTheme,
        themeMode: ThemeMode.light,
        debugShowCheckedModeBanner: false,
        home: const WelcomeScreen());
  }
}
