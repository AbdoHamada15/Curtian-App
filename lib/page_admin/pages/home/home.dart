import 'package:curtian_app/page_admin/pages/upload/upload3.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:curtian_app/page_admin/menu.dart';

import 'package:curtian_app/page_admin/pages/note/addNote.dart';
import 'homeicon.dart';
//import 'package:paris_app_gallery/screens/admin/wid/toast.dart';

class HomeAdmin extends StatefulWidget {
  const HomeAdmin({super.key});

  @override
  State<HomeAdmin> createState() => _HomeAdminState();
}

class _HomeAdminState extends State<HomeAdmin> {
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const MenuWidget(),
        backgroundColor: Colors.indigo,
        title: const Text('Home', style: TextStyle(color: Colors.black)),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
              child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Transform.rotate(
                            origin: const Offset(30, -60),
                            angle: 2.4,
                            child: Container(
                              margin: const EdgeInsets.only(
                                left: 50,
                                top: 40,
                              ),
                              height: 500,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(80),
                                gradient: const LinearGradient(
                                  begin: Alignment.bottomLeft,
                                  colors: [
                                    Colors.indigo,
                                    Color.fromARGB(255, 144, 161, 254)
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 50),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Abdo Hamada',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 26,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  'Paris App Gallery   \n Curtian App  ',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 18),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          HomeWid(
                                            image:
                                                'assets/img/icons/upload.png',
                                            text: 'Upload Image',
                                            color: const Color(0xFF47B4FF),
                                            onTap: const Upload3(),
                                          ),
                                          HomeWid(
                                            image:
                                                'assets/img/icons/addnote.png',
                                            text: 'Add Note',
                                            color: const Color.fromARGB(
                                                255, 255, 133, 176),
                                            onTap: const AddNote(),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 50,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          HomeWid(
                                            image:
                                                'assets/img/background/abdo.png',
                                            text: 'Shopping',
                                            color: const Color(0xFFFD47DF),
                                            onTap: const AddNote(),
                                          ),
                                          HomeWid(
                                            image:
                                                'assets/img/background/abdo.png',
                                            text: 'Bills',
                                            color: const Color(0xFFFD8C44),
                                            onTap: const AddNote(),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  )))),
    );
  }
}
