import 'package:curtian_app/page_gallery/constants/constants.dart';
import 'package:curtian_app/page_gallery/models/post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:curtian_app/page_gallery/screen_view/post_view.dart';

class PostCard extends StatelessWidget {
  final Post post;
  const PostCard({
    super.key,
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PostView(
                      post: post,
                    )));
      },
      child: SizedBox(
        child: Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: kwhiteColor,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.3),
                blurRadius: 4.0,
                spreadRadius: .05,
              ), //BoxShadow
            ],
          ),
          child: Stack(
            children: [
              Positioned(
                  right: 5,
                  left: 5,
                  child: Image.asset(
                    post.imageFileName,
                    height: 230,
                  )),
              Positioned(
                  child: Container(
                alignment: Alignment.topRight,
                child: SvgPicture.asset(
                  'assets/icons/fav1.svg',
                  height: 30.0,
                  width: 30.0,
                  allowDrawingOutsideViewBox: true,
                ),
              )),
              Positioned(
                left: 1,
                right: 1,
                bottom: 0,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          post.caption,
                          style: const TextStyle(
                            color: kprimaryColor,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          post.title,
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(fontSize: 12),
                        ),
                        const SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/img/icons/category_4.png",
                              width: 25,
                              height: 25,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              post.likes,
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            const SizedBox(width: 16),
                            SvgPicture.asset(
                              'assets/icons/clock.svg',
                              height: 13.0,
                              width: 13.0,
                              allowDrawingOutsideViewBox: true,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              post.time,
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 3,
                left: 3,
                child: Container(
                  width: 35,
                  height: 20,
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
                            color: kwhiteColor,
                            size: 8,
                          ),
                          Text(
                            "4.8",
                            style: TextStyle(color: kwhiteColor, fontSize: 8),
                          )
                        ],
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
