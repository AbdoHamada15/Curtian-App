import 'package:flutter/material.dart';
import 'package:curtian_app/page_gallery/models/category/cat_oima.dart';

class CategoryOimaView extends StatefulWidget {
  final CategoryOima categoryOima;

  const CategoryOimaView({super.key, required this.categoryOima});

  @override
  State<CategoryOimaView> createState() => _CategoryOimaViewState();
}

class _CategoryOimaViewState extends State<CategoryOimaView> {
  static double percent = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Hero(
        tag: widget.categoryOima.imageFileName,
        transitionOnUserGestures: true,
        child: Container(
          margin: const EdgeInsets.only(top: 140),
          width: double.infinity,
          height: 600.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            boxShadow: const [
              BoxShadow(
                blurRadius: 20,
                color: Color(0x1a5282FF),
              )
            ],
            image: DecorationImage(
                image: AssetImage(widget.categoryOima.imageFileName),
                fit: BoxFit.cover),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 36.0, horizontal: 8.0),
        child: Column(
          children: [
            LinearProgressIndicator(
              value: percent,
            ),
            const SizedBox(
              height: 8.0,
            ),
            Row(
              children: [
                const SizedBox(
                  height: 10.0,
                ),
                Container(
                  color: Colors.white60,
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Image.asset(
                      "assets/img/icons/fast-forward.gif",
                      width: 60,
                      height: 35,
                    ),
                  ),
                ),
                CircleAvatar(
                  backgroundImage:
                      AssetImage(widget.categoryOima.imageFileName),
                  radius: 25.0,
                ),
                const SizedBox(
                  height: 28.0,
                  width: 5.0,
                ),
                Text(
                  widget.categoryOima.title,
                  style: const TextStyle(color: Colors.black, fontSize: 20.0),
                )
              ],
            )
          ],
        ),
      ),
      Positioned(
        top: 150,
        left: 10,
        child: Container(
          width: 50,
          height: 30,
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Colors.orange,
            borderRadius: BorderRadius.circular(18),
          ),
          child: const Padding(
              padding: EdgeInsets.all(1),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.white,
                    size: 12,
                  ),
                  Text(
                    "4.8",
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  )
                ],
              )),
        ),
      ),
      Positioned(
          top: 40,
          left: 1,
          child: Container(
            color: Colors.white60,
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                alignment: Alignment.topLeft,
                child: Image.asset(
                  "assets/img/icons/download.gif",
                  width: 70,
                  height: 40,
                ),
              ),
            ),
          )),
    ]));
  }
}
