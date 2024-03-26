import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../models/category/category.dart';

class MoreCategory extends StatefulWidget {
  final Category category;
  const MoreCategory({super.key, required this.category});

  @override
  State<MoreCategory> createState() => _MoreCategoryState();
}

class _MoreCategoryState extends State<MoreCategory> {
  final CarouselController _carouselController = CarouselController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int currentIndex = 0;
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(widget.category.imageFileName,
                    fit: BoxFit.cover)),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.3,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                      Colors.grey.shade50.withOpacity(1),
                      Colors.grey.shade50.withOpacity(1),
                      Colors.grey.shade50.withOpacity(1),
                      Colors.grey.shade50.withOpacity(1),
                      Colors.grey.shade50.withOpacity(0.0),
                      Colors.grey.shade50.withOpacity(0.0),
                      Colors.grey.shade50.withOpacity(0.0),
                      Colors.grey.shade50.withOpacity(0.0),
                    ])),
              ),
            ),
            Positioned(
              bottom: 50,
              height: MediaQuery.of(context).size.height * 0.7,
              width: MediaQuery.of(context).size.width,
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 500.0,
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.70,
                  enlargeCenterPage: true,
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                ),
                carouselController: _carouselController,
                items: categories.map((category) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: BoxDecoration(
                            color: kwhiteColor,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Container(
                                  height: 320,
                                  margin: const EdgeInsets.only(top: 30),
                                  clipBehavior: Clip.hardEdge,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child:
                                          Image.asset(category.imageFileName)),
                                ),
                                const SizedBox(height: 20),
                                Text(
                                  category.title,
                                  style: const TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                // rating
                                const SizedBox(height: 20),
                                Text(
                                  category.title,
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.grey.shade600),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 20),
                                AnimatedOpacity(
                                  duration: const Duration(milliseconds: 500),
                                  opacity: currentIndex ==
                                          categories.indexOf(category)
                                      ? 1.0
                                      : 0.0,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.star,
                                              color: Colors.yellow,
                                              size: 20,
                                            ),
                                            const SizedBox(width: 5),
                                            Text(
                                              '4.5',
                                              style: TextStyle(
                                                  fontSize: 14.0,
                                                  color: Colors.grey.shade600),
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.access_time,
                                              color: Colors.grey.shade600,
                                              size: 20,
                                            ),
                                            const SizedBox(width: 5),
                                            Text(
                                              '2h',
                                              style: TextStyle(
                                                  fontSize: 14.0,
                                                  color: Colors.grey.shade600),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.2,
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.play_circle_filled,
                                                color: Colors.grey.shade600,
                                                size: 20,
                                              ),
                                              const SizedBox(width: 5),
                                              Text(
                                                'Watch',
                                                style: TextStyle(
                                                    fontSize: 14.0,
                                                    color:
                                                        Colors.grey.shade600),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ));
                    },
                  );
                }).toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
