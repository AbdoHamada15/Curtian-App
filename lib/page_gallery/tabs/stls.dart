import 'package:animate_do/animate_do.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:curtian_app/page_gallery/models/category/cat_stls.dart';
import 'package:curtian_app/page_gallery/widgets/category_card/categorystls_card.dart';

class Stls extends StatefulWidget {
  const Stls({super.key});

  @override
  State<Stls> createState() => _StlsState();
}

class _StlsState extends State<Stls> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: FadeInUp(
        duration: const Duration(milliseconds: 1000),
        child: SizedBox(
          child: CarouselSlider.builder(
            itemCount: categoriesStls.length,
            itemBuilder: (context, index, realIndex) => CategoryStlsCard(
              categoryStls: categoriesStls[index],
            ),
            options: CarouselOptions(
                scrollDirection: Axis.horizontal,
                aspectRatio: 1.2,
                viewportFraction: 0.6,
                padEnds: true,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 4),
                reverse: false,
                initialPage: 0,
                enlargeStrategy: CenterPageEnlargeStrategy.scale,
                enableInfiniteScroll: true,
                enlargeCenterPage: true,
                disableCenter: true,
                onPageChanged: (index, reason) {
                  setState(() {
                    currentIndex = index;
                  });
                }
                //autoPlayCurve: Curves.elasticIn,
                ),
          ),
        ),
      ),
    );
  }
}
