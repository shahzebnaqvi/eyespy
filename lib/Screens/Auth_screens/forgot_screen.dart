import 'package:eyespy/constants/color_constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Forgot extends StatefulWidget {
  const Forgot({super.key});

  @override
  State<Forgot> createState() => _ForgotState();
}

class _ForgotState extends State<Forgot> {
  TextEditingController emailcontroller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  String? errorMessage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: Form(
        key: _formKey,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.only(left: 160, right: 160, top: 70),
                child: Center(child: Image.asset("assest/images/logo_2.png")),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 190, top: 40),
                child: Text("Forgot Password",
                    style: TextStyle(
                        fontFamily: "SemiBold", fontSize: 20, color: text)),
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
                      hintStyle: TextStyle(
                          fontFamily: 'Medium', fontSize: 13, color: black),
                      hintText: 'Email',
                    ),
                    style: TextStyle(
                        fontFamily: 'Medium', fontSize: 15, color: black),
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
                padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
                child: InkWell(
                  splashColor: background,
                  highlightColor: background,
                  onTap: () {
                    verifyEmail();
                  },
                  child: Container(
                    height: 37,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: accent,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: loading
                        ? Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CircularProgressIndicator(
                                color: black,
                                strokeWidth: 2,
                              ),
                            ),
                          )
                        : Center(
                            child: Text(
                            'Forgot',
                            style: TextStyle(
                                fontFamily: 'Bold', fontSize: 14, color: black),
                          )),
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }

  Future verifyEmail() async {
    if (_formKey.currentState!.validate()) {
      try {
        setState(() {
          loading = true;
        });

        await FirebaseAuth.instance
            .sendPasswordResetEmail(email: emailcontroller.text.trim());
        setState(() {
          loading = false;
        });

        Fluttertoast.showToast(msg: 'Password Reset Email Sent');
      } on FirebaseAuthException catch (e) {
        setState(() {
          loading = false;
        });

        print(e);
        Fluttertoast.showToast(msg: e.toString());
      }
    }
  }
}
