import 'package:flutter/material.dart';
import 'package:curtian_app/page_gallery/models/post.dart';
import 'package:flutter/cupertino.dart';
import 'package:curtian_app/page_gallery/constants/constants.dart';
import 'package:flutter_svg/svg.dart';

class PostView extends StatefulWidget {
  const PostView({super.key, required this.post});
  final Post post;

  @override
  State<PostView> createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Hero(
        tag: widget.post.imageFileName,
        transitionOnUserGestures: true,
        child: Stack(children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 40),
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
            ],
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
          Center(
              child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * .75,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              boxShadow: const [
                BoxShadow(
                  blurRadius: 30,
                  offset: Offset(-28, -28),
                  color: kwhiteColor,
                ),
                BoxShadow(
                  blurRadius: 30,
                  offset: Offset(28, 28),
                  color: Color.fromARGB(49, 255, 255, 255),
                ),
              ],
              image: DecorationImage(
                  image: AssetImage(widget.post.imageFileName),
                  fit: BoxFit.cover),
            ),
          )),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * .2,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: kwhiteColor.withOpacity(.9),
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(.2),
                        offset: const Offset(0, -4),
                        blurRadius: 8),
                  ]),
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: Row(children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(widget.post.imageFileName),
                      radius: 22.0,
                    ),
                    const SizedBox(
                      height: 28.0,
                      width: 5.0,
                    ),
                    Text(
                      widget.post.caption,
                      style:
                          const TextStyle(color: Colors.black, fontSize: 20.0),
                    ),
                    const SizedBox(
                      height: 28.0,
                      width: 150.0,
                    ),
                    InkWell(
                      onTap: () {},
                      child: SvgPicture.asset(
                        'assets/icons/favorite-border.svg',
                        height: 30.0,
                        width: 30.0,
                        allowDrawingOutsideViewBox: true,
                      ),
                    )
                  ]),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              widget.post.caption,
                              style: const TextStyle(
                                color: kPrimaryColor,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              widget.post.title,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(fontSize: 18),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/img/icons/category_4.png",
                                  width: 40,
                                  height: 40,
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  widget.post.likes,
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                const SizedBox(width: 16),
                                SvgPicture.asset(
                                  'assets/icons/clock.svg',
                                  height: 25.0,
                                  width: 25.0,
                                  allowDrawingOutsideViewBox: true,
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  widget.post.time,
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                Expanded(
                                    child: Container(
                                  alignment: Alignment.centerRight,
                                  child: Icon(
                                    widget.post.isBookmarked
                                        ? CupertinoIcons.bookmark_fill
                                        : CupertinoIcons.bookmark,
                                    size: 23,
                                    color: kgreyColor,
                                  ),
                                )),
                                Container(
                                  width: 70,
                                  height: 50,
                                  padding: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                  child: Padding(
                                      padding: const EdgeInsets.all(1),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          SvgPicture.asset(
                                            'assets/icons/star2.svg',
                                            height: 25.0,
                                            width: 25.0,
                                            allowDrawingOutsideViewBox: true,
                                          ),
                                          const Text(
                                            "4.8",
                                            style: TextStyle(
                                                color: Colors.amber,
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      )),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ]),
            ),
          )
        ]),
      ),
    ]));
  }
}
