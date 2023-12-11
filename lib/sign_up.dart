// ignore_for_file: unused_import, unused_local_variable

// ignore_for_file: must_be_immutable

import 'package:abdo/Widgets/CustomEmailText.dart';
import 'package:abdo/Widgets/CustomTextPassword.dart';
import 'package:abdo/Widgets/CustomUserText.dart';
import 'package:abdo/home_page.dart';
import 'package:abdo/login_Page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String? email;
  Future signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    await FirebaseAuth.instance.signInWithCredential(credential);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return HomePage();
        },
      ),
    );
  }

  String? password;

  String? userName;

  String? confirmPassword;

  bool isLoading = false;

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: Padding(
            padding: const EdgeInsets.all(80),
            child: Text(
              'Sign Up',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        body: Container(
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8, top: 20),
                      child: Text(
                        'User Name',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      height: 4,
                    ),
                    CustomUserTextFiled(
                      hintText: 'Enter user name',
                    ),
                    Container(
                      height: 4,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8, top: 12),
                      child: Text(
                        'Email',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      height: 4,
                    ),
                    CustomEmailTextFiled(
                      hintText: 'Enter  email',
                      onChange: (data) {
                        email = data;
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8, top: 20),
                      child: Text(
                        'Password',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      height: 4,
                    ),
                    CustomPasswordTextFiled(
                      hintText: '  Enter Password',
                      onChange: (data) {
                        password = data;
                      },
                    ),
                    Container(
                      height: 4,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8, top: 20),
                      child: Text(
                        ' Confirm Password',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      height: 4,
                    ),
                    CustomPasswordTextFiled(
                      hintText: '  Enter Password again',
                    ),
                    Container(
                      height: 17,
                    ),
                    Center(
                        child: MaterialButton(
                      color: Colors.orange,
                      child: Text('signup'),
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          setState(() {
                            isLoading = true;
                          });
                          try {
                            await userRegister();
                            ShowSnackBar(context, 'Email already created');
                            navMethod(context);
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'weak-password') {
                              ShowSnackBar(context, 'Weak Password');
                            } else if (e.code == 'email-already-in-use') {
                              ShowSnackBar(context, 'Email already exsist');
                            }
                          } catch (e) {
                            print(e);
                          }
                          setState(() {
                            isLoading = false;
                          });
                          // ShowSnackBar(context, 'Email already created');
                        } else {}
                      },
                    )),
                    Container(
                      height: 15,
                    ),
                    Center(
                      child: Text(
                        'OR',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      height: 20,
                    ),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 35),
                          child: GestureDetector(
                            onTap: () {
                              signInWithGoogle();
                            },
                            child: Image.asset(
                              'assets/google.jpg',
                              width: 40,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 105),
                          child: Image.asset(
                            'assets/download.png',
                            width: 40,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 105),
                          child: Image.asset(
                            'assets/apple.jpg',
                            width: 40,
                          ),
                        ),

                        // Text('Already have an account?')
                      ],
                    ),
                    Container(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account?',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return Login();
                                },
                              ),
                            );
                          },
                          child: Text(
                            '  Login',
                            style: TextStyle(
                                color: Colors.orange,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void navMethod(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return Login();
        },
      ),
    );
  }

  void ShowSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$message'),
        backgroundColor: Colors.blue,
      ),
    );
  }

  Future<void> userRegister() async {
    var auth = FirebaseAuth.instance;
    UserCredential user = await auth.createUserWithEmailAndPassword(
        email: email!, password: password!);
  }
}
