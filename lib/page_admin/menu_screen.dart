import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:curtian_app/page_admin/forms/toast.dart';

import '../page_gallery/constants/constants.dart';

class MenuScreen extends StatefulWidget {
  final MenuItem currentItem;
  final ValueChanged<MenuItem> onSelectedItem;

  const MenuScreen(
      {Key? key, required this.currentItem, required this.onSelectedItem})
      : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class MenuItem {
  final String title;
  final IconData icon;

  const MenuItem(this.title, this.icon);
}

class MenuItems {
  static const home = MenuItem('Home', Icons.home);
  static const upload = MenuItem('Upload', Icons.file_upload);
  static const upload2 = MenuItem('Upload2', Icons.file_upload);
  static const notification = MenuItem('Notification', Icons.notifications);
  static const note = MenuItem('Add Note', Icons.note_alt_outlined);
  static const signup = MenuItem('Sign up', Icons.add_to_home_screen_sharp);

  static const all = <MenuItem>[
    home,
    upload,
    upload2,
    notification,
    note,
    signup
  ];
}

class _MenuScreenState extends State<MenuScreen> {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.indigo,
        body: SafeArea(
            child: Theme(
          data: ThemeData.dark(),
          child: Scaffold(
              backgroundColor: Colors.indigo,
              body: SafeArea(
                  child: Column(children: <Widget>[
                const CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage(
                    ('assets/img/background/abdo.png'),
                  ),
                ),
                const Spacer(),
                ...MenuItems.all.map(buildMenuItem).toList(),
                const Spacer(flex: 1),
                Text(
                  user.email!,
                  style: const TextStyle(fontSize: 12),
                ),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    FirebaseAuth.instance.signOut();
                    showToast(message: "Successfully signed out");
                    Navigator.of(context).pushNamed('mainscreen');
                  },
                  child: Container(
                    height: 45,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.indigoAccent,
                        borderRadius: BorderRadius.circular(20)),
                    child: const Center(
                      child: Text(
                        "Sign out",
                        style: TextStyle(
                            color: kwhiteColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                  ),
                )
              ]))),
        )));
  }

  Widget buildMenuItem(MenuItem item) => ListTileTheme(
        selectedColor: kwhiteColor,
        child: ListTile(
          selectedTileColor: Colors.black26,
          selected: widget.currentItem == item,
          minLeadingWidth: 70,
          title: Text(item.title),
          leading: Icon(item.icon),
          onTap: () => widget.onSelectedItem(item),
        ),
      );
}
