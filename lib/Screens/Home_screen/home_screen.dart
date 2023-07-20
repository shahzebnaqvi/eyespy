import 'package:eyespy/constants/color_constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../Auth_screens/login_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
        children: [
             Padding(
               padding: const EdgeInsets.only(left: 40, right: 40),
               child: InkWell(
                splashColor: background,
                highlightColor: background,
                onTap: (){},
                 child: Container(
                  height: 43,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: accent,
                    borderRadius: BorderRadius.circular(8),
                    
                  ),
                  child: Center(child: Text('Live Streming', style: TextStyle(fontFamily: 'Bold', fontSize: 14, color: black),)),
                 ),
               ),
                       ),
                       Padding(
               padding: const EdgeInsets.only(left: 40, right: 40, top: 20),
               child: InkWell(
                splashColor: background,
                highlightColor: background,
                onTap: (){},
                 child: Container(
                  height: 43,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: accent,
                    borderRadius: BorderRadius.circular(8),
                    
                  ),
                  child: Center(child: Text('Recording', style: TextStyle(fontFamily: 'Bold', fontSize: 14, color: black),)),
                 ),
               ),
                       ),
                        Padding(
               padding: const EdgeInsets.only(left: 40, right: 40, top: 20),
               child: InkWell(
                splashColor: background,
                highlightColor: background,
                onTap: (){_signOut();},
                 child: Container(
                  height: 43,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: accent,
                    borderRadius: BorderRadius.circular(8),
                    
                  ),
                  child: Center(child: Text('Logout', style: TextStyle(fontFamily: 'Bold', fontSize: 14, color: black),)),
                 ),
               ),
                       ),
                      
        ],
      )),
    );
  }
  Future<void> _signOut() async {
  await FirebaseAuth.instance.signOut();
  Fluttertoast.showToast(msg: 'Logout Successful');
   Navigator.pushAndRemoveUntil(
                      (context),
                      MaterialPageRoute(builder: (context) => const Login()),
                      (route) => false);
}
}
