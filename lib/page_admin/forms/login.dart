import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:curtian_app/page_admin/forms/form_email.dart';
import 'package:curtian_app/page_admin/forms/form_pass.dart';
import 'package:curtian_app/page_admin/forms/toast.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../page_gallery/constants/constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  bool isLoading = false;
  final TextEditingController _emailCon = TextEditingController();
  final TextEditingController _passwordCon = TextEditingController();

  signIn() async {
    try {
      setState(() {
        isLoading = true;
      });
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailCon.text.trim(), password: _passwordCon.text.trim());

      setState(() {
        isLoading = false;
      });
      // ignore: use_build_context_synchronously
      Navigator.pushNamed(context, 'adminmain');
      showToast(message: "Successfully signed in ${_emailCon.text.trim()}");
    } on FirebaseAuthException catch (e) {
      setState(() {
        isLoading = false;
      });
      if (e.code == 'user-not-found') {
        showToast(message: "No user found for that Email.");
      } else if (e.code == 'wrong-password') {
        showToast(message: "wrong Password provided for that user.");
      }
    } catch (e) {
      print(e);
    }
  }

  void openSignupScreen() {
    Navigator.of(context).pushReplacementNamed('signupScreen');
  }

  @override
  void dispose() {
    super.dispose();
    _emailCon.dispose();
    _passwordCon.dispose();
  }

  Future forgotPass() async {
    Navigator.of(context).pushNamed('forgotScreen');
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kwhiteColor,
      body: Container(
        height: size.height,
        width: size.height,
        decoration: const BoxDecoration(
            //color: isDarkMode ? const Color(0xff151f2c) : Colors.white,
            ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        SizedBox(
                          height: 350,
                          child: Stack(
                            children: <Widget>[
                              FadeInDown(
                                duration: const Duration(milliseconds: 1500),
                                child: Positioned(
                                    top: -18,
                                    height: 350,
                                    width: width,
                                    child: Container(
                                      decoration: const BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/img/background/background.png'),
                                              fit: BoxFit.fill)),
                                    )),
                              ),
                              FadeInDown(
                                duration: const Duration(milliseconds: 1500),
                                child: Positioned(
                                    height: 350,
                                    width: width,
                                    child: Container(
                                      decoration: const BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/img/background/background_2.png'),
                                              fit: BoxFit.fill)),
                                    )),
                              ),
                              Positioned(
                                  bottom: 5,
                                  right: 40,
                                  height: 100,
                                  width: 100,
                                  child: Container(
                                    decoration: const BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'assets/img/background/paris_2.png'),
                                            fit: BoxFit.contain)),
                                  )),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(
                        padding: const EdgeInsets.symmetric(horizontal: 35),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                children: [
                                  Text(
                                    'Login',
                                    style: GoogleFonts.poppins(
                                      color: Colors.black,
                                      fontSize: size.height * 0.042,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    '+',
                                    style: GoogleFonts.poppins(
                                      color: const Color(0xff3b22a1),
                                      fontSize: size.height * 0.04,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              FadeInUp(
                                duration: const Duration(milliseconds: 1500),
                                child: Column(
                                  children: <Widget>[
                                    FormEmailWidget(
                                      controller: _emailCon,
                                      hintText: "Email",
                                      isPasswordField: false,
                                      validator: (valuemail) {
                                        if (valuemail!.length < 5) {
                                          buildSnackError(
                                            'Invalid email',
                                            context,
                                            size,
                                          );
                                          return '';
                                        }
                                        if (!RegExp(
                                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+.[a-zA-Z]+")
                                            .hasMatch(valuemail)) {
                                          buildSnackError(
                                            'Invalid email',
                                            context,
                                            size,
                                          );
                                          return '';
                                        }
                                        return null;
                                      },
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    FormPassWidget(
                                      controller: _passwordCon,
                                      hintText: "Password",
                                      isPasswordField: true,
                                      validator: (valuepassword) {
                                        if (valuepassword!.length < 6) {
                                          buildSnackError(
                                            'Invalid password',
                                            context,
                                            size,
                                          );
                                          return '';
                                        }
                                        return null;
                                      },
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Column(
                                children: <Widget>[
                                  FadeInUp(
                                      duration:
                                          const Duration(milliseconds: 1500),
                                      child: Center(
                                          child: GestureDetector(
                                        onTap: forgotPass,
                                        child: TextButton(
                                            onPressed: () {},
                                            child: const Text(
                                              " ?Forgot Password",
                                              style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      196, 135, 198, 1)),
                                            )),
                                      ))),
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
                                              signIn();
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
                                              : const Text(
                                                  'Sign In',
                                                  style: TextStyle(
                                                      color: kwhiteColor,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 18),
                                                )),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 25,
                                  ),
                                  /*
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text('?Not yet a member ',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15)),
                                      GestureDetector(
                                        onTap: openSignupScreen,
                                        child: const Text('Sign up now',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15,
                                                decoration:
                                                    TextDecoration.underline)),
                                      ),
                                    ],
                                  )
                                  */
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                            ]))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> buildSnackError(
      String error, context, size) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 2),
        backgroundColor: const Color(0xff3b22a1),
        content: SizedBox(
          height: size.height * 0.02,
          child: Center(
            child: Text(error),
          ),
        ),
      ),
    );
  }
}
