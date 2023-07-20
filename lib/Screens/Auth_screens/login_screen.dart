
import 'package:eyespy/Screens/Auth_screens/signup_screen.dart';
import 'package:eyespy/constants/color_constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../Home_screen/home_screen.dart';
import 'forgot_screen.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
    TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
bool loading = false;
  String? errorMessage;
  User? users;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: background,

        body: Form(
          key: _formKey,
          child: SafeArea(
            child: SingleChildScrollView(

              child: Column(
                
                children: [
                  
                   Padding(
                     padding: const EdgeInsets.only(left: 160, right: 160, top: 70),
                     child: Center(child: Image.asset("assest/images/logo_2.png")),
                   ),
                  
                  Padding(
                    padding: const EdgeInsets.only(right: 180, top: 40),
                    child: Text("Welcome back!", style: TextStyle(fontFamily: "SemiBold", fontSize: 24, color: text)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 215),
                    child: Text("Login to your account", style: TextStyle(fontFamily: "Medium", fontSize: 13, color: textlight)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
                    child: Center(
                      child: TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: black),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: black),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: black),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: black),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: black),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: black),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            fillColor: background,
                            filled: true,
                            hintStyle: TextStyle(fontFamily: 'Medium', fontSize: 13, color: black),
                            hintText: 'Email',
                           
                          ),
                          style: TextStyle(fontFamily: 'Medium', fontSize: 15, color: black),
                          textAlign: TextAlign.start,
                          keyboardType: TextInputType.emailAddress,
                           validator: (value) {
                                  if (value!.isEmpty) {
                      return ("Please Enter Your Email");
                                  }
                                  // reg expression for email validation
                                  if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                        .hasMatch(value)) {
                      return ("Please Enter a valid email");
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  emailcontroller.text = value!;
                                },
                                cursorColor: accent,
                                textInputAction: TextInputAction.next,
                          controller: emailcontroller,
                          
                          
                          
                          
                        ),
                    ),
                  ),
                  Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
              child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: black),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: black),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: black),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: black),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: black),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: black),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      fillColor: background,
                      filled: true,
                      hintStyle: TextStyle(fontFamily: 'Medium', fontSize: 13, color: black),
                      hintText: 'Password',
                     
                    ),
                    style: TextStyle(fontFamily: 'Medium', fontSize: 15, color: black),
                    textAlign: TextAlign.start,
                    keyboardType: TextInputType.name,
                    obscureText: true,
                    cursorColor: accent,
                       validator: (value) {
              RegExp regex = RegExp(r'^.{6,}$');
              if (value!.isEmpty) {
                return ("Password is required for login");
              }
              if (!regex.hasMatch(value)) {
                return ("Enter Valid Password(Min. 6 Character)");
              }
              return null;
                      },
                      onSaved: (value) {
              passwordcontroller.text = value!;
                      },
                      textInputAction: TextInputAction.done,
                    controller: passwordcontroller,
                    
                    
                    
                    
                  ),
                      ),
                      Padding(
               padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
               child: InkWell(
                splashColor: background,
                highlightColor: background,
                onTap: (){signIn(emailcontroller.text, passwordcontroller.text);},
                 child: Container(
                  height: 37,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: accent,
                    borderRadius: BorderRadius.circular(8),
                    
                  ),
                  child: loading ? Center(child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircularProgressIndicator(color: black,strokeWidth: 2,),
                  ),) : Center(child: Text('Login', style: TextStyle(fontFamily: 'Bold', fontSize: 14, color: black),)),
                 ),
               ),
                       ),
                       Padding(
                         padding: const EdgeInsets.only(top: 20),
                         child: Center(child: InkWell(
                          onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> const Forgot()));},
                          child: Text('Forgot Password ?', style: TextStyle(fontFamily: 'Medium', fontSize: 14, color: textlight ),))),
                       ),
                       Padding(
                         padding: const EdgeInsets.only(top: 40),
                         child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('Don’t have an account ?', style: TextStyle(fontFamily: 'Medium', fontSize: 13, color: textlight)),
                            InkWell(
                              onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> const Signup()));},
                              child: Text('Sign Up', style: TextStyle(fontFamily: 'Bold', fontSize: 13, color: text, decoration: TextDecoration.underline))),
                          ],
                         ),
                       ),
                      
                ],

              ),
            ),
          ),
        ),
    );
  }
  void signIn(String email, String password) async {
    

if (_formKey.currentState!.validate()) {


    try {
       setState(() {
        loading = true;
      });
      
        _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((uid) =>
      {
          setState(() {
              loading = false;
            }),
              Fluttertoast.showToast(msg: "Login Successful"),
              Navigator.pushAndRemoveUntil(
                  (context),
                  MaterialPageRoute(builder: (context) => const Home()),
                      (route) => false),
           

      });

    }on FirebaseAuthException catch (error) {
        setState(() {
              loading = false;
            });
      switch (error.code) {
        case "user-not-found":
          errorMessage = "User with this email doesn't exist.";
          break;
        case "invalid-email":
          errorMessage = "Your email address appears to be malformed.";

          break;
        case "wrong-password":
          errorMessage = "Your password is wrong.";
          break;

        case "user-disabled":
          errorMessage = "User with this email has been disabled.";
          break;
        case "too-many-requests":
          errorMessage = "Too many requests";
          break;
        case "operation-not-allowed":
          errorMessage =
          "Signing in with Email and Password is not enabled.";
          break;
        default:
          errorMessage = "An undefined Error happened.";
      }
      Fluttertoast.showToast(msg: errorMessage!);
    }

}
  }
}