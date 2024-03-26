// ignore_for_file: use_build_context_synchronously

import 'package:animate_do/animate_do.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:curtian_app/page_admin/forms/user_auth/animation.dart';
import 'package:curtian_app/page_admin/forms/form_email.dart';
import 'package:curtian_app/page_admin/forms/form_pass.dart';
import 'package:curtian_app/page_admin/forms/toast.dart';

import '../../../page_gallery/constants/constants.dart';
import '../../menu.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  final _emailCon = TextEditingController();
  final _passwordCon = TextEditingController();
  final _confirmPasswordCon = TextEditingController();
  signUp() async {
    if (passwordConfirmed()) {
      try {
        setState(() {
          isLoading = true;
        });
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailCon.text.trim(),
          password: _passwordCon.text.trim(),
        );
        Navigator.of(context).pushNamed('loginScreen');
        showToast(message: "Successfully signed in ${_emailCon.text.trim()}");

        setState(() {
          isLoading = false;
        });
      } on FirebaseAuthException catch (e) {
        setState(() {
          isLoading = false;
        });
        if (e.code == 'weak-password') {
          showToast(message: "The Password provided is too weak.");
        } else if (e.code == 'email-already-in-use') {
          showToast(message: "the Account already exists for that Email.");
        }
      } catch (e) {
        setState(() {
          isLoading = false;
        });
        print(e);
      }
    } else {
      showToast(message: "Confirmed Password is Error");
    }
  }

  bool passwordConfirmed() {
    if (_confirmPasswordCon.text.trim() == _passwordCon.text.trim()) {
      return true;
    } else {
      showToast(message: "Confirmed Password is Error");
      return false;
    }
  }

  void openSigninScreen() {
    Navigator.of(context).pushReplacementNamed('loginScreen');
  }

  @override
  void dispose() {
    super.dispose();
    _emailCon.dispose();
    _passwordCon.dispose();
    _confirmPasswordCon.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: const MenuWidget(),
        backgroundColor: const Color.fromRGBO(49, 39, 79, 1),
        title: const Text(
          'Add New Admin',
          style: TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: kwhiteColor,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FadeAnimation(
                      1.5,
                      Column(
                        children: <Widget>[
                          SizedBox(
                            height: 380,
                            child: Stack(
                              children: <Widget>[
                                Positioned(
                                  top: 0,
                                  height: 330,
                                  width: width,
                                  child: FadeInUp(
                                      duration: const Duration(seconds: 1),
                                      child: Container(
                                        decoration: const BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    'assets/img/background/background.png'),
                                                fit: BoxFit.fill)),
                                      )),
                                ),
                                Positioned(
                                  height: 330,
                                  width: width,
                                  child: FadeInUp(
                                      duration:
                                          const Duration(milliseconds: 1000),
                                      child: Container(
                                        decoration: const BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    'assets/img/background/background_2.png'),
                                                fit: BoxFit.fill)),
                                      )),
                                ),
                                Positioned(
                                  bottom: 40,
                                  right: 40,
                                  height: 100,
                                  width: 100,
                                  child: FadeInUp(
                                      duration:
                                          const Duration(milliseconds: 1000),
                                      child: Container(
                                        decoration: const BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    'assets/img/background/paris_2.png'),
                                                fit: BoxFit.contain)),
                                      )),
                                )
                              ],
                            ),
                          ),
                        ],
                      )),
                  Container(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            FadeInUp(
                                duration: const Duration(milliseconds: 1500),
                                child: const Text(
                                  "SIGN UP",
                                  style: TextStyle(
                                      color: Color.fromRGBO(49, 39, 79, 1),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30),
                                )),
                            const SizedBox(
                              height: 20,
                            ),
                            FadeInUp(
                              duration: const Duration(milliseconds: 1700),
                              child: Column(
                                children: <Widget>[
                                  FormEmailWidget(
                                    controller: _emailCon,
                                    hintText: "Email",
                                    isPasswordField: false,
                                    validator: (text) {
                                      if (text == null || text.isEmpty) {
                                        return 'Email is Empty';
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  FormPassWidget(
                                    controller: _passwordCon,
                                    hintText: "Password",
                                    isPasswordField: true,
                                    validator: (text) {
                                      if (text == null || text.isEmpty) {
                                        return 'Password is Empty';
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  FormPassWidget(
                                    controller: _confirmPasswordCon,
                                    hintText: "Confirm Password",
                                    isPasswordField: true,
                                    validator: (text) {
                                      if (text == null || text.isEmpty) {
                                        return 'Confirm Password is Empty';
                                      }
                                      return null;
                                    },
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            FadeInUp(
                              duration: const Duration(milliseconds: 1700),
                              child: Column(
                                children: <Widget>[
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: SizedBox(
                                      width: double.infinity,
                                      height: 45,
                                      child: ElevatedButton(
                                          onPressed: () {
                                            if (_formKey.currentState!
                                                .validate()) {
                                              signUp();
                                            }
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                const Color.fromARGB(
                                                    255,
                                                    109,
                                                    66,
                                                    110), // Background color
                                          ),
                                          child: isLoading
                                              ? const Center(
                                                  child:
                                                      CircularProgressIndicator(
                                                  color: kwhiteColor,
                                                ))
                                              : Text(
                                                  'Sign Up',
                                                  style: GoogleFonts
                                                      .robotoCondensed(
                                                    color: kwhiteColor,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18,
                                                  ),
                                                )),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 25,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('Already a member? ',
                                          style: GoogleFonts.robotoCondensed(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                          )),
                                      GestureDetector(
                                        onTap: openSigninScreen,
                                        child: Text('Sign in here',
                                            style: GoogleFonts.robotoCondensed(
                                              color: Colors.blue,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                              decoration:
                                                  TextDecoration.underline,
                                            )),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),

                            /*
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: GestureDetector(
                      onTap: () {
                        _signInWithGoogle();
                      },
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            color: Colors.amberAccent,
                            borderRadius: BorderRadius.circular(20)),
                        child: const Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                FontAwesomeIcons.google,
                                color: Colors.redAccent,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Sign in with Google",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
            */
                          ]))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
