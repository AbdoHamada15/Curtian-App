import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../page_gallery/constants/constants.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Profile> {
  final double coverHeight = 280;
  final double profileHeight = 150;
  _launch(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print("Not supported");
    }
  }

  final Uri whatsapp = Uri.parse('https://wa.me/+201027867463');
  final Uri face = Uri.parse('https://wa.me/+201027867463');
  final Uri insta = Uri.parse('https://wa.me/+201027867463');
  final Uri messenger = Uri.parse('https://www.youtube.com/');
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      padding: const EdgeInsets.only(top: 30),
      children: <Widget>[
        buildTop(),
        buildContent(),
      ],
    ));
  }

  Widget buildTop() {
    final top = coverHeight - profileHeight / 2;
    final bottom = coverHeight / 2;
    return Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          FadeInUp(
            duration: const Duration(milliseconds: 1000),
            child: Container(
              margin: EdgeInsets.only(bottom: bottom),
              child: buildCoverImage(),
            ),
          ),
          Positioned(
            top: top,
            child: buildProfileImage(),
          ),
        ]);
  }

  Widget buildContent() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(children: [
          Center(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: kwhiteColor,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: const [
                    BoxShadow(
                        blurRadius: 5,
                        color: Color.fromARGB(165, 244, 238, 238))
                  ]),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Abdo Hamada',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  //SizedBox( height: 8,),
                  Text(
                    'Flutter Software Engineer',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'assets/fonts/AvenirLTProBook.otf'),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Center(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: kwhiteColor,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: const [
                    BoxShadow(
                        blurRadius: 5,
                        color: Color.fromARGB(165, 244, 238, 238))
                  ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FadeInUp(
                    duration: const Duration(milliseconds: 1000),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            _launch(
                                'https://www.instagram.com/abdo_hamada157/ ');
                            //do what you want here
                          },
                          child: const CircleAvatar(
                            backgroundColor: kwhiteColor,
                            radius: 28,
                            child: Icon(
                              FontAwesomeIcons.instagram,
                              color: Colors.redAccent,
                              size: 40,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 14,
                        ),
                        GestureDetector(
                          onTap: () {
                            _launch('https://wa.me/+201027867463');
                            //do what you want here
                          },
                          child: const CircleAvatar(
                            backgroundColor: kwhiteColor,
                            radius: 28,
                            child: Icon(
                              FontAwesomeIcons.whatsapp,
                              color: Colors.green,
                              size: 40,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 14,
                        ),
                        GestureDetector(
                          onTap: () {
                            _launch('tel:01027867463');
                            //do what you want here
                          },
                          child: const CircleAvatar(
                            backgroundColor: kwhiteColor,
                            radius: 28,
                            child: Icon(
                              FontAwesomeIcons.phone,
                              color: Colors.green,
                              size: 28,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 14,
                        ),
                        GestureDetector(
                          onTap: () {
                            _launch('https://m.me/abdo.hamada.509');
                            //do what you want here
                          },
                          child: const CircleAvatar(
                            backgroundColor: kwhiteColor,
                            radius: 28,
                            child: Icon(
                              FontAwesomeIcons.facebookMessenger,
                              color: Colors.blue,
                              size: 39,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 14,
                        ),
                        GestureDetector(
                          onTap: () {
                            _launch(
                                'https://www.facebook.com/abdo.hamada.509?mibextid=ZbWKwL');
                            //do what you want here
                          },
                          child: const CircleAvatar(
                            backgroundColor: kwhiteColor,
                            radius: 28,
                            child: Icon(
                              FontAwesomeIcons.facebook,
                              color: Colors.blue,
                              size: 39,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(30),
            decoration: const BoxDecoration(
              color: kwhiteColor,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                topLeft: Radius.circular(20),
              ),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: EdgeInsets.all(1.0),
                    child: Column(
                      children: [
                        Text(
                          "About",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'assets/fonts/AvenirLTProBook.otf'),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "تطبيق ستائر باريس                           البرنامج خاص بعرض الصور الستائر والديكورات وتسجيل بيانات الخاصة بالعملاء             ",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              fontFamily:
                                  'assets/fonts/NotoKufiArabic-Black.ttf'),
                        )
                      ],
                    ))
              ],
            ),
          )
        ]),
      );
/*Container(
  padding:EdgeInsets.all(10),
  color: Colors.blue,
  child: RichText(text:TextSpan(children: <TextSpan>[
    TextSpan(text:"About" style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: 'assets/fonts/AvenirLTProBook.otf'),)
    TextSpan(text:"تطبيق ستائر باريس                            :  البرنامج خاص بعرض الصور الستائر والديكورات وتسجيل بيانات الخاصة بالعملاء             ",
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                fontFamily: 'assets/fonts/AvenirLTProBook.otf'),)
  ]))

) */
  Widget buildCoverImage() => Container(
      color: const Color.fromARGB(255, 202, 197, 197),
      child: Image.asset(
        'assets/img/background/paris_2.png',
        width: double.infinity,
        height: coverHeight,
        fit: BoxFit.contain,
      ));

  Widget buildProfileImage() => const CircleAvatar(
      radius: 90,
      backgroundColor: Color.fromRGBO(249, 250, 250, 1),
      backgroundImage: AssetImage(
        ('assets/img/background/abdo2.png'),
      ));
}
