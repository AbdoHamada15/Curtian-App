import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HomeWid extends StatelessWidget {
  String image;
  String text;
  Color color;
  Widget onTap;

  HomeWid(
      {super.key,
      required this.image,
      required this.text,
      required this.color,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 177,
        width: 140,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: const Color(0x9F3D416E),
        ),
        child: Column(
          children: [
            Image.asset(
              image,
              width: 80,
              height: 100,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              text,
              style: TextStyle(color: color, fontSize: 18),
            ),
          ],
        ),
      ),
      onTap: () {
        onTap;
      },
    );
  }
}
