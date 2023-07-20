import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../Module/user_modle.dart';
import '../../constants/color_constant.dart';
import '../Home_screen/home_screen.dart';
import 'login_screen.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
      TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController cpasswordcontroller = TextEditingController();
   final _formKey = GlobalKey<FormState>();
bool loading = false;
final _auth = FirebaseAuth.instance;
  // string for displaying the error Message
  String? errorMessage;
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
                    padding: const EdgeInsets.only(right: 240, top: 40),
                    child: Text("Welcome", style: TextStyle(fontFamily: "SemiBold", fontSize: 24, color: text)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 215),
                    child: Text("Create your account", style: TextStyle(fontFamily: "Medium", fontSize: 13, color: textlight)),
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
                      hintText: 'Confirm Password',
                     
                    ),
                    style: TextStyle(fontFamily: 'Medium', fontSize: 15, color: black),
                    textAlign: TextAlign.start,
                    keyboardType: TextInputType.name,
                    obscureText: true,
                    cursorColor: accent,
                       validator: (value) {
              
              if (value!.isEmpty) {
                return ("Field Required");
              }
              if (value != passwordcontroller.text) {
                return ("Not Match");
              }
              return null;
                      },
                      onSaved: (value) {
              cpasswordcontroller.text = value!;
                      },
                      textInputAction: TextInputAction.done,
                    controller: cpasswordcontroller,
                    
                    
                    
                    
                  ),
                      ),
                      Padding(
               padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
               child: InkWell(
                splashColor: background,
                highlightColor: background,
                onTap: (){signUp(emailcontroller.text, passwordcontroller.text);},
                 child: Container(
                  height: 37,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: accent,
                    borderRadius: BorderRadius.circular(8),
                    
                  ),
                  child: loading ? Center(child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircularProgressIndicator(color: black, strokeWidth: 2,),
                  ),) : Center(child: Text('Sign up', style: TextStyle(fontFamily: 'Bold', fontSize: 14, color: black),)),
                 ),
               ),
                       ),
                      
                       Padding(
                         padding: const EdgeInsets.only(top: 40),
                         child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('Already have an account ?', style: TextStyle(fontFamily: 'Medium', fontSize: 13, color: textlight)),
                            InkWell(
                              onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> const Login()));},
                              child: Text('Login', style: TextStyle(fontFamily: 'Bold', fontSize: 13, color: text, decoration: TextDecoration.underline))),
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
  void signUp(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        loading = true;
      });
      try {
        await _auth
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((value) => {postDetailsToFirestore()})
            // ignore: body_might_complete_normally_catch_error
            .catchError((e) {
          Fluttertoast.showToast(msg: e!.message);
        });
      } on FirebaseAuthException catch (error) {
         setState(() {
          loading = false;
        });
        switch (error.code) {
          case "invalid-email":
            errorMessage = "Your email address appears to be malformed.";
            break;
          case "wrong-password":
            errorMessage = "Your password is wrong.";
            break;
          case "user-not-found":
            errorMessage = "User with this email doesn't exist.";
            break;
          case "user-disabled":
            errorMessage = "User with this email has been disabled.";
            break;
          case "too-many-requests":
            errorMessage = "Too many requests";
            break;
          case "operation-not-allowed":
            errorMessage = "Signing in with Email and Password is not enabled.";
            break;
          default:
            errorMessage = "An undefined Error happened.";
        }
        Fluttertoast.showToast(msg: errorMessage!);
      }
    }
  }

  postDetailsToFirestore() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    UserModel userModel = UserModel();

    // writing all the values
    userModel.email = user!.email;
    userModel.uid = user.uid;
   
    
    await firebaseFirestore
        .collection("UsersDetails")
        .doc(user.uid)
        .set(userModel.toMap());
       
       Fluttertoast.showToast(msg: "Created Successful");
      Navigator.pushAndRemoveUntil(
          (context),
          MaterialPageRoute(builder: (context) => const Home()),
              (route) => false);
      setState(() {

      });

  }
}