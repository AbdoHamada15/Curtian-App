import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:curtian_app/page_admin/forms/form_email.dart';
import 'package:curtian_app/page_admin/forms/toast.dart';

import '../../page_gallery/constants/constants.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _emailCon = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  Future verifyEmail() async {
    try {
      setState(() {
        isLoading = true;
      });
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailCon.text.trim());
      showToast(message: "Password Reset Email Sent");
      setState(() {
        isLoading = false;
      });
      // ignore: use_build_context_synchronously
      Navigator.of(context).pop();
    } on FirebaseAuthException catch (e) {
      setState(() {
        isLoading = false;
      });
      print(e);
    }
  }

  @override
  void dispose() {
    super.dispose();
    _emailCon.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kwhiteColor,
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
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
                      const SizedBox(
                        height: 15,
                      )

                      //sign in button
                      ,
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(20)),
                          child: ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                                minimumSize: const Size.fromHeight(50)),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                verifyEmail();
                              }
                            },
                            icon: const Icon(Icons.email_outlined),
                            label: Text(
                              ' Reset Password',
                              style: GoogleFonts.robotoCondensed(
                                color: kwhiteColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ]),
              ),
            ),
          ),
        ));
  }
}
