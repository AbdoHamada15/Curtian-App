import 'package:curtian_app/page_gallery/gallery_screen.dart';
import 'package:flutter/material.dart';
import 'package:curtian_app/page_profile/profile.dart';
//import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import 'page_admin/forms/login.dart';

class MainScreen2 extends StatefulWidget {
  const MainScreen2({super.key});

  @override
  State<MainScreen2> createState() => _MainScreen2State();
}

class _MainScreen2State extends State<MainScreen2> {
  int index = 1;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        bottomNavigationBar: SalomonBottomBar(
          currentIndex: index,
          margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          onTap: (selctedIndex) {
            setState(() {
              index = selctedIndex;
            });
          },
          backgroundColor: Colors.white60,
          items: [
            SalomonBottomBarItem(
                icon: SvgPicture.asset('assets/icons/lock.svg',
                    height: 30.0,
                    width: 30.0,
                    allowDrawingOutsideViewBox: true),
                title: const Text("Home"),
                selectedColor: Colors.purple),
            SalomonBottomBarItem(
                icon: SvgPicture.asset(
                  'assets/icons/home.svg',
                  height: 30.0,
                  width: 30.0,
                  allowDrawingOutsideViewBox: true,
                ),
                title: const Text("Home"),
                selectedColor: Colors.pink),
            SalomonBottomBarItem(
                icon: const Icon(Icons.search),
                title: const Text("Search"),
                selectedColor: Colors.orange),
            SalomonBottomBarItem(
                icon: SvgPicture.asset(
                  'assets/icons/navigation.svg',
                  height: 25.0,
                  width: 25.0,
                  allowDrawingOutsideViewBox: true,
                ),
                title: const Text("Profile"),
                selectedColor: Colors.teal)
          ],
        ),
        body: Container(
            decoration: const BoxDecoration(
              color: Color.fromRGBO(49, 39, 79, 1),
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(50),
              ),
            ),
            child: getSelectedWidget(index: index)));
  }

  Widget getSelectedWidget({required int index}) {
    Widget widget;
    switch (index) {
      case 1:
        widget = const GalleryScreen();
        break;
      case 2:
        widget = const Profile();
        break;
      case 0:
        widget = const LoginScreen();
        break;
      default:
        widget = const GalleryScreen();
        break;
    }
    return widget;
  }
}
