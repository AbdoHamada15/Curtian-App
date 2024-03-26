//import 'dart:async';

import 'package:flutter/material.dart';
import 'package:curtian_app/page_gallery/models/story.dart';

class StoryView extends StatefulWidget {
  final Story story;
  const StoryView({super.key, required this.story});

  @override
  State<StoryView> createState() => _StoryViewState();
}

class _StoryViewState extends State<StoryView> {
  static double percent = 0.0;

  //late Timer _timer;
/*
  void startTimer() {
    _timer = Timer.periodic(const Duration(microseconds: 10), (timer) {
      setState(() {
        percent += 0.001;
        if (percent > 1) {
          _timer.cancel();
          Navigator.pop(context);
        }
      });
    });
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }
  */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Hero(
        tag: widget.story.imageFileName,
        transitionOnUserGestures: true,
        child: Container(
          margin: const EdgeInsets.only(top: 80),
          height: MediaQuery.of(context).size.height - 25.0,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            boxShadow: const [
              BoxShadow(
                blurRadius: 20,
                color: Color(0x1a5282FF),
              )
            ],
            image: DecorationImage(
                image: AssetImage(widget.story.imageFileName),
                fit: BoxFit.fitHeight),
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
                  backgroundImage: AssetImage(widget.story.imageFileName),
                  radius: 25.0,
                ),
                const SizedBox(
                  height: 28.0,
                  width: 5.0,
                ),
                Text(
                  widget.story.title,
                  style: const TextStyle(color: Colors.black, fontSize: 20.0),
                )
              ],
            )
          ],
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
