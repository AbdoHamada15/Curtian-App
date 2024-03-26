import 'package:curtian_app/page_gallery/gallery_screen.dart';
import 'package:flutter/material.dart';
import 'package:curtian_app/page_profile/profile.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_svg/svg.dart';

import 'page_admin/forms/login.dart';
//import 'page_admin/pages/note/addNote.dart';
import 'page_gallery/constants/constants.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int index = 1;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        bottomNavigationBar: CurvedNavigationBar(
          color: kwhiteColor,
          buttonBackgroundColor: kwhiteColor,
          backgroundColor: Colors.white60,
          items: [
            SvgPicture.asset(
              'assets/icons/lock.svg',
              height: 25.0,
              width: 25.0,
              allowDrawingOutsideViewBox: true,
            ),
            SvgPicture.asset(
              'assets/icons/home.svg',
              height: 30.0,
              width: 30.0,
              allowDrawingOutsideViewBox: true,
            ),
            SvgPicture.asset(
              'assets/icons/navigation.svg',
              height: 25.0,
              width: 25.0,
              allowDrawingOutsideViewBox: true,
            ),
          ],
          animationCurve: Curves.easeInOut,
          animationDuration: const Duration(milliseconds: 200),
          index: index,
          onTap: (selctedIndex) {
            setState(() {
              index = selctedIndex;
            });
          },
          height: 50.0,
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
