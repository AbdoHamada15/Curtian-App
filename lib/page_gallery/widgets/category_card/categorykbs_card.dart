import 'package:flutter/material.dart';
import 'package:curtian_app/page_gallery/models/category/cat_kbs.dart';
import 'package:curtian_app/page_gallery/screen_view/category_view/categorykbs_view.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants/constants.dart';

class CategoryKbsCard extends StatelessWidget {
  final CategoryKbs categoryKbs;
  const CategoryKbsCard({super.key, required this.categoryKbs});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CategoryKbsView(
                              categoryKbs: categoryKbs,
                            )));
              },
              child: Hero(
                tag: categoryKbs.imageFileName,
                transitionOnUserGestures: true,
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.grey,
                            spreadRadius: 0.2,
                            blurRadius: 0.2,
                            offset: Offset(2, 2))
                      ]),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(categoryKbs.imageFileName)),
                ),
              ),
            ),
            Positioned(
              bottom: 1,
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  categoryKbs.title,
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        color: Colors.black,
                      ),
                ),
              ),
            ),
            Positioned(
              bottom: 3,
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
          ],
        ),
      ],
    );
    /*
          */
  }
}
