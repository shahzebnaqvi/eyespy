import 'dart:async';

import 'package:eyespy/Screens/Home_screen/home_screen.dart';
import 'package:eyespy/Screens/Vid_screens/vid_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../constants/color_constant.dart';
import '../Auth_screens/login_screen.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  final auth = FirebaseAuth.instance;
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      if (FirebaseAuth.instance.currentUser != null) {
        Navigator.pushAndRemoveUntil(
            (context),
            MaterialPageRoute(builder: (context) => const Home()),
            (route) => false);
      } else {
        // Navigator.pushAndRemoveUntil(
        //                   (context),
        //                   MaterialPageRoute(builder: (context) => const Login()),
        //                   (route) => false);
        Navigator.pushAndRemoveUntil(
            (context),
            MaterialPageRoute(builder: (context) => const VidScreen()),
            (route) => false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: Center(
        child: Image.asset('assest/images/logo.jpeg'),
      ),
    );
  }
}
