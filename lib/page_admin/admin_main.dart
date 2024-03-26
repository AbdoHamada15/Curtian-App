import 'package:curtian_app/page_admin/pages/signup/sign_up.dart';
import 'package:curtian_app/page_admin/pages/upload/u1.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:curtian_app/page_admin/menu_screen.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:curtian_app/page_admin/pages/aboutUs.dart';
import 'package:curtian_app/page_admin/pages/home/home.dart';
import 'package:curtian_app/page_admin/pages/note/addNote.dart';
import 'pages/upload/upload3.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  final user = FirebaseAuth.instance.currentUser!;
  final zoomDrawerController = ZoomDrawerController();
  MenuItem currentItem = MenuItems.home;
  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      controller: zoomDrawerController,
      menuScreen: Builder(
        builder: (context) => MenuScreen(
            currentItem: currentItem,
            onSelectedItem: (item) {
              setState(() => currentItem = item);
              ZoomDrawer.of(context)!.close();
            }),
      ),
      mainScreen: getScreen(),
      shadowLayer1Color: Colors.blue.withOpacity(0.2),
      shadowLayer2Color: Colors.blue.withOpacity(0.4),
      showShadow: true,
      menuBackgroundColor: Colors.indigo,
      //style: DrawerStyle.style3,
      openCurve: Curves.fastOutSlowIn,
      closeCurve: Curves.bounceIn,
      borderRadius: 24.0,
      menuScreenWidth: 250,
      slideWidth: 250,
      drawerShadowsBackgroundColor: Colors.grey,
    );
  }

  Widget getScreen() {
    switch (currentItem) {
      case MenuItems.home:
        return const HomeAdmin();
      case MenuItems.upload:
        return const Upload3();
      case MenuItems.upload2:
        return const Upload4();
      case MenuItems.notification:
        return AboutUs();
      case MenuItems.note:
        return const AddNote();
      case MenuItems.signup:
        return const SignupScreen();
      default:
        return const HomeAdmin();
    }
  }
}
